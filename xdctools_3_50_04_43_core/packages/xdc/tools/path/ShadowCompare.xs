/* 
 *Copyright (c) 2008 Texas Instruments and others.
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
 *  ======== comparePackageDirs ========
 *
 *  returns an array of objects:
 *
 *  resutlsObj {
 *      repo
 *      pkg
 *      list of files not present in repostitories
 *        preceding repo in input param repoArr
 *  }
 *
 *
 */
function comparePackageDirs(pkgName, repoArr)
{
    var resultsArr = [];

    /* create a new array with full paths to the package pkgName */
    var pkgFullPathArr = [];
    var pkgDir = ("" + pkgName).replace(/\./g, '/');
    for (var i = repoArr.length - 1; i >= 0; --i) {
        pkgFullPathArr.push(repoArr[i] + "/" + pkgDir);
    }

    /* search each full path for shadows */
    for (var i = 0; i < pkgFullPathArr.length - 1; i++) {
        if (java.io.File(pkgFullPathArr[i]).exists()) {
            var results = [];
            _compareDirContents(pkgFullPathArr[i], pkgFullPathArr,
                                i + 1, results);
            if (results.length > 0) {

                var resultsObj = {};
                resultsObj.repo = pkgFullPathArr[i].substr(0,
                                  pkgFullPathArr[i].length - pkgDir.length - 1);
                resultsObj.pkg = pkgName;
                resultsObj.filelist = [];
                for each (var r in results) {
                    resultsObj.filelist.push(
                               r.substr(pkgFullPathArr[i].length + 1));
                }
                resultsArr.push(resultsObj);
            }
        }
    }

    return (resultsArr);
}

/*                                                        
 *  ======== _compareDirContents ========              
 *
 */                                       
function _compareDirContents(dir, searchDirsArr, startIndex, results)
{
    var dirFile = java.io.File(dir);
    for each (var f in dirFile.listFiles()) {    
        if (f.isDirectory()) {
            if (!f.getName().compareTo("package")) {
                continue;
            }
            if (java.io.File(f.getCanonicalPath() + "/package.xdc").exists()) {
                continue;
            }
        }

        var fname = f.getName();
        found = false;
        for (var i = startIndex; i < searchDirsArr.length; i++) {

            var newName = searchDirsArr[i] + "/" + fname;
            if (java.io.File(newName).exists()) {
                found = true;
                break;
            }
        }
        if (!found) {  /* record it */
            if (!(f.isDirectory() && f.listFiles().length == 0)) {
                results.push(f.getCanonicalPath());
            }
        }
        else if (f.isDirectory()) {

            /* create a new searchDirsArray of full paths */
            var newSearchDirsArr = [];
            for each (var d in searchDirsArr) {
                newSearchDirsArr.push(d + "/" + fname);
            }

            _compareDirContents(f.getCanonicalPath(),
                                newSearchDirsArr, startIndex, results);
        }
    }
}
/*
 *  @(#) xdc.tools.path; 1, 0, 0,0; 1-9-2017 12:51:40; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

