/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D21
 */

/*
 * ======== GENERATED SECTIONS ========
 *
 *     PROLOGUE
 *     INCLUDES
 *
 *     INTERNAL DEFINITIONS
 *     MODULE-WIDE CONFIGS
 *     FUNCTION DECLARATIONS
 *     SYSTEM FUNCTIONS
 *
 *     EPILOGUE
 *     STATE STRUCTURES
 *     PREFIX ALIASES
 */


/*
 * ======== PROLOGUE ========
 */

#ifndef xdc_runtime_Text__include
#define xdc_runtime_Text__include

#ifndef __nested__
#define __nested__
#define xdc_runtime_Text__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_runtime_Text___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/package/package.defs.h>

#include <xdc/runtime/IModule.h>
#include <xdc/runtime/Types.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* CordAddr */
typedef xdc_runtime_Types_CordAddr xdc_runtime_Text_CordAddr;

/* Label */
typedef xdc_runtime_Types_Label xdc_runtime_Text_Label;

/* RopeId */
typedef xdc_runtime_Types_RopeId xdc_runtime_Text_RopeId;


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* Node */
struct xdc_runtime_Text_Node {
    xdc_runtime_Types_RopeId left;
    xdc_runtime_Types_RopeId right;
};

/* RopeVisitor */
typedef xdc_Bool (*xdc_runtime_Text_RopeVisitor)(xdc_Ptr __arg1, xdc_CString __arg2);

/* MatchVisState */
struct xdc_runtime_Text_MatchVisState {
    xdc_CString pat;
    xdc_Int *lenp;
    xdc_Int res;
};

/* PrintVisState */
struct xdc_runtime_Text_PrintVisState {
    xdc_Char **bufp;
    xdc_Int len;
    xdc_Int res;
};

/* VisitRopeFxn */
typedef xdc_Void (*xdc_runtime_Text_VisitRopeFxn)(xdc_runtime_Text_RopeId __arg1, xdc_Fxn __arg2, xdc_Ptr __arg3);

