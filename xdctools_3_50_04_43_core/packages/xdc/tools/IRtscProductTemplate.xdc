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
package xdc.tools;

/*!
 *  ======== IRtscProductTemplate ========
 *  @_nodoc
 *  
 */
metaonly interface IRtscProductTemplate
{
    /*!
     *  Structure providing information on the available configurations
     *
     *  @field(title)       String containing the title of the template
     *  @field(fileList)    Array of file paths relative to the template
     *                      package folder
     *  @field(description) String containing the description of the template
     *  @field(template)    Array containing one 'TemplateInfo' object 
     */ 
    struct TemplateInfo {
        String title;
        String fileList[];
        String description;
        TemplateInfo template[];
    };

    /*!
     *  ======== appTemplates ========
     */
    config TemplateInfo appTemplates[];

    /*!
     *  ======== configTemplates ========
     */
    config TemplateInfo configTemplates[];
}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

