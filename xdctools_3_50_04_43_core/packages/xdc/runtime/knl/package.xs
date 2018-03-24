/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
 
/*
 *  ======== close ========
 */
function close()
{
    if (this.SemThread.$used) {
        if (this.SemThread.Proxy == null) {
            print(this.$name + ".close() - WARNING: SemThread.Proxy has " +
                  "not been set!");
        }
        else {
            this.SemThread.Proxy.delegate$.common$.fxntab = false;
        }
    }

    if (this.SemProcess.$used) {
        if (this.SemProcess.Proxy == null) {
            print(this.$name + ".close() - WARNING: SemProcess.Proxy has " +
                  "not been set!");
        }
        else {
            this.SemProcess.Proxy.delegate$.common$.fxntab = false;
        }
    }

    if (this.GateThread.$used) {
        if (this.GateThread.Proxy == null) {
            print(this.$name + ".close() - WARNING: GateThread.Proxy has " +
                  "not been set!");
        }
        else {
            this.GateThread.Proxy.delegate$.common$.fxntab = false;
        }
    }

    if (this.GateProcess.$used) {
        if (this.GateProcess.Proxy == null) {
            print(this.$name + ".close() - WARNING: GateProcess.Proxy has " +
                  "not been set!");
        }
        else {
            this.GateProcess.Proxy.delegate$.common$.fxntab = false;
        }
    }

    if (this.Thread.$used) {
        if (this.Thread.Proxy == null) {
            print(this.$name + ".close() - WARNING: Thread.Proxy has " +
                  "not been set!");
        }
        else {
            this.Thread.Proxy.delegate$.common$.fxntab = false;
        }
    }

}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

