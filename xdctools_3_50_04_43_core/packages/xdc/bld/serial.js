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
/*
 *  ======== serialize ========
 */
function serialize(obj, indent)
{
    if (indent == null) {
	indent = "";
    }
    if (obj == null) {
	return ("null");
    }

    var prefix = "";
    var s = "{";
    
    for (var i in obj) {
	var next;
	if (typeof obj[i] == 'object'
	    || typeof obj[i] == 'function') {
	    next = serialize(obj[i], indent + "    ");
	}
	else if (typeof obj[i] == 'number'
		 || typeof obj[i] == 'boolean') {
	    next = obj[i];
	}
	else if (typeof obj[i] == 'string') {
	    next = '"' + escape(obj[i]) + '"';
	}
	else {
	    continue;	// skip over unknown types *and* undefined
	}
	s += prefix + i + ": " + next;
	prefix = ", ";
    }
    s += "}";

//    print(s);
    return (s);
}

/*
 *  ======== unserialize ========
 */
function unserialize(s)
{
    var obj = eval("(" + s + ")");
    return (runescape(obj));
}

/*
 *  ======== display ========
 */
function display(msg, obj)
{
    function genObj(indent, obj)
    {
	if (indent.length >= 16) {
	    return ("...");
	}
	var pindent = "    " + indent;
	
	var str = '' + obj;
	if (obj != null) {
	    str += " {\n";
	    var i;
	    for (i in obj) {
		str += pindent + i + " = " + gen(pindent, obj[i]) + "\n";
	    }
	    str += indent + "}\n";
	}
	return (str);
    }
    function gen(indent, obj)
    {
	if (obj == null) {
	    return (obj + '');
	}
	else if (typeof obj == "object") {
	    return (genObj(indent, obj));
	}
	else {
	    return (obj + '');
	}
    }

    print(msg + gen('', obj));
}

function test()
{
    var obj = {test: {test: "%%this %is\\\\\\ \\\n'a test' != \\\"\" \\"}};

    var s = serialize(obj);
    print(s);
    var tmp = unserialize(s);

    display("tmp = ", tmp);
    if (tmp.test.test != obj.test.test) {
	throw new Error("compare failed");
    }
}

test();
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:17; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

