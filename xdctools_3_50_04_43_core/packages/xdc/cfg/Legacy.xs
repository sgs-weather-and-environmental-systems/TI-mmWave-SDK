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

function _myTrace(msg, level, group){};

/*
 *  ======== tsort ========
 *  The legacy tsort algorithm 
 */
function tsort()
{
    var genList = [];

    /* Here we need to go through xdc.om.$require map and put the packages
     * from genList in order determined by dependencies from xdc.om.$require.
     */
//    print("_genDependencyList: (requires)"); for (var key in xdc.om.$require) print("    " + key);
//    _Clock.print("tsort:start (" + xdc.om.$require.length + " edges, " + xdc.om.$packages.length + " pkgs)");

    while (xdc.om.$require.length > 0) {

	/* select a package with no requirements; i.e., a leaf node */
        var selected = null;
        for (var key in xdc.om.$require) {
            var candidate = xdc.om.$require[key];

            var leaf = 1;
            for (var key2 in xdc.om.$require) {
                if (key2.split(/\s/)[0] == candidate) {
                    //print("found dependency on " + xdc.om.$require[key2]);
                    leaf = 0;
                    break;
                }
            }
            if (leaf == 1) {
                selected = candidate;
                break;
            }
        }

        if (selected == null) {
            /* There is a cycle in remaining dependencies. Find a package
             * from the cycle and use it as 'selected'. If there is a cycle,
             * the program is bogus anyway, so we just try to recover using a
             * random ordering and see if it goes through.
             * There could be some packages remaining that are not a part of
             * the cycle. If we just follow the cycle for the number of steps
             * equal to the number of packages, we are going to end up with one
             * of the packages from the cycle. That way, when we remove one of
             * the dependencies for a package from the cycle, we will actually
             * break the cycle (or one of the cycles).
             */
            selected = xdc.om.$require[0];
            var cycleStart;
            var counter = xdc.om.$packages.length - genList.length;
            while (counter > 0) {
                for (var key in xdc.om.$require) {
                    if (key.split(/\s/)[0] == selected) {
                        selected = xdc.om.$require[key];
                        cycleStart = key;
                        counter--;
                    }
                }
            }

            _myTrace(
                "warning: cycle detected involving the following packages:", 1,
                ["packageLoad"]);
            var next = xdc.om.$require[cycleStart];
            _myTrace("    " + cycleStart.split(/\s/)[0] + " --> " + next, 1,
                ["packageLoad"]);
            while (next != selected) {
                for (var key in xdc.om.$require) {
                    if (key.split(/\s/)[0] == next) {
                        next = xdc.om.$require[key];
                        _myTrace("   " + key.split(/\s/)[0] + " --> " + next, 1,
                            ["packageLoad"]);
                        break;
                    }
                }
            }

            /* Promote dependencies of the removed package, so they
             * are not completely lost when the cycle is broken.
             * Normally when a package is removed in this function it
             * is a leaf node -- it has no remaining dependencies. But in
             * this section we are breaking a cycle -- the package we will
             * remove still has remaining dependencies. The following code
             * essentially grafts together the incoming and outgoing
             * edges of the package about to be removed. By doing so
             * we at least retain the derivable constraints between the
             * packages "above" and "below" the removed package.
             */
            /* first find all the dependencies of the package about to
             * be removed (call these "child" packages)
             */
            var children = [];
            for (var key in xdc.om.$require) {
                var parent = key.split(/\s/)[0];
                if (parent == selected) {
                    children.push(xdc.om.$require[key]);
                }
            }

            /* next find all the packages that depend on the one about
             * to be removed (call these "grandparent" packages)
             */
            for (var key in xdc.om.$require) {
                var grandparent = key.split(/\s/)[0];
                var parent = xdc.om.$require[key];
                if (parent == selected) {
                    /* and add explicit dependencies from the grandparent
                     * packages to the child packages.
                     */
                    for each (var child in children) {
                        if (grandparent == child) {
                            /* no need to record a dependency on yourself */
                            continue;
                        }

                        /* record the dependency */
                        xdc.om.$require[grandparent + " " + child] = child;
                    }
                }
            }
        }

	/* append the selected leaf to the end of genList */
        genList.push(xdc.om[selected]);
        xdc.om[selected].$$bind('$$genflg', 1);

        /* Remove all elements from $require that have 'selected' as a
         * second element; i.e., edges that reference the selected leaf
         */
        for (var key in xdc.om.$require) {
            if (xdc.om.$require[key] == selected) {
                /* A very important assumption here is that 'key' shows up in
                 * the remaining dependencies as 'value. That must be true
                 * because someone must have loaded 'key', and since we haven't
                 * moved 'key' into the final list, that dependency hasn't been
                 * removed yet.
                 */
                //print("deleted " + key.split(/\s/)[0] + " -> " + key.split(/\s/)[1]);
                delete xdc.om.$require[key];
            }
        }
    }

    /* get $homepkg out of the list and add it at the end to ensure its
     * libraries will end up at the top of the linker command file.
     */
    for (var i = 0; i < genList.length; i++) {
        if (genList[i] == xdc.om.$homepkg) {
            genList.splice(i, 1);
            genList.push(xdc.om.$homepkg);
            break;
        }
    }

//    print("_genDependencyList:");for (var i in genList) print("    " + genList[i]);

    /* update the official list of packages */
    return (genList);
}