/* VisitRopeFxn2 */
typedef xdc_Void (*xdc_runtime_Text_VisitRopeFxn2)(xdc_runtime_Text_RopeId __arg1, xdc_Fxn __arg2, xdc_Ptr __arg3, xdc_CString __arg4[]);


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_runtime_Text_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_runtime_Text_Module__diagsEnabled xdc_runtime_Text_Module__diagsEnabled__C;
#ifdef xdc_runtime_Text_Module__diagsEnabled__CR
#define xdc_runtime_Text_Module__diagsEnabled__C (*((CT__xdc_runtime_Text_Module__diagsEnabled*)(xdcRomConstPtr + xdc_runtime_Text_Module__diagsEnabled__C_offset)))
#else
#define xdc_runtime_Text_Module__diagsEnabled (xdc_runtime_Text_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_runtime_Text_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_runtime_Text_Module__diagsIncluded xdc_runtime_Text_Module__diagsIncluded__C;
#ifdef xdc_runtime_Text_Module__diagsIncluded__CR
#define xdc_runtime_Text_Module__diagsIncluded__C (*((CT__xdc_runtime_Text_Module__diagsIncluded*)(xdcRomConstPtr + xdc_runtime_Text_Module__diagsIncluded__C_offset)))
#else
#define xdc_runtime_Text_Module__diagsIncluded (xdc_runtime_Text_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_runtime_Text_Module__diagsMask;
__extern __FAR__ const CT__xdc_runtime_Text_Module__diagsMask xdc_runtime_Text_Module__diagsMask__C;
#ifdef xdc_runtime_Text_Module__diagsMask__CR
#define xdc_runtime_Text_Module__diagsMask__C (*((CT__xdc_runtime_Text_Module__diagsMask*)(xdcRomConstPtr + xdc_runtime_Text_Module__diagsMask__C_offset)))
#else
#define xdc_runtime_Text_Module__diagsMask (xdc_runtime_Text_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_runtime_Text_Module__gateObj;
__extern __FAR__ const CT__xdc_runtime_Text_Module__gateObj xdc_runtime_Text_Module__gateObj__C;
#ifdef xdc_runtime_Text_Module__gateObj__CR
#define xdc_runtime_Text_Module__gateObj__C (*((CT__xdc_runtime_Text_Module__gateObj*)(xdcRomConstPtr + xdc_runtime_Text_Module__gateObj__C_offset)))
#else
#define xdc_runtime_Text_Module__gateObj (xdc_runtime_Text_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_runtime_Text_Module__gatePrms;
__extern __FAR__ const CT__xdc_runtime_Text_Module__gatePrms xdc_runtime_Text_Module__gatePrms__C;
#ifdef xdc_runtime_Text_Module__gatePrms__CR
#define xdc_runtime_Text_Module__gatePrms__C (*((CT__xdc_runtime_Text_Module__gatePrms*)(xdcRomConstPtr + xdc_runtime_Text_Module__gatePrms__C_offset)))
#else
#define xdc_runtime_Text_Module__gatePrms (xdc_runtime_Text_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Text_Module__id;
__extern __FAR__ const CT__xdc_runtime_Text_Module__id xdc_runtime_Text_Module__id__C;
#ifdef xdc_runtime_Text_Module__id__CR
#define xdc_runtime_Text_Module__id__C (*((CT__xdc_runtime_Text_Module__id*)(xdcRomConstPtr + xdc_runtime_Text_Module__id__C_offset)))
#else
#define xdc_runtime_Text_Module__id (xdc_runtime_Text_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_runtime_Text_Module__loggerDefined;
__extern __FAR__ const CT__xdc_runtime_Text_Module__loggerDefined xdc_runtime_Text_Module__loggerDefined__C;
#ifdef xdc_runtime_Text_Module__loggerDefined__CR
#define xdc_runtime_Text_Module__loggerDefined__C (*((CT__xdc_runtime_Text_Module__loggerDefined*)(xdcRomConstPtr + xdc_runtime_Text_Module__loggerDefined__C_offset)))
#else
#define xdc_runtime_Text_Module__loggerDefined (xdc_runtime_Text_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_runtime_Text_Module__loggerObj;
__extern __FAR__ const CT__xdc_runtime_Text_Module__loggerObj xdc_runtime_Text_Module__loggerObj__C;
#ifdef xdc_runtime_Text_Module__loggerObj__CR
#define xdc_runtime_Text_Module__loggerObj__C (*((CT__xdc_runtime_Text_Module__loggerObj*)(xdcRomConstPtr + xdc_runtime_Text_Module__loggerObj__C_offset)))
#else
#define xdc_runtime_Text_Module__loggerObj (xdc_runtime_Text_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Text_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_runtime_Text_Module__loggerFxn0 xdc_runtime_Text_Module__loggerFxn0__C;
#ifdef xdc_runtime_Text_Module__loggerFxn0__CR
#define xdc_runtime_Text_Module__loggerFxn0__C (*((CT__xdc_runtime_Text_Module__loggerFxn0*)(xdcRomConstPtr + xdc_runtime_Text_Module__loggerFxn0__C_offset)))
#else
#define xdc_runtime_Text_Module__loggerFxn0 (xdc_runtime_Text_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Text_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_runtime_Text_Module__loggerFxn1 xdc_runtime_Text_Module__loggerFxn1__C;
#ifdef xdc_runtime_Text_Module__loggerFxn1__CR
#define xdc_runtime_Text_Module__loggerFxn1__C (*((CT__xdc_runtime_Text_Module__loggerFxn1*)(xdcRomConstPtr + xdc_runtime_Text_Module__loggerFxn1__C_offset)))
#else
#define xdc_runtime_Text_Module__loggerFxn1 (xdc_runtime_Text_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Text_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_runtime_Text_Module__loggerFxn2 xdc_runtime_Text_Module__loggerFxn2__C;
#ifdef xdc_runtime_Text_Module__loggerFxn2__CR
#define xdc_runtime_Text_Module__loggerFxn2__C (*((CT__xdc_runtime_Text_Module__loggerFxn2*)(xdcRomConstPtr + xdc_runtime_Text_Module__loggerFxn2__C_offset)))
#else
#define xdc_runtime_Text_Module__loggerFxn2 (xdc_runtime_Text_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Text_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_runtime_Text_Module__loggerFxn4 xdc_runtime_Text_Module__loggerFxn4__C;
#ifdef xdc_runtime_Text_Module__loggerFxn4__CR
#define xdc_runtime_Text_Module__loggerFxn4__C (*((CT__xdc_runtime_Text_Module__loggerFxn4*)(xdcRomConstPtr + xdc_runtime_Text_Module__loggerFxn4__C_offset)))
#else
#define xdc_runtime_Text_Module__loggerFxn4 (xdc_runtime_Text_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Text_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_runtime_Text_Module__loggerFxn8 xdc_runtime_Text_Module__loggerFxn8__C;
#ifdef xdc_runtime_Text_Module__loggerFxn8__CR
#define xdc_runtime_Text_Module__loggerFxn8__C (*((CT__xdc_runtime_Text_Module__loggerFxn8*)(xdcRomConstPtr + xdc_runtime_Text_Module__loggerFxn8__C_offset)))
#else
#define xdc_runtime_Text_Module__loggerFxn8 (xdc_runtime_Text_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_runtime_Text_Object__count;
__extern __FAR__ const CT__xdc_runtime_Text_Object__count xdc_runtime_Text_Object__count__C;
#ifdef xdc_runtime_Text_Object__count__CR
#define xdc_runtime_Text_Object__count__C (*((CT__xdc_runtime_Text_Object__count*)(xdcRomConstPtr + xdc_runtime_Text_Object__count__C_offset)))
#else
#define xdc_runtime_Text_Object__count (xdc_runtime_Text_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Text_Object__heap;
__extern __FAR__ const CT__xdc_runtime_Text_Object__heap xdc_runtime_Text_Object__heap__C;
#ifdef xdc_runtime_Text_Object__heap__CR
#define xdc_runtime_Text_Object__heap__C (*((CT__xdc_runtime_Text_Object__heap*)(xdcRomConstPtr + xdc_runtime_Text_Object__heap__C_offset)))
#else
#define xdc_runtime_Text_Object__heap (xdc_runtime_Text_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_runtime_Text_Object__sizeof;
__extern __FAR__ const CT__xdc_runtime_Text_Object__sizeof xdc_runtime_Text_Object__sizeof__C;
#ifdef xdc_runtime_Text_Object__sizeof__CR
#define xdc_runtime_Text_Object__sizeof__C (*((CT__xdc_runtime_Text_Object__sizeof*)(xdcRomConstPtr + xdc_runtime_Text_Object__sizeof__C_offset)))
#else
#define xdc_runtime_Text_Object__sizeof (xdc_runtime_Text_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_runtime_Text_Object__table;
__extern __FAR__ const CT__xdc_runtime_Text_Object__table xdc_runtime_Text_Object__table__C;
#ifdef xdc_runtime_Text_Object__table__CR
#define xdc_runtime_Text_Object__table__C (*((CT__xdc_runtime_Text_Object__table*)(xdcRomConstPtr + xdc_runtime_Text_Object__table__C_offset)))
#else
#define xdc_runtime_Text_Object__table (xdc_runtime_Text_Object__table__C)
#endif

