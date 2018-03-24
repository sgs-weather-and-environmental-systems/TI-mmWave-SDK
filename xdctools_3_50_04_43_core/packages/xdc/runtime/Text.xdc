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
 *  ========= Text.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Text ========
 *  Runtime text handling services
 *
 *  This module efficiently manages a collection of strings that have common
 *  substrings.  Collections with a high degree of commonality are stored in
 *  much less space than as ordinary table of independent C strings.
 *
 *  To further save space, the "compressed" representation need not even
 *  be loaded in the target's memory; see `{@link #isLoaded}`.
 *
 *  The total space available for the compressed representation of text strings
 *  is limited to 64K characters; each string is represented by a 16-bit
 *  "rope id".
 */
@Template("./Text.xdt")
@DirectCall
module Text {

    /*!
     *  ======== CordAddr ========
     *  @_nodoc
     */
    typedef Types.CordAddr CordAddr;

    /*!
     *  ======== Label ========
     */
    typedef Types.Label Label;

    /*!
     *  ======== RopeId ========
     *  @_nodoc
     *
     *  A rope id is a 16-bit value whose most-significant bit indicates
     *  whether the lower 15-bits are an offset into the string table
     *  `charTab` or an offset into the "node" table `nodeTab`.
     *
     *  The node id 0 represents the empty string "".
     */
    typedef Types.RopeId RopeId;

    /*!
     *  ======== Module_View ========
     *  @_nodoc
     */
    @XmlDtd
    metaonly struct Module_View {
        Ptr charBase;
        Ptr nodeBase;
    };

    /*!
     *  ======== nameUnknown ========
     *  Default unknowable instance name
     *
     *  The name of an instance if the module's instances are configured to
     *  not have names.
     */
    config String nameUnknown = "{unknown-instance-name}";

    /*!
     *  ======== nameEmpty ========
     *  Default `NULL` instance name
     *
     *  The name used if the instance's name has been set to `NULL`.
     */
    config String nameEmpty = "{empty-instance-name}";

    /*!
     *  ======== nameStatic ========
     *  Default static instance name
     *
     *  The name of an instance if the name exists but it's not loaded
     *  on the target.
     */
    config String nameStatic = "{static-instance-name}";

    /*!
     *  ======== isLoaded ========
     *  Ensure character-strings are loaded in target memory
     *
     *  Character strings managed by this module are allocated together
     *  with other character strings, and loaded to the target, when this
     *  parameter is set to its default value `true`. If this parameter is
     *  set to `false`, the character strings managed by Text are removed from
     *  the application.
     *
     * A consequence of setting this parameter to `false` is that all names 
     * assigned to static instances are set to NULL, and cannot be displayed by
     * the code loaded to the target. Also, the Log Events that automatically
     * print instance names will print NULL for any static instance. The same
     * code would print the pointers to the names if this parameter is set to
     * `true` and 'isLoaded` is set to '`false`.
     *
     * ROV is not affected by this parameter and it will also correctly display
     * names of static instances in their modules' views. ROV detects these
     * names from the saved configuration files.
     *
     * Module and event IDs are still unique and Log.Events within one module
     * have consecutive IDs.
     */
    config Bool isLoaded = true;

    /*!
     *  ======== cordText ========
     *  Return `NULL` if cord is in `charTab` and `isLoaded` is `FALSE`
     *  @_nodoc
     */
    String cordText(CordAddr cord);

    /*!
     *  ======== ropeText ========
     *  Convert rope to an ordinary C string
     *
     *  Convert rope to an ordinary C string or to NULL if rope refers
     *  to a node in nodeTab
     *
     *  @_nodoc
     */
    CString ropeText(RopeId rope);

    /*!
     *  ======== matchRope ========
     *  Compare pattern string `pat` to String identified by `rope`.
     *  @_nodoc
     *
     *  @a(pre-conditions)
     *  @p(blist)
     *      - lenp must be less than or equal to the length of pat
     *  @p

     *  @a(post-conditions)
     *  @p(blist)
     *      - lenp is decreased by the length of any matching prefix
     *  @p
     *
     *  Returns:
     *  @p(blist)
     *      - -1  `pat` does not match string
     *      - 0   string is a prefix of pattern
     *      - 1   wildcard match
     *  @p
     */
    Int matchRope(RopeId rope, CString pat, Int *lenp);

    /*!
     *  ======== putLab ========
     *  Convert label to an ASCII character sequence
     *
     *  This function converts a `{@link Types#Label}` to a sequence of
     *  ASCII characters, writes the characters to the supplied buffer,
     *  updates the buffer pointer to point to the location after the last
     *  output character, and returns the number of characters output.
     *
     *  No more than `len` characters will be output.  If the label would
     *  otherwise be longer, the output is truncated at the point where a
     *  potential overflow is detected. The return value always reflects the
     *  number of characters output, but it may be less than `len`.
     *
     *  Label structures can be initialized from any module's instance handle
     *  using the module's `Mod_Handle_label()` method.  See
     *  `{@link Types#Label}` for more information.
     *
     *  @param(lab)    address of the label to interpret
     *  @param(bufp)   address of the output buffer pointer or `NULL`
     *
     *                 If `bufp` is `NULL`, the label's characters are
     *                 output via `{@link System#putch()}`.
     *
     *  @param(len)    maximum number of characters to generate
     *
     *                 If `len` is negative, the number of characters to be
     *                 generated is not limited.
     *
     *  @a(returns)
     *  The return value always reflects the number of characters output,
     *  but it may be less than `len`.
     *
     *  @see Types#Label
     */
    Int putLab(Types.Label *lab, Char **bufp, Int len);

