/* --COPYRIGHT--,EPL
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * --/COPYRIGHT--*/
var urlbase = location.href;
if (location.hash) {
    urlbase = urlbase.substring(0, urlbase.indexOf("#"));
}
urlbase = urlbase.substring(0, urlbase.lastIndexOf("/"));

function onLoad() {
    if (!location.hash) {
        return;
    }

    var href;
    var dname;
    var wasxml = false;

    var m = location.hash.match(/^#([^#:]*\.html)([#:](.*))?$/);
    if (m) {
        href = m[1];
        dname = m[3];
    }
    else {
        m = location.hash.match(/^#([^#:]*\.xml)([#:](.*))?$/);
        if (m) {
            href = m[1].replace(/\.xml/, '.html');
            dname = m[3];
            wasxml = true;
        }
    }

    m = location.hash.match(/^#([^:]*)\.html(:([^\.]*))?$/);
    if (m) {
        href = m[1] + ".html";
        dname = m[3] && m[3].replace(/([A-Z])/g, '.$1');
        dname = dname && dname.replace(/\//g, '');
    }

    if (dname) {
        href += "#" + dname;
    }

    if (href) {
        top.frames.body.location.replace(urlbase + "/" + href);
        if (wasxml) {
  	    var indexbase = location.href;
	    indexbase = indexbase.substring(0, indexbase.indexOf("#"));
	    if (indexbase.match(/index\.html$/)) {
	        location.href = indexbase + "#" + href;
	    }
            else {
                location.href = urlbase + "/" + href;
            }
        }
    }
}

window.onload = onLoad;