/* nameUnknown */
typedef xdc_String CT__xdc_runtime_Text_nameUnknown;
__extern __FAR__ const CT__xdc_runtime_Text_nameUnknown xdc_runtime_Text_nameUnknown__C;
#ifdef xdc_runtime_Text_nameUnknown__CR
#define xdc_runtime_Text_nameUnknown (*((CT__xdc_runtime_Text_nameUnknown*)(xdcRomConstPtr + xdc_runtime_Text_nameUnknown__C_offset)))
#else
#define xdc_runtime_Text_nameUnknown (xdc_runtime_Text_nameUnknown__C)
#endif

/* nameEmpty */
typedef xdc_String CT__xdc_runtime_Text_nameEmpty;
__extern __FAR__ const CT__xdc_runtime_Text_nameEmpty xdc_runtime_Text_nameEmpty__C;
#ifdef xdc_runtime_Text_nameEmpty__CR
#define xdc_runtime_Text_nameEmpty (*((CT__xdc_runtime_Text_nameEmpty*)(xdcRomConstPtr + xdc_runtime_Text_nameEmpty__C_offset)))
#else
#define xdc_runtime_Text_nameEmpty (xdc_runtime_Text_nameEmpty__C)
#endif

/* nameStatic */
typedef xdc_String CT__xdc_runtime_Text_nameStatic;
__extern __FAR__ const CT__xdc_runtime_Text_nameStatic xdc_runtime_Text_nameStatic__C;
#ifdef xdc_runtime_Text_nameStatic__CR
#define xdc_runtime_Text_nameStatic (*((CT__xdc_runtime_Text_nameStatic*)(xdcRomConstPtr + xdc_runtime_Text_nameStatic__C_offset)))
#else
#define xdc_runtime_Text_nameStatic (xdc_runtime_Text_nameStatic__C)
#endif

