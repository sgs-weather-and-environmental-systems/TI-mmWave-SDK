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
function init()
{
    if (xdc.om.$name == "cfgnull") {
        return; /* skip check if we are loaded by xdc/cfg/cfginc.js */
    }
    
    _testEnvironment();
}

/*
 * Test some environment variables required by the org.eclipse.swt.browser
 * package for Linux. This package depends on Mozilla being available in
 * the user's environment.
 */
function _testEnvironment() {
    if (String(environment['os.name']) != 'Linux') {
        return;
    }

    /* test LD_LIBRARY_PATH */
    var LD_LIBRARY_PATH = java.lang.System.getenv('LD_LIBRARY_PATH');
    var mozFiveHomeIsOnPath = false;
    var pluginsIsOnPath = false;
    if (LD_LIBRARY_PATH) {
        var paths = String(LD_LIBRARY_PATH).split(':');

        /* search for $MOZILLA_FIVE_HOME/libxpcom.so */
        for (var i = 0; i < paths.length; i++) {
            var path = paths[i];
            if (java.io.File(path + '/libxpcom.so').exists()) {
                mozFiveHomeIsOnPath = true;
                break;
            }
        }

        /* search for $MOZILLA_FIVE_HOME/plugins/libnullplugin.so */
        for (var i = 0; i < paths.length; i++) {
            var path = paths[i];
            if (java.io.File(path + '/libnullplugin.so').exists()) {
                pluginsIsOnPath = true;
                break;
            }
        }
    }

    /* test MOZILLA_FIVE_HOME */
    var MOZILLA_FIVE_HOME = java.lang.System.getenv('MOZILLA_FIVE_HOME');
    var mozFiveHomeIsSet = false;
    if (MOZILLA_FIVE_HOME) {
        if (java.io.File(MOZILLA_FIVE_HOME + '/libgtkembedmoz.so').exists()) {
            mozFiveHomeIsSet = true;
        }
    }

    /* done if all tests passed */
    if (mozFiveHomeIsSet && mozFiveHomeIsOnPath && pluginsIsOnPath) {
        return;
    }

    /* not OK, so print a warning message */
    print(
        "**** warning: package xdc.tools.sg.swt_linux depends on the\n" +
        "Mozilla browser for some functionality. Your environment doesn't\n" +
        "currently point to Mozilla, so some XDC graphical tools may fail.\n" +
        "To prevent this, please set up the following in your environment:\n"
    );
    if (!mozFiveHomeIsSet) {
        print(
        " - set the MOZILLA_FIVE_HOME environment variable. Its value\n" +
        "   should be the directory that contains the file run-mozilla.sh,\n" +
        "   which you can find using the command:\n" +
        "       locate run-mozilla.sh"
        );
    }
    if (!mozFiveHomeIsOnPath || !pluginsIsOnPath) {
        print(
        " - include $MOZILLA_FIVE_HOME and $MOZILLA_FIVE_HOME/plugins on\n" +
        "   the LD_LIBARARY_PATH, for example using bash syntax:\n" +
        "       export LD_LIBRARY_PATH=\"$MOZILLA_FIVE_HOME:" +
                       "$LD_LIBRARY_PATH\"\n" +
        "       export LD_LIBRARY_PATH=\"$MOZILLA_FIVE_HOME/plugins:" +
                       "$LD_LIBRARY_PATH\"\n"
        );
    }
}
