/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */

/**
 *  ======== Graph.xs ========
 *  Capsule to support topological sorts: sort nodes in order of finishing
 *  time in a Depth-First Search (i.e., lowest to highest)
 */
var debug = print;
debug = function (){};	/* comment out this line for trace debug */

/**
 *  ======== Node ========
 *  A Graph is a collection of Node's.  This is the Node constructor.
 *
 *  @param name name of this node
 *  @param graph the Graph that this node is a part of.
 */
function Node(name, graph)
{
    this.name = name;	    /* name of this node */
    this.graph = graph;	    /* graph that this node belongs to */
    this.adj = [];	    /* nodes directly reachable from this */
    this.inv_adj = [];	    /* nodes that directly point to this */

    this.reset();	    /* initialize the other fields of a Node */
};

/**
 *  ======== Node.pointsTo ========
 *  Establish a directed arc from this node to the specified node.
 *
 *  @param node the node that <this> node should be connected to
 *  @return void
 */
Node.prototype.pointsTo = function (node) 
{
    if (this.adj[node.name] == null) {	/* avoid adding duplicate arcs */
	this.adj[node.name] = node;

	this.adj[this.adj.length] = node;
	node.inv_adj[node.inv_adj.length] = this;
    }
};

/**
 *  ======== Node.reset ========
 *  Initialize fields of Node that are modified during traversal.
 *
 *  @return void
 */
Node.prototype.reset = function () 
{
    this.color = "white";
    this.finish = 0;
    this.discovery = 0;
};

/**
 *  ======== getInDegree ========
 *  Get the in-degree of this node
 *  @return int
 */
Node.prototype.getInDegree = function () 
{
    return (this.graph.mode == "forward"
            ? this.inv_adj.length : this.adj.length);
};

/**
 *  ======== Node.toString ========
 *  Convert this node to a string.
 *
 *  @return the name of this node
 */
Node.prototype.toString = function ()
{
    return (this.name);
};

/**
 *  ======== Instance ========
 *  Constructor for a Graph instance
 *
 *  @param name the name of the graph
 */
function Instance(name, error)
{
    this.name = name;	    /* name of this graph */
    this.error = error;     /* error function to call */
    this.nodes = [];	    /* array of nodes */
    this.mode = "forward";  /* mode is used to reverse the direction of arcs */
    this.stack = [];        /* stack of "grey" nodes, for cycle reporting */
};

/**
 *  ======== Instance.reverse ========
 *  Reverse the direction of all arcs in the graph.  
 * 
 *  This allows one to easily determine reachability by reusing
 *  DFS traversal.
 *
 *  @return void
 */
Instance.prototype.reverse = function ()
{
    this.mode = (this.mode == "forward") ? "reverse" : "forward";
};

/**
 *  ======== Instance.toString ========
 *  Convert this graph to a string.
 *
 *  @return the name of this graph.
 */
Instance.prototype.toString = function ()
{
    return (this.name);
};

/**
 *  ======== Instance.mkNode ========
 *  Add a Node to this Graph.
 *
 *  @param name the name of the node to create and add to the graph
 *  @return the newly created node (or the already existing node).
 */
Instance.prototype.mkNode = function (name)
{
    var node = this[name];
    if (node == null) { 
	node = new Node(name, this);
	this.nodes[this.nodes.length] = node;
	this[name] = node;
    }
    return (node);
};

/**
 *  ======== Instance.dfs ========
 *  Do a DFS traversal of this Graph.
 *
 *  @param fxn function to call as each node is visited.
 *  @param start node to start from within the graph.
 */
