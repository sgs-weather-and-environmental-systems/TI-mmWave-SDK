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
 *  ======== Script.xdc ========
 */
package xdc.bld;

/*!
 *  ======== Script ========
 *  Model of a script
 */
metaonly module Script {
    /*!
     *  ======== Attrs ========
     *  Optional attributes for a script instance.
     *
     *  @field(releases)  This array contains releases that will contain the
     *          script.  Thus, a single script can be part of any set of
     *          releases.  Each script is always added to the package's
     *          "default release" in addition to any releases specified in
     *          the releases array.
     *
     *  @field(hasMain)  This script defines a `main()` function.  This
     *          function is called after the capsule is loaded.  If the
     *          script does not define `main()`, it must contain statements
     *          that will run script as part of loading the script.
     *
     *  @field(exportSrc) Scripts are added to the default release
     *          unless this flag is set to `false`.
     *
     *  @see #attrs
     */
    struct Attrs {
        Bool hasMain;       /*! if true, this script defines main()  */
        Bool exportSrc;     /*! if false, don't add to default release */
        Release.Instance releases[];  /*! releases this script is a part of */
    };

instance:
    /*!
     *  ======== create ========
     *  @_nodoc
     *  Instances should only be created via PackageContents.addScript()
     */
    create();

    config String name;
    
    /*!
     *  ======== attrs ========
     *  Optional attributes for this test instance.
     *
     */
    config Script.Attrs attrs;

    /*!
     *  ======== addTest ========
     *  Add specified test to script
     *
     *  A test encapsulates a script and a set of arguments passed to
     *  the script when it is run.
     *
     *  Tests are run by naming the goal "<test_name>.test" on the xdc
     *  command line; <test_name> is the test's name.
     *
     *  Multiple tests may have the same name; in this case, it is possible
     *  to run all tests using the single goal "<test_name>.test" 
     *
     *  @param(testAttrs)   optional test attrs object
     *                      (`{@link xdc.bld.Test#Attrs}`)
     *
     *  @a(returns)         Returns the `{@link xdc.bld.Test}` instance object
     *                      created.
     *
     *  @a(throws)          `Error` exceptions are thrown for fatal errors.
     *
     *  @see xdc.bld.Test
     *  @see xdc.bld.Test#Attrs
     */
    Test.Instance addTest(Test.Attrs testAttrs = {});
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

