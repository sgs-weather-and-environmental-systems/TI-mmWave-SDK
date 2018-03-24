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
 *  ======== run ========
 */
function run(cmdr, args)
{
    var inst = this.$private;
    inst.self = this;

    for (p in inst.self) {
        inst[p] = inst.self[p];
    }

    inst.cmdr = cmdr;
    inst.args = args;

    inst.cmdr.verbose(inst.verboseFlag);

    _validate(inst);

    if (inst.arrFlag) {
        inst.resArr = [];
        _echoArr(inst);
        return inst.resArr;
    }
    else if (inst.xmlFlag) {
        inst.resObj = new inst.self.$module.Results;
        _echoXml(inst);
        return inst.resObj.$xml();
    }
    else {
        inst.resStr = '';
        _echoStr(inst);
        return inst.resStr;
    }
}

/*
 *  ======== _echoArr ========
 */
function _echoArr(inst)
{
    inst.cmdr.info('building a string array...');

    if (inst.header) {
        inst.resArr.push(inst.header);
    }

    for each (var a in inst.args) {
        inst.resArr.push(a);
    }
}

/*
 *  ======== _echoStr ========
 */
function _echoStr(inst)
{
    inst.cmdr.info('building a string...');

    if (inst.header) {
        inst.resStr += inst.header + ': ';
    }

    for each (var a in inst.args) {
        inst.resStr += a + ' ';
    }
}

/*
 *  ======== _echoXml ========
 */
function _echoXml(inst)
{
    inst.cmdr.info('building an XML document...');

    inst.resObj.header = inst.header;
    inst.resObj.args = inst.args;
}

/*
 *  ======== _validate ========
 */
function _validate(inst)
{
    if (inst.args.length == 0) {
        inst.cmdr.usage("one or more arguments are required");
    }
}


/*
 *  @(#) xdc.tools.echo; 1, 0, 0,0; 1-9-2017 12:51:27; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

