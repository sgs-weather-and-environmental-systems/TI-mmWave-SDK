requires xdc.platform [1,0,1];

/*!
 *  ======== xdc.platform.generic ========
 *  Platform package for the generic platform.
 *
 *  This package implements the interfaces (xdc.platform.IPlatform)
 *  necessary to build and run executables on a "generic" platform; a
 *  platform specified by:
 *  @p(blist)
 *      - device name; e.g., "TMS320C2812"
 *      - catalog name; the name of a package containing the device named above
 *      - clock rate; the clock rate in MHz of the CPU
 *      - external memory map; an array of memory blocks external to the device
 *  @p
 *  For a complate list of parameters that can be specified when creating a
 *  platform instance see the instance configuration parameters specified
 *  by `{@link xdc.platform.generic.Platform}`.  This list, of course,
 *  includes all the instance config parameters specified by the
 *  `{@link xdc.platform.IPlatform}` interface.
 *
 *  @a(Throws)
 *  `XDCException` exceptions are thrown for fatal errors. The following error
 *  codes are reported in the exception message:
 *  @p(dlist)                            
 *      -  `xdc.platform.generic.LINK_TEMPLATE_ERROR`
 *           This error is raised when this platform cannot found the default
 *           linker command template `linkcmd.xdt` in the build target's
 *           package. When a target does not contain this file, the config
 *           parameter `{@link xdc.cfg.Program#linkTemplate}` must be set.
 *  @p
 *
 *  @a(EXAMPLES)
 *  Example 1: Suppose you need to create an application for a HW platform
 *  that uses the TMS320C2812 running at 150 MHz.  You can use this package
 *  (in lieu of one specifically created for the HW platform) by defining a
 *  named instance of this package's Platform module.  Add the following
 *  statements to your `config.bld` file to add the platform instance named
 *  "xdc.platform.generic:C28".
 *  @p(code)
 *      Build.platformTable["xdc.platform.generic:C28"] = {
 *          clockRate:   150,
 *          catalogName: "ti.catalog.c2800",
 *          deviceName:  "TMS320C2812"
 *      };
 *  @p
 *  With this name defined, it is now possible to configure an application
 *  using the platform instance name "xdc.platform.generic:C28".  For example,
 *  if you are using `{@link xdc.tools.configuro}` to configure your
 *  application, the string "xdc.platform.generic:C28" can now be used to
 *  identify your platform:
 *  @p(code)
 *      xs xdc.tools.configuro -b config.bld -p xdc.platform.generic:C28 ...
 *  @p
 *
 *  @p(html)
 *  <hr/>
 *  @p
 *
 *  Example 2: The following example illustrates how to specify a platform 
 *  instance with memory regions external to the specified device.  In this
 *  case, we define a platform using a TMS320C6416 running at 600 MHz on a
 *  board with two external SDRAM memory blocks.
 *  @p(code)
 *      Build.platformTable["xdc.platform.generic:C64"] = {
 *          clockRate:          600,
 *          catalogName:        "ti.catalog.c6000",
 *          deviceName:         "TMS320C6416",
 *          externalMemoryMap : [
 *              ["SDRAM1", {
 *                  name: "SDRAM1",
 *                  base: 0x80000000, len: 0x1000000, space: "code/data"
 *              }],
 *              ["SDRAM2", {
 *                  name: "SDRAM2",
 *                  base: 0x90000000, len: 0x1000000, space: "code/data"
 *              }],
 *          ]
 *      }
 *  @p
 *
 *  The `externalMemoryMap` attribute is a map of string names to
 *  `{@link xdc.platform.IPlatform#Memory}` structures.
 *
 *  @see xdc.platform.generic.Platform
 *  @see xdc.bld.BuildEnvironment#platformTable
 *  @see xdc.platform.IPlatform
 */
package xdc.platform.generic [1, 0, 0] {
    module Platform;
}
/*
 *  @(#) xdc.platform.generic; 1, 0, 0,0; 11-8-2017 17:10:49; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

