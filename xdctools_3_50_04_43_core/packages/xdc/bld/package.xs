/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== package.xs ========
 */

/*
 *  ======== Package.exit ========
 *  Finalize this package
 */
function exit() {
//    print(this.$name + ".exit() ...");
}

/*
 *  ======== Package.init ========
 *  Initialize this package.
 *
 *  This is called after the bld package schema has completely finished; i.e.,
 *  at the very end of the "include('xdc.bld')" processing.
 */
function init () {

    this.BuildEnvironment.onInit();
    this.PackageContents.onInit();

    /* determine hostOSName */
    this.BuildEnvironment.hostOSName = "" + environment["xdc.hostOS"];

    if (this.BuildEnvironment.hostOSName == null) {
        if (environment["file.separator"] == "/") {
            this.BuildEnvironment.hostOSName = "Linux";
        }
        else {
            this.BuildEnvironment.hostOSName = "Windows";
        }
    }

    /* initialize hostOS */
    this.BuildEnvironment.hostOS = this.BuildEnvironment.WINDOWS;
    if (this.BuildEnvironment.hostOSName == "Linux") {
        this.BuildEnvironment.hostOS = this.BuildEnvironment.LINUX;
    }
    else if (this.BuildEnvironment.hostOSName == "MacOS") {
        this.BuildEnvironment.hostOS = this.BuildEnvironment.MACOS;
    }

}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