Instance.prototype.dfs = function(fxn, start)
{
    var time = 0;

    debug(this + ".dfs("+ fxn.toString().split(" ")[1] +")");
    
    for (var i = 0; i < this.nodes.length; i++) {
	this.nodes[i].reset();
    }

    if (arguments.length < 2) {
	for (var i = 0; i < this.nodes.length; i++) {
	    if (this.nodes[i].color == "white") {
		debug("dfsVisit starting from " + this.nodes[i] + " ...");
		dfsVisit(this.nodes[i], fxn);
	    }
	}
    }
    else {
	debug("dfsVisit starting from " + start + " ...");
	dfsVisit(start, fxn);
    }

    /*
     *  ======== dfsVisit ========
     */
    function dfsVisit(node, fxn)
    {
	debug("dfsVisit(" + node + ", ...)");

	var adj = node.graph.mode == "forward" ? node.adj : node.inv_adj;
	
	node.color = "grey";
	node.discovery = ++time;
        node.graph.stack.push(node);

	for (var i = 0; i < adj.length; i++) {
	    if (adj[i].color == "white") {
		dfsVisit(adj[i], fxn);
	    }
	    else if (adj[i].color == "grey") {
		var graph = adj[i].graph;
		var cycle = [];
		var prefix = "cycle detected in graph " + graph
		      + " starting at: " + adj[i];
		for (var j = graph.stack.length - 1; j >= 0; j--) {
		    cycle.push(graph.stack[j]);
		    if (graph.stack[j].name == adj[i].name) {
			break;
		    }
		}
		if (graph.error != null) {
		    graph.error(adj[i], prefix, cycle);
		}
		else {
		    print(prefix + "\n    " + cycle.join(" <-- "));
		}
	    }
	}

	/* mark node as having been visited */
	node.color = "black";
	node.finish = ++time;

	/* pop it off the "search" stack and call user's visit fxn */
        node.graph.stack.pop();
	fxn(node, time);
    }
};

/**
 *  ======== Instance.tsort ========
 *  Ordinary topological sort of the nodes.  Returns an array
 *  of all graph nodes in topological order.
 *
 *  @return an array of all graph nodes in topological order
 */
Instance.prototype.tsort = function ()
{
    var list = [];

    debug("tsort(" + this + ")");

    function append(finished) {
	list[list.length] = finished;
    }

    this.dfs(append);

    return (list);
};

/**
 *  ======== Instance.tsort2 ========
 *  Constrained topological sort of the nodes.  Returns an array
 *  of all graph nodes in topological order where nodes listed in
 *  lateList appear "as late as possible" and nodes that appear in
 *  the early list appear "as early as possible".
 *
 *  To make nodes appear as "early as possible" we simply start with
 *  these nodes in the DFS.
 *
 *  To make nodes appear as "late as possible" we first visit all nodes
 *  that can not reach the nodes in the lateList.
 *  <P>
 *  Note: when more than one node appears in the lateList, there is no
 *  well defined solution.  Thus, we apply a heuristic that treats the
 *  first node in the lateList as the "most important".
 *  <P>
 *  This is done by successively partitioning the set of nodes into
 *  groups that are ordered such that the nodes in the first group will
 *  be visited before the nodes in the second, etc.  We place nodes that
 *  can not reach "late as possible" nodes in earlier groups.
 *  <P>
 *  For example, the partitioning might proceed as follows:  <P>
 *      [{earliest nodes}, {remaining graph nodes}]  <P>
 *  <P>
 *	[{earliest nodes}, {can't reach lateList[0]}, {remaining nodes}]  <P>
 *  <P>
 *	[{earliest nodes}, {can't reach lateList[0] or lateList[1]},  <P>
 *	    {can't reach lateList[0] and can reach lateList[1]}  <P>
 *	    {remaining nodes}]
 *  <P>
 *  Once the partitioning is complete, we reorder the graph nodes in the
 *  order determined by the partitioning and simply call ordinary tsort
 *  (which starts with nodes that appear earlier in the node array first).
 *
 *  @param lateList array of nodes that should appear as "late as possible"
 *  @param earlyList array of nodes that should appear as "early as possible"
 *  @return an array of all graph nodes in topological order
 */
