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
 *  ======== Error.xs ========
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

    var System = xdc.module('xdc.runtime.System');
    var noBigS = (System.extendedFormats == null)
        || System.extendedFormats.indexOf('%$S') == -1;

    for (var i = 0; i < xdc.om.$modules.length; i++) {
        var mod = xdc.om.$modules[i];

        /* check all Error_Desc's declared in any module */
        if ('$$errorDescCfgs' in mod && mod.$$errorDescCfgs.length > 0) {
            for each (var cn in mod.$$errorDescCfgs) {
                var desc = mod[cn];

		/* if %$S is not suported by System, check that no error
		 * uses this format.  If it does, trigger a warning.
		 */
		if (noBigS) {
		    if (desc.msg.indexOf('%$S') != -1) {
			this.$logWarning("the message for this error (= '"
                            + desc.msg
                            + "') requires %$S support but xdc.runtime.System.extendedFormats (= '"
                            + System.extendedFormats
                            + "') does not include '%$S'", 
					 mod, cn);
		    }
		}

                /* if desc.code is undefined, no problem */
                if (desc.code === undefined) {
                    continue;
                }

                /* check that code is within UInt16 range */
                if (desc.code < 0) {
                    this.$logError("value of code must be non-negative",
                        mod, cn);
                }
                else if (desc.code > 0xFFFF) {
                    this.$logError("value of code must be at most 16 bits",
                        mod, cn);
                }
            }
        }
    }

    /* policFxn should not be null */
    if (this.policyFxn == null) {
        this.$logError("The configuration parameter policyFxn cannot be null.",
                       this, "policyFxn");
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj, params)
{
    var internalCounter = 1;
    obj.count = 0;

    var Text = xdc.module('xdc.runtime.Text');
    for (var i = 0; i < xdc.om.$modules.length; i++) {
        var mod = xdc.om.$modules[i];

        /* create an Id for all Error_Desc's declared in the module */
        if ('$$errorDescCfgs' in mod && mod.$$errorDescCfgs.length > 0) {
            for each (var cn in mod.$$errorDescCfgs) {
                var desc = mod[cn];
                if (Text.isLoaded) {
                    desc.$private.id = Text.defineRopeCord(desc.msg);
                }
                else {
                    desc.$private.id = internalCounter++;
                }

                if (desc.code === undefined) {
                    desc.$unseal("code");
                    desc.code = 0;
                    desc.$seal("code");
                }
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
        encodedDesc = "(((xdc_runtime_Error_Id)" + desc.$private.id
            + ") << 16 | " + (desc.code & 0xFFFF) + ")";
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