/* isLoaded */
typedef xdc_Bool CT__xdc_runtime_Text_isLoaded;
__extern __FAR__ const CT__xdc_runtime_Text_isLoaded xdc_runtime_Text_isLoaded__C;
#ifdef xdc_runtime_Text_isLoaded__CR
#define xdc_runtime_Text_isLoaded (*((CT__xdc_runtime_Text_isLoaded*)(xdcRomConstPtr + xdc_runtime_Text_isLoaded__C_offset)))
#else
#ifdef xdc_runtime_Text_isLoaded__D
#define xdc_runtime_Text_isLoaded (xdc_runtime_Text_isLoaded__D)
#else
#define xdc_runtime_Text_isLoaded (xdc_runtime_Text_isLoaded__C)
#endif
#endif

/* charTab */
typedef xdc_Char __T1_xdc_runtime_Text_charTab;
typedef xdc_Char *__ARRAY1_xdc_runtime_Text_charTab;
typedef const xdc_Char *__CARRAY1_xdc_runtime_Text_charTab;
typedef __CARRAY1_xdc_runtime_Text_charTab __TA_xdc_runtime_Text_charTab;
typedef __CARRAY1_xdc_runtime_Text_charTab CT__xdc_runtime_Text_charTab;
__extern __FAR__ const CT__xdc_runtime_Text_charTab xdc_runtime_Text_charTab__C;
#ifdef xdc_runtime_Text_charTab__CR
#define xdc_runtime_Text_charTab (*((CT__xdc_runtime_Text_charTab*)(xdcRomConstPtr + xdc_runtime_Text_charTab__C_offset)))
#else
#define xdc_runtime_Text_charTab (xdc_runtime_Text_charTab__C)
#endif

/* nodeTab */
typedef xdc_runtime_Text_Node __T1_xdc_runtime_Text_nodeTab;
typedef xdc_runtime_Text_Node *__ARRAY1_xdc_runtime_Text_nodeTab;
typedef const xdc_runtime_Text_Node *__CARRAY1_xdc_runtime_Text_nodeTab;
typedef __CARRAY1_xdc_runtime_Text_nodeTab __TA_xdc_runtime_Text_nodeTab;
typedef __CARRAY1_xdc_runtime_Text_nodeTab CT__xdc_runtime_Text_nodeTab;
__extern __FAR__ const CT__xdc_runtime_Text_nodeTab xdc_runtime_Text_nodeTab__C;
#ifdef xdc_runtime_Text_nodeTab__CR
#define xdc_runtime_Text_nodeTab (*((CT__xdc_runtime_Text_nodeTab*)(xdcRomConstPtr + xdc_runtime_Text_nodeTab__C_offset)))
#else
#define xdc_runtime_Text_nodeTab (xdc_runtime_Text_nodeTab__C)
#endif

/* charCnt */
typedef xdc_Int16 CT__xdc_runtime_Text_charCnt;
__extern __FAR__ const CT__xdc_runtime_Text_charCnt xdc_runtime_Text_charCnt__C;
#ifdef xdc_runtime_Text_charCnt__CR
#define xdc_runtime_Text_charCnt (*((CT__xdc_runtime_Text_charCnt*)(xdcRomConstPtr + xdc_runtime_Text_charCnt__C_offset)))
#else
#ifdef xdc_runtime_Text_charCnt__D
#define xdc_runtime_Text_charCnt (xdc_runtime_Text_charCnt__D)
#else
#define xdc_runtime_Text_charCnt (xdc_runtime_Text_charCnt__C)
#endif
#endif

/* nodeCnt */
typedef xdc_Int16 CT__xdc_runtime_Text_nodeCnt;
__extern __FAR__ const CT__xdc_runtime_Text_nodeCnt xdc_runtime_Text_nodeCnt__C;
#ifdef xdc_runtime_Text_nodeCnt__CR
#define xdc_runtime_Text_nodeCnt (*((CT__xdc_runtime_Text_nodeCnt*)(xdcRomConstPtr + xdc_runtime_Text_nodeCnt__C_offset)))
#else
#ifdef xdc_runtime_Text_nodeCnt__D
#define xdc_runtime_Text_nodeCnt (xdc_runtime_Text_nodeCnt__D)
#else
#define xdc_runtime_Text_nodeCnt (xdc_runtime_Text_nodeCnt__C)
#endif
#endif