/*
 *  ======== test ========
 */
function test(oldList, newList)
{
    /* check that it produces the "same" results */
    if (oldList.length != newList.length) {
	throw Error("tsort algorthms returned different length package sets: "
                    + oldList.length + " != " + newList.length);
    }

    /* verify that each pkg in newList appears in oldList */
    var len = newList.length;
    for (var i = 0; i < len; i++) {
        var pname = newList[i].$name;
        for (var j = 0; j < len; j++) {
            if (oldList[j].$name == pname) {
                break;
            }
        }
        if (j >= len) {
            throw Error("tsort algorthms resulted in different package sets: "
                        + newList[i] + " not found");
        }

        /* verify that $$genflg was properly set by the new tsort: all
         * packages in oldList had their $$genflag set by the old tsort,
         * but only those with $$inDegree set were set by the new tsort.
         */
        if (!"$$inDegree" in newList[i]) {
            throw Error("new tsort didn't properly set $$genflg for: "
                        + newList[i]);
        }            
    }

    /* check order of packages that contain libraries */
    var ntPkgs = [];
    var otPkgs = [];
    for (var i = 0; i < len; i++) {
        var pkg = newList[i];
        if (pkg.build.libraries.length > 0) {
            ntPkgs.push(pkg);
        }
        pkg = oldList[i];
        if (pkg.build.libraries.length > 0) {
            otPkgs.push(pkg);
        }
    }

    for (var i = 0; i < otPkgs.length; i++) {
        if (otPkgs[i].$name != ntPkgs[i].$name) {
            print("warning library order difference:");
            print("    old: " + otPkgs);
            print("    new: " + ntPkgs);
	    //print("    full old list: " + oldList);
	    //print("    full new list: " + newList);
	    break;
        }
    }
}

/*
 *  ======== validate ========
 *  validate the topological sort
 */
function validate(genList, requireList)
{
    /* for each "start->end" edge ... */
    for (var edge in requireList) {
        var nodes = edge.split(/\s/);

	/* verify that the end node appears _before_ the start node */
        for (var i = 0; i < genList.length; i++) {
            var name = genList[i];
            if (name == nodes[0] || name == nodes[1]) {
		/* if start (node[0]) appears first, there's a problem */
                if (name == nodes[0]) {
                    var pkg1 = xdc.om[nodes[1]];
                    var pkg0 = xdc.om[nodes[0]];
		    /* only warn if this edge involves libraries */
                    if ((pkg0 && pkg0.build.libraries.length > 0)
		       || (pkg1 && pkg1.build.libraries.length > 0)) {
                        print("xdc.cfg.Legacy: tsort failed on "
                              + nodes[0] + " --> " + nodes[1]);
                    }
                }
		/* otherwise, we're ok and can proceed to next edge */
                else {
                    break;
                }
            }
        }
    }
}
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