    /*!
     *  ======== putMod ========
     *  Convert module ID to its ASCII name
     *
     *  This function converts a `{@link Types#ModuleId}` to a sequence of
     *  ASCII characters, writes the characters to the supplied buffer,
     *  updates the buffer pointer to point to the location after the last
     *  output character, and returns the number of characters output.
     *
     *  No more than `len` characters will be output.  If the module name would
     *  otherwise be longer, the output is truncated at the point where a
     *  potential overflow is detected. The return value always reflects the
     *  number of characters output, but it may be less than `len`.
     *
     *  @param(mid)    ID of the module
     *  @param(bufp)   address of the output buffer pointer or `NULL`
     *
     *                 If `bufp` is `NULL`, the module's name characters are
     *                 output via `{@link System#putch()}`.
     *
     *  @param(len)    maximum number of characters to generate
     *
     *                 If `len` is negative, the number of characters to be
     *                 generated is not limited.
     *
     *  @a(returns)
     *  The return value always reflects the number of characters output,
     *  but it may be less than `len`.
     */
    Int putMod(Types.ModuleId mid, Char **bufp, Int len);

    /*!
     *  ======== putSite ========
     *  Convert call site structure to an ASCII character sequence
     *
     *  This function converts a `{@link Types#Site}` to a sequence of
     *  ASCII characters, writes the characters to the supplied buffer,
     *  updates the buffer pointer to point to the location after the last
     *  output character, and returns the number of characters output.
     *
     *  No more than `len` characters will be output.  If the sequence would
     *  otherwise be longer, the output is truncated at the point where a
     *  potential overflow is detected.
     *
     *  @param(site)   address of the call site structure to interpret
     *  @param(bufp)   address of the output buffer pointer or `NULL`
     *
     *                 If `bufp` is `NULL`, the site's name characters are
     *                 output via `{@link System#putch()}`.
     *
     *  @param(len)    maximum number of characters to generate
     *
     *                 If `len` is negative, the number of characters to be
     *                 generated is not limited.
     *
     *  @a(returns)
     *  The return value always reflects the number of characters output,
     *  but it may be less than `len`.
     */
    Int putSite(Types.Site *site, Char **bufp, Int len);

internal:

    struct Node {
        Types.RopeId left;
        Types.RopeId right;
    };

    typedef Bool (*RopeVisitor)(Ptr, CString);

    struct MatchVisState {
        CString pat;
        Int     *lenp;
        Int     res;
    };

    struct PrintVisState {
        Char **bufp;
        Int len;
        Int res;
    };

    /* charTab[] and nodeTab[] are the "compressed" representation of
     * target strings used to name instances, modules, packages, ...
     *
     * The predefined node id 0 represents the empty string.
     */
    config Char charTab[] = [0];
    config Node nodeTab[] = [{left: 0, right: 0}];

    config Int16 charCnt = 1;
    config Int16 nodeCnt = 1;

    /*
     * The module ids are allocated as follows:
     * 0x1 - 0x4000     unnamed modules
     * 0x4001 - 0x7FFF  registry modules
     * 0x8000 - 0xFFFF  named modules
     *
     * See 'genModNames' in Text.xs
     *
     * TODO - We may be able to set unnamedModsLastId based on the config
     *        to give the Registry more room, but then the Registry id range
     *        would not be a constant.
     */
    config UInt16 unnamedModsLastId = 0x4000;
    config UInt16 registryModsLastId = 0x7FFF;

/* unnamedModCnt can be used to define a constant that allows external
 * modules to define their own module IDs that don't conflict with the
 * statically configured modules; e.g., the dlog example could use this
 */
//    config Int16 unnamedModCnt = 0;

    function defineRopeCord(text); 
    function defineRopeNode(left, right);

    function fetchAddr(raddr);
    function fetchCord(cid);
    function fetchId(rid);
    function fetchNode(nid);

    function genModNames();
    function genPkgName();

    Bool matchVisFxn(Ptr p, CString s);
    Bool printVisFxn(Ptr p, CString s);

    Void visitRope(RopeId rope, Fxn visFxn, Ptr visState);
    Void visitRope2(RopeId rope, Fxn visFxn, Ptr visState, CString stack[]);

    typedef Void (*VisitRopeFxn)(RopeId, Fxn, Ptr);
    typedef Void (*VisitRopeFxn2)(RopeId, Fxn, Ptr, CString[]);

    config VisitRopeFxn visitRopeFxn = visitRope;

    config VisitRopeFxn2 visitRopeFxn2 = visitRope2;

    Int xprintf(Char **bufp, SizeT len, CString fmt, ...);

    struct Module_State {
        CPtr charBase;
        CPtr nodeBase;
    };
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