/* unnamedModsLastId */
typedef xdc_UInt16 CT__xdc_runtime_Text_unnamedModsLastId;
__extern __FAR__ const CT__xdc_runtime_Text_unnamedModsLastId xdc_runtime_Text_unnamedModsLastId__C;
#ifdef xdc_runtime_Text_unnamedModsLastId__CR
#define xdc_runtime_Text_unnamedModsLastId (*((CT__xdc_runtime_Text_unnamedModsLastId*)(xdcRomConstPtr + xdc_runtime_Text_unnamedModsLastId__C_offset)))
#else
#ifdef xdc_runtime_Text_unnamedModsLastId__D
#define xdc_runtime_Text_unnamedModsLastId (xdc_runtime_Text_unnamedModsLastId__D)
#else
#define xdc_runtime_Text_unnamedModsLastId (xdc_runtime_Text_unnamedModsLastId__C)
#endif
#endif

/* registryModsLastId */
typedef xdc_UInt16 CT__xdc_runtime_Text_registryModsLastId;
__extern __FAR__ const CT__xdc_runtime_Text_registryModsLastId xdc_runtime_Text_registryModsLastId__C;
#ifdef xdc_runtime_Text_registryModsLastId__CR
#define xdc_runtime_Text_registryModsLastId (*((CT__xdc_runtime_Text_registryModsLastId*)(xdcRomConstPtr + xdc_runtime_Text_registryModsLastId__C_offset)))
#else
#ifdef xdc_runtime_Text_registryModsLastId__D
#define xdc_runtime_Text_registryModsLastId (xdc_runtime_Text_registryModsLastId__D)
#else
#define xdc_runtime_Text_registryModsLastId (xdc_runtime_Text_registryModsLastId__C)
#endif
#endif

/* visitRopeFxn */
typedef xdc_runtime_Text_VisitRopeFxn CT__xdc_runtime_Text_visitRopeFxn;
__extern __FAR__ const CT__xdc_runtime_Text_visitRopeFxn xdc_runtime_Text_visitRopeFxn__C;
#ifdef xdc_runtime_Text_visitRopeFxn__CR
#define xdc_runtime_Text_visitRopeFxn (*((CT__xdc_runtime_Text_visitRopeFxn*)(xdcRomConstPtr + xdc_runtime_Text_visitRopeFxn__C_offset)))
#else
#define xdc_runtime_Text_visitRopeFxn (xdc_runtime_Text_visitRopeFxn__C)
#endif

/* visitRopeFxn2 */
typedef xdc_runtime_Text_VisitRopeFxn2 CT__xdc_runtime_Text_visitRopeFxn2;
__extern __FAR__ const CT__xdc_runtime_Text_visitRopeFxn2 xdc_runtime_Text_visitRopeFxn2__C;
#ifdef xdc_runtime_Text_visitRopeFxn2__CR
#define xdc_runtime_Text_visitRopeFxn2 (*((CT__xdc_runtime_Text_visitRopeFxn2*)(xdcRomConstPtr + xdc_runtime_Text_visitRopeFxn2__C_offset)))
#else
#define xdc_runtime_Text_visitRopeFxn2 (xdc_runtime_Text_visitRopeFxn2__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_runtime_Text_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(xdc_runtime_Text_Module__startupDone__S, "xdc_runtime_Text_Module__startupDone__S")
__extern xdc_Bool xdc_runtime_Text_Module__startupDone__S( void );

/* cordText__E */
#define xdc_runtime_Text_cordText xdc_runtime_Text_cordText__E
xdc__CODESECT(xdc_runtime_Text_cordText__E, "xdc_runtime_Text_cordText")
__extern xdc_String xdc_runtime_Text_cordText__E( xdc_runtime_Text_CordAddr cord );

/* ropeText__E */
#define xdc_runtime_Text_ropeText xdc_runtime_Text_ropeText__E
xdc__CODESECT(xdc_runtime_Text_ropeText__E, "xdc_runtime_Text_ropeText")
__extern xdc_CString xdc_runtime_Text_ropeText__E( xdc_runtime_Text_RopeId rope );