Instance.prototype.tsort2 = function (lateList, earlyList)
{
    /*
     *  ======== split ========
     *  Returns [{setA & setB}, {setA - setB}] if {setA & setB} is non-empty,
     *  otherwise split() returns null.
     */
    function split(setA, setB)
    {
	var count = 0;

	/* compute intersection (setA & setB) and difference (setA - setB) */
	var intersection = {};
	var difference = {};
	for (var i in setA) {
	    if (setB[i] != null) {
		intersection[i] = setA[i];
		count++;
	    }
	    else {
		difference[i] = setA[i];
	    }
	}

	/* if intersection is empty, return null */
	if (count == 0) {
	    return (null);
	}

	/* return array with intersection and difference */
	return (new Array(intersection, difference));
    }

    /* pre-order graph nodes so lateList nodes appear "as late as possible" */

    /* initialize partsArray to [{all graph nodes}] */
    var partsArray = [];
    var set = {};
    for (var i = 0; i < this.nodes.length; i++) {
	set[this.nodes[i].name] = this.nodes[i];
    }
    partsArray[0] = set;

    /* if necessary, split into [{early nodes}, {remaining graph nodes}] */
    if (arguments.length > 1 && earlyList.length != 0) {
	var set = {};
	for (var i = 0; i < earlyList.length; i++) {
	    set[earlyList[i].name] = earlyList[i];
	}
	partsArray = split(partsArray[0], set);
    }

    /* for n in lateList, split first set that contains node that reaches n */
    for (var j = 0; j < lateList.length; j++) {
	var can = this.canReach(lateList[j]);

	/* find first set that contains a node that can reach lateList[j] */
	for (i = 0; i < partsArray.length; i++) {
	    var tmp;

	    /* split this set into two placing the unreachables first */
	    if ((tmp = split(partsArray[i], can)) != null) {
		partsArray.splice(i, 1, tmp[1], tmp[0]);
		break;
	    }
	}
    }

    /* copy nodes from ordered partition into graph's node array */
    for (j = i = 0; i < partsArray.length; i++) {
	for (var n in partsArray[i]) {
	    this.nodes[j++] = (partsArray[i])[n];
	}
    }
    
    /* run ordinary tsort() on newly ordered nodes */
    return (this.tsort());
};

/**
 *  ======== Instance.canReach ========
 *  Returns an array of nodes that can reach the specified node.
 *
 *  @param node node to be reached
 *  @return an array of nodes that can reach <node>.
 */
Instance.prototype.canReach = function (node)
{
    var set = {};

    debug(this + ".canReach(" + node + ")");

    function append(finished) {
	set[finished.name] = finished;
    }

    this.reverse();		/* reverse the node arrows */
    this.dfs(append, node);	/* decend new graph */
    this.reverse();		/* restore node arrows */
    
    return (set);
};

/*
 *  ======== test ========
 */
var test = function ()
{
    var graph = new Instance("test");
    
    graph.mkNode("mem");
    graph.mkNode("clk");
    graph.mkNode("gbl");
    graph.mkNode("hwi");
    graph.clk.pointsTo(graph.gbl);
    graph.clk.pointsTo(graph.mem);
//    graph.gbl.pointsTo(graph.clk);

    print("Default order:   " + graph.tsort());

    if (true) {
	print("With MEM latest: " + graph.tsort2([graph.mem]));
	print("With GBL latest: " + graph.tsort2([graph.gbl]));
	print("With CLK latest: " + graph.tsort2([graph.clk]));
	print("With HWI latest: " + graph.tsort2([graph.hwi]));
	print("With all latest: "
	    + graph.tsort2([graph.mem, graph.gbl, graph.clk]));

	print("With MEM early: "
	    + graph.tsort2([], [graph.mem]));
	print("With HWI late and MEM early: "
	    + graph.tsort2([graph.hwi], [graph.mem]));
    }
};
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

