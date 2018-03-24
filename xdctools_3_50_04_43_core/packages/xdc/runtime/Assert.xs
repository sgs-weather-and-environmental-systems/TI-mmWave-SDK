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
 *  ======== Assert.xs ========
 */

/*
 *  ======== validate ========
 */
function validate()
{

    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    var Diags = xdc.module('xdc.runtime.Diags');

    for (var i = 0; i < xdc.om.$modules.length; i++) {
        var mod = xdc.om.$modules[i];

        /* check all Assert_Desc's declared in any module */
        if ('$$assertDescCfgs' in mod && mod.$$assertDescCfgs.length > 0) {
            for each (var cn in mod.$$assertDescCfgs) {
                var desc = mod[cn];

                /* if desc.mask is undefined, don't let config complain */
                if (desc.mask === undefined) {
                    desc.mask = Diags.ASSERT;
                }

                /* check that mask is within UInt16 range */
                if (desc.mask < 0) {
                    this.$logError("value of 'mask' must be non-negative",
                        mod, cn);
                }
                else if (desc.mask > 0xFFFF) {
                    this.$logError("value of 'mask' must be at most 16 bits",
                        mod, cn);
                }
            }
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj, params)
{
    var Diags = xdc.module('xdc.runtime.Diags');
    var Text = xdc.module('xdc.runtime.Text');

    /* for every module in the system ... */
    for (var i = 0; i < xdc.om.$modules.length; i++) {
        var mod = xdc.om.$modules[i];

        /* create an Id for all Assert_Desc's declared in the module.
         * The array $$assertDescCfgs was created when processing specs and
         * creating schemas for the specific purpose of grouping Assert
         * descriptors, so they are easy to find at this time.
         */
        if ('$$assertDescCfgs' in mod && mod.$$assertDescCfgs.length > 0) {
            for each (var cn in mod.$$assertDescCfgs) {
                var desc = mod[cn];
                desc.$private.id = Text.defineRopeCord(desc.msg);

                desc.$unseal("mask");
                if (desc.mask === undefined) {
                    desc.mask = Diags.ASSERT;
                }
                else {
                    /* If mask is null or undefined, JavaScript converts it to
                     * 0 before evaluating the bitwise operation.
                     */
                    desc.mask |= Diags.ASSERT;
                }
                desc.$seal("mask");
            }
        }
    }
}

/* The three functions below must exist for each encoded type defined in this
 * module's spec. sizeof and alignof are invoked if the encoded type is used
 * in a structure, while encode is used when a value of the encoded type
 * needs to be represented on the target.
 * In this case, the encoded type is 'Id', which is why the function names
 * start with that prefix.
 */

/*
 *  ======== Id$alignof ========
 *  Return alignment required for an encoded value of a Desc
 */
function Id$alignof()
{
    return (Program.build.target.stdTypes.t_Int32.align);
}

/*
 *  ======== Id$encode ========
 *  Return a C expression that evaluates to the encoded value of a Desc
 */
function Id$encode(desc)
{
    var encodedDesc = "0";
    if (desc) {
        encodedDesc = "(((xdc_runtime_Assert_Id)" + desc.$private.id
            + ") << 16 | " + (desc.mask & 0xFFFF) + ")";
    }
    return (encodedDesc);
}

/*
 *  ======== Id$sizeof ========
 *  Return sizeof the encoded value of a Desc
 */
function Id$sizeof()
{
    return (Program.build.target.stdTypes.t_Int32.size);
}

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