/* matchRope__E */
#define xdc_runtime_Text_matchRope xdc_runtime_Text_matchRope__E
xdc__CODESECT(xdc_runtime_Text_matchRope__E, "xdc_runtime_Text_matchRope")
__extern xdc_Int xdc_runtime_Text_matchRope__E( xdc_runtime_Text_RopeId rope, xdc_CString pat, xdc_Int *lenp );

/* putLab__E */
#define xdc_runtime_Text_putLab xdc_runtime_Text_putLab__E
xdc__CODESECT(xdc_runtime_Text_putLab__E, "xdc_runtime_Text_putLab")
__extern xdc_Int xdc_runtime_Text_putLab__E( xdc_runtime_Types_Label *lab, xdc_Char **bufp, xdc_Int len );

/* putMod__E */
#define xdc_runtime_Text_putMod xdc_runtime_Text_putMod__E
xdc__CODESECT(xdc_runtime_Text_putMod__E, "xdc_runtime_Text_putMod")
__extern xdc_Int xdc_runtime_Text_putMod__E( xdc_runtime_Types_ModuleId mid, xdc_Char **bufp, xdc_Int len );

/* putSite__E */
#define xdc_runtime_Text_putSite xdc_runtime_Text_putSite__E
xdc__CODESECT(xdc_runtime_Text_putSite__E, "xdc_runtime_Text_putSite")
__extern xdc_Int xdc_runtime_Text_putSite__E( xdc_runtime_Types_Site *site, xdc_Char **bufp, xdc_Int len );

/* matchVisFxn__I */
#define xdc_runtime_Text_matchVisFxn xdc_runtime_Text_matchVisFxn__I
xdc__CODESECT(xdc_runtime_Text_matchVisFxn__I, "xdc_runtime_Text_matchVisFxn")
__extern xdc_Bool xdc_runtime_Text_matchVisFxn__I( xdc_Ptr p, xdc_CString s );

/* printVisFxn__I */
#define xdc_runtime_Text_printVisFxn xdc_runtime_Text_printVisFxn__I
xdc__CODESECT(xdc_runtime_Text_printVisFxn__I, "xdc_runtime_Text_printVisFxn")
__extern xdc_Bool xdc_runtime_Text_printVisFxn__I( xdc_Ptr p, xdc_CString s );

/* visitRope__I */
#define xdc_runtime_Text_visitRope xdc_runtime_Text_visitRope__I
xdc__CODESECT(xdc_runtime_Text_visitRope__I, "xdc_runtime_Text_visitRope")
__extern xdc_Void xdc_runtime_Text_visitRope__I( xdc_runtime_Text_RopeId rope, xdc_Fxn visFxn, xdc_Ptr visState );

/* visitRope2__I */
#define xdc_runtime_Text_visitRope2 xdc_runtime_Text_visitRope2__I
xdc__CODESECT(xdc_runtime_Text_visitRope2__I, "xdc_runtime_Text_visitRope2")
__extern xdc_Void xdc_runtime_Text_visitRope2__I( xdc_runtime_Text_RopeId rope, xdc_Fxn visFxn, xdc_Ptr visState, xdc_CString stack[] );

/* xprintf__I */
#define xdc_runtime_Text_xprintf xdc_runtime_Text_xprintf__I
xdc__CODESECT(xdc_runtime_Text_xprintf__I, "xdc_runtime_Text_xprintf")
__extern xdc_Int xdc_runtime_Text_xprintf__I( xdc_Char **bufp, xdc_SizeT len, xdc_CString fmt, ... );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_runtime_Text_Module_startupDone() xdc_runtime_Text_Module__startupDone__S()

/* Object_heap */
#define xdc_runtime_Text_Object_heap() xdc_runtime_Text_Object__heap__C

/* Module_heap */
#define xdc_runtime_Text_Module_heap() xdc_runtime_Text_Object__heap__C

