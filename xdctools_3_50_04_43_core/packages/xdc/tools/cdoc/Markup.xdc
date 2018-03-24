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
package xdc.tools.cdoc;

/*!
 * XDCspec doc markup language examples
 *
 * This module demonstrates the features of XDCspec doc and gives usage
 * examples for the XDCspec doc markup language. View the source text of this
 * .xdc file for details on how to use these examples.
 * 
 * @a(HEADINGS)
 * Major headings can be inserted into the document using the following
 * syntax:
 * @p(code)
 *    @@tag(headingText)
 * @p
 *
 * The available tags are:
 * @p(dlist)
 *    - `@@a(headingText)`
 *      Add a heading to the end ("a" for "after") of the details section.
 *    - `@@b(headingText)`
 *      Add a heading to the start ("b" for "before") of the details section.
 * @p
 *
 * Since XDCtools 3.05, @@a and @@b tags can accept space characters in headings.
 * Prior to this, heading text could contain no spaces.
 *
 * @a(PARAGRAPH FORMATTING)
 * Paragraphs can be marked in several different styles using the
 * following syntax:
 * @p(code)
 * @@p(style)
 *  paragraph text here...
 *
 *  another paragraph...
 * @@p
 * @p
 *
 * The available paragraph styles are:
 * @p(dlist)
 *    - `@@p(text) or @@p`
 *       Plain text -- this is the default.
 *    - `@@p(code)`
 *       Fragments of source code or pseudo-code. Paragraphs of this
 *       type are rendered in a fixed-width font.
 *    - `@@p(html)`
 *       HTML markup. Paragraphs of this type are copied directly into the
 *       XDCspec doc output, with no interpretation.
 * @p
 *
 * @a(CHARACTER FORMATTING)
 *
 * @a(LIST TYPES)
 * Lists in several styles can be created using the syntax:
 * @p(code)
 * @@p(style)
 *  - first list item
 *    continued...
 *  - second list item
 * @@p
 * @p
 * The available list styles are bulleted list, numbered list, and
 * definition list, and they look like this:
 * @p(blist)
 *    -  The `blist` bulleted list style is an unnumbered, unordered list
 *    -  Rendered using the HTML `<UL>` element.
 * @p
 * @p(nlist)
 *    - The `nlist` numbered list style is an ordered, numbered list
 *    - Rendered using the HTML `<OL>` element.
 * @p
 * @p(dlist)
 *    - `Definition List`
 *       The `dlist` definition list style has a minor heading for
 *       each item in the list
 *    - `Rendering`
 *       Rendered using the HTML `<DL>` element.
 * @p
 *
 * @a(CDOC HYPERLINKS)
 * HTML hyperlinks between XDCspec doc pages can be inserted using the
 * `{@link}` inline keyword. `link` takes as a parameter the name of an XDCspec
 * element, and optionally some additional formatting text. The
 * XDCspec element can name a package, a module or interface, or a
 * declaration within a module or interface. The general syntax is:
 * @p(code)
 *    {@@link [pkgName.][modName][#decl][suffText] [altText]}
 * @p
 * where:
 * @p(dlist)
 *    - `pkgName`
 *       is the name of a package.
 *    - `modName`
 *       is the name of a module or interface within the package.
 *    - `decl`
 *       is the name of a declaration within the module or interface,
 *       for example a function or config parameter.
 *       Note that `decl` is delimited by a '`#`' character to distinguish
 *       it from the name of a package, module or interface.
 *    - `suffText`
 *       is text to be appended to the text of the link. For example, '`()`'
 *       might be appended to denote a void function. The suffix text must
 *       contain no spaces.
 *    - `altText`
 *       is alternate text to be used instead of the XDCspec name of the
 *       link target.
 * @p
 * 
 * @p(html)
 * <table cellSpacing="2" cellPadding="2" width="100%" border="1">
 *   <tbody>
 *   <tr>
 *     <th><B>Write this:</B></th>
 *     <th><B>To reference this:</B></th></tr>
 *   <tr>
 *     <td>{@@link <i>pkgName</i>}</td>
 *     <td>a package</td></tr>
 *   <tr>
 *     <td>{@@link <i>pkgName</i>.<i>moduleName</i>}</td>
 *     <td>a module</td></tr>
 *   <tr>
 *     <td>{@@link <i>moduleName</i>}</td>
 *     <td>a module in the same package</td></tr>
 *   <tr>
 *     <td>{@@link <i>pkgName</i>.<i>moduleName</i>#<i>declName</i>}</td>
 *     <td>a decl in a module</td></tr>
 *   <tr>
 *     <td>{@@link <i>moduleName</i>#<i>declName</i>}</td>
 *     <td>a decl in the same package</td></tr>
 *   <tr>
 *     <td>{@@link #<i>declName</i>}</td>
 *     <td>a decl in the same module</td></tr>
 *   <tr>
 *     <td>{@@link #<i>declName</i>(<i>arg1</i>,<i>arg2</i>)}</td>
 *     <td>a function with explicit args given in <i>suffText</i></td></tr>
 *   <tr>
 *     <td>{@@link #<i>declName</i> defined here}</td>
 *     <td>a decl with the explicit link text "defined here"</td></tr>
 *   </tbody>
 * </table>
 * @p
 *
 * Examples are:
 * @p(dlist)
 *    - {@link Example#AStruct}
 *    - {@link xdc.tools.cdoc.Example}
 *    - {@link Example#AStruct a struct with alternate text}
 * @p
 *
 * @see Example#AStruct
 *
 * @a(EXTERNAL HTML LINKS)
 * Documentation can also include HTML hyperlinks to web sites, using
 * the syntax:
 * @p(code)
 *    {@@link http://serverName/pathName[#anchor] [altText]}
 * @p
 * The URL must include a resource type, typically "http:" or "ftp:".
 *
 * Examples are:
 * @p(dlist)
 *    - {@link http://ti.com}
 *    - {@link http://ti.com Texas Instruments}
 * @p
 *
 * @a(LINKING TO OTHER DOCUMENTATION FILES)
 * It is possible to deliver other documentation files along with a
 * package, and link to it from XDCspec doc. The documentation files must
 * be placed in a subdirectory of the package with the name `'doc-files'`.
 * Hyperlinks to files in this directory are created using the syntax:
 * @p(code)
 *    {@@link ./doc-files/filename[#anchor] [altText]}
 *    {@@link pkgDir/doc-files/fileName[#anchor] [altText]}
 * @p
 *
 * The file name is specified using the same syntax as the `xdc.findFile()`
 * function. That is, filenames within the current package must begin with "./".
 * Links to files in other packages must use the fully qualified package name,
 * with slashes ('/') instead of dots ('.') in the name.
 *
 * @p(html)
 * <table cellSpacing="2" cellPadding="2" border="1">
 *   <tbody>
 *   <tr>
 *     <th><B>Write this:</B></th>
 *     <th><B>To reference this:</B></th></tr>
 *   <tr>
 *     <td>{@@link ./doc-files/<i>filename</i> }</td>
 *     <td>a file in the current package</td></tr>
 *   <tr>
 *     <td>{@@link <i>pkgDir</i>/doc-files/<i>filename</i> }</td>
 *     <td>a file in another package</td></tr>
 *   </tbody>
 * </table>
 * @p
 *
 * Examples are:
 * @p(dlist)
 *    - {@link ./doc-files/example.html}
 *    - {@link xdc/tools/cdoc/doc-files/example.html}
 * @p
 *
 * @a(LINKING TO DOXYGEN DOCUMENTATION)
 * It is possible to link to Doxygen documentation.
 * Hyperlinks to are created using the syntax:
 * @p(code)
 *    {@@link doxy(name)}
 * @p
 * In a SEE section use:
 * @p(code)
 *    doxy(name)
 * @p
 *
 * @p(html)
 * <table cellSpacing="2" cellPadding="2" border="1">
 *   <tbody>
 *   <tr>
 *     <th><B>To link to:</B></th>
 *     <th><B>Use:</B></th>
 *     <th><B>Example:</B></th></tr>
 *   <tr>
 *     <td>File</td>
 *     <td><i>filePrefix</i><B>.</B><i>fileSuffix</i></td>
 *     <td>doxy(Engine.h)</td></tr>
 *     <td>Function</td>
 *     <td><i>functionName</i><B>()</B></td>
 *     <td>doxy(Engine_open())</td></tr>
 *     <td>#define</td>
 *     <td><B>#</B><i>defineName</i></td>
 *     <td>doxy(#Engine_GTNAME)</td></tr>
 *     <td>Struct</td>
 *     <td><i>structName</i></td>
 *     <td>doxy(IALG_Fxns)</td></tr>
 *     <td>Struct field</td>
 *     <td><i>structName</i><B>::</B><i>structField</i></td>
 *     <td>doxy(IALG_Fxns::algAlloc)</td></tr>
 *     <td>Enum</td>
 *     <td><i>enumName</i></td>
 *     <td>doxy(IALG_MemAttrs)</td></tr>
 *     <td>Enumerator</td>
 *     <td><i>enumName</i><B>::</B><i>enumerator</i></td>
 *     <td>doxy(IALG_MemAttrs::IALG_PERSIST)</td></tr>
 *     <td>Typedef</td>
 *     <td><B>::</B><i>typedefName</i></td>
 *     <td>doxy(::Engine_Handle)</td></tr>
 *     <td>Variable</td>
 *     <td><B>#</B><i>variableName</i></td>
 *     <td>doxy(#Engine_ATTRS)</td></tr>
 *   </tbody>
 * </table>
 * @p
 *
 * See xdc.tools.cdoc usage for how to specify the location of the Doxygen files.
 *
 */
metaonly module Markup {
}
/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

