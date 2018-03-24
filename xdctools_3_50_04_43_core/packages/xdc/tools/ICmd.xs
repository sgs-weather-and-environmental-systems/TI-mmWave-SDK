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
 *  ======== main ========
 */
function main(args)
{
    var mod = this.$orig;
    var inst = mod.create();
    var tid = 0;
    var socket = null;
    var status = undefined;

    if (args == null) {
        args = [];
    }

    if (args[0] && args[0].match(/--thread#/)) {
        var a = args.shift();
        tid = Number(a.substring(a.indexOf('#') + 1));
        socket = Packages.xdc.tools.Server.findSocket(tid);

        if (socket == null) {
            /* client has disconnected before we've even started */
            return 0;
        }
    }
    var cmdr = xdc.module('xdc.tools.Cmdr').create(mod, {
						 tid: tid,
						 socket: socket
    });

    status = cmdr.getopts(inst, args);
    if (status !== undefined) {
	if (status != 0) {
            cmdr.error("");
        }
        return status;
    }

    var res = inst.run(cmdr, args);
    cmdr.time('done');

    if (res instanceof Array) {
        for (var i = 0; i < res.length; i++) {
            cmdr.write(res[i]);
        }
    }
    else if (res) {
        cmdr.write(res);
    }

    if (tid) {
        socket.giveToClient(null);
    }
    else {
        java.lang.System.out.close();
    }

    return 0;
}

/*
 *  ======== exec ========
 */
function exec(args)
{
    var Cmdr = xdc.module('xdc.tools.Cmdr');

    var mod = this.$orig;
    var inst = mod.create();
    var cmdr = Cmdr.create(mod, {context: Cmdr.SCRIPT});

    if (args == null) {
        args = [];
    }
    
    cmdr.getopts(inst, args);
    return (inst.run(cmdr, args));
}

/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    cmdr.error('unimplemented command');
}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