/* Module_id */
static inline CT__xdc_runtime_Text_Module__id xdc_runtime_Text_Module_id(void);
static inline CT__xdc_runtime_Text_Module__id xdc_runtime_Text_Module_id( void ) 
{
    return xdc_runtime_Text_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool xdc_runtime_Text_Module_hasMask(void);
static inline xdc_Bool xdc_runtime_Text_Module_hasMask(void) 
{
    return (xdc_Bool)(xdc_runtime_Text_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 xdc_runtime_Text_Module_getMask(void);
static inline xdc_Bits16 xdc_runtime_Text_Module_getMask( void ) 
{
    return xdc_runtime_Text_Module__diagsMask__C != NULL ? *xdc_runtime_Text_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void xdc_runtime_Text_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void xdc_runtime_Text_Module_setMask(xdc_Bits16 mask)
{
    if (xdc_runtime_Text_Module__diagsMask__C != NULL) {
        *xdc_runtime_Text_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef xdc_runtime_Text__top__
#undef __nested__
#endif

#endif /* xdc_runtime_Text__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(xdc_runtime_Text__internalaccess))

#ifndef xdc_runtime_Text__include_state
#define xdc_runtime_Text__include_state

/* Module_State */
struct xdc_runtime_Text_Module_State {
    xdc_CPtr charBase;
    xdc_CPtr nodeBase;
};

/* Module__state__V */
#ifndef xdc_runtime_Text_Module__state__VR
extern struct xdc_runtime_Text_Module_State__ xdc_runtime_Text_Module__state__V;
#else
#define xdc_runtime_Text_Module__state__V (*((struct xdc_runtime_Text_Module_State__*)(xdcRomStatePtr + xdc_runtime_Text_Module__state__V_offset)))
#endif

#endif /* xdc_runtime_Text__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_runtime_Text__nolocalnames)

#ifndef xdc_runtime_Text__localnames__done
#define xdc_runtime_Text__localnames__done

/* module prefix */
#define Text_CordAddr xdc_runtime_Text_CordAddr
#define Text_Label xdc_runtime_Text_Label
#define Text_RopeId xdc_runtime_Text_RopeId
#define Text_Node xdc_runtime_Text_Node
#define Text_RopeVisitor xdc_runtime_Text_RopeVisitor
#define Text_MatchVisState xdc_runtime_Text_MatchVisState
#define Text_PrintVisState xdc_runtime_Text_PrintVisState
#define Text_VisitRopeFxn xdc_runtime_Text_VisitRopeFxn
#define Text_VisitRopeFxn2 xdc_runtime_Text_VisitRopeFxn2
#define Text_Module_State xdc_runtime_Text_Module_State
#define Text_nameUnknown xdc_runtime_Text_nameUnknown
#define Text_nameEmpty xdc_runtime_Text_nameEmpty
#define Text_nameStatic xdc_runtime_Text_nameStatic
#define Text_isLoaded xdc_runtime_Text_isLoaded
#define Text_charTab xdc_runtime_Text_charTab
#define Text_nodeTab xdc_runtime_Text_nodeTab
#define Text_charCnt xdc_runtime_Text_charCnt
#define Text_nodeCnt xdc_runtime_Text_nodeCnt
#define Text_unnamedModsLastId xdc_runtime_Text_unnamedModsLastId
#define Text_registryModsLastId xdc_runtime_Text_registryModsLastId
#define Text_visitRopeFxn xdc_runtime_Text_visitRopeFxn
#define Text_visitRopeFxn2 xdc_runtime_Text_visitRopeFxn2
#define Text_cordText xdc_runtime_Text_cordText
#define Text_ropeText xdc_runtime_Text_ropeText
#define Text_matchRope xdc_runtime_Text_matchRope
#define Text_putLab xdc_runtime_Text_putLab
#define Text_putMod xdc_runtime_Text_putMod
#define Text_putSite xdc_runtime_Text_putSite
#define Text_Module_name xdc_runtime_Text_Module_name
#define Text_Module_id xdc_runtime_Text_Module_id
#define Text_Module_startup xdc_runtime_Text_Module_startup
#define Text_Module_startupDone xdc_runtime_Text_Module_startupDone
#define Text_Module_hasMask xdc_runtime_Text_Module_hasMask
#define Text_Module_getMask xdc_runtime_Text_Module_getMask
#define Text_Module_setMask xdc_runtime_Text_Module_setMask
#define Text_Object_heap xdc_runtime_Text_Object_heap
#define Text_Module_heap xdc_runtime_Text_Module_heap

#endif /* xdc_runtime_Text__localnames__done */
#endif
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

