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
/*!
 *  ======== ICmd ========
 *  @_nodoc
 */
metaonly interface ICmd inherits Template {
    /*!
     *  ======== main ========
     */
    Int main(String args[]);

instance:
    /*!
     *  ======== arguments ========
     *  Positional parameters.
     */
    config Any arguments[];

    /*!
     *  ======== output ========
     *  Output file or directory.
     */
    @CommandOption("o,output")
    config String output;

    /*!
     *  ======== preserveModTime ========
     * Only modify the timestamps of output files whose contents changed.
     *
     * This flag changes the behavior of mkpkg in the case when some
     * of the output files already exists, in particular from a previous
     * invocation of mkpkg. If true, any output file that already
     * exists will only be touched if its contents must change.
     * If the new content is identical, then the timestamp on the
     * file remains unmodified.
     *
     * This is an optimization that can improve the behavior of
     * mkpkg when used with programs like "make" that are sensitive
     * to file timestamps.
     */
    @CommandOption("preserve_mtime")
    config Bool preserveModTime = false;
}
