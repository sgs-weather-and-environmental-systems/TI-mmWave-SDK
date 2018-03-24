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
metaonly module PathEditor inherits Widget {

    /*!
     * Event type sent when the path has changed.
     */
    const Int PATH_CHANGED = 100023;

instance:
    create(Any parent);

    /*!
     * Add the current XDC-owned repositories to the display
     */
    config Bool addXDCRepositories = true;

    /*!
     * Get the package path.
     */
    Any getPath();
    Any getUserPath();

    /*!
     * Set the package path.
     */
    Void setPath(String path[]);
    Void setUserPath(String path[]);

    /*!
     * Add a directory to the front of the package path.
     */
    Void add(String dir);

    /*!
     * Remove a directory from the package path.
     */
    Void remove(Int index);

    /*!
     * Move a directory in the package path to before another directory.
     */
    Void move(Int index, Int toBefore);
};
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:58; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

