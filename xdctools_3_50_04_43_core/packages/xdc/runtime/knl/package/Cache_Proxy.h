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
 *     MODULE-WIDE CONFIGS
 *     VIRTUAL FUNCTIONS
 *     FUNCTION DECLARATIONS
 *     CONVERTORS
 *     SYSTEM FUNCTIONS
 *
 *     EPILOGUE
 *     PREFIX ALIASES
 */


/*
 * ======== PROLOGUE ========
 */

#ifndef xdc_runtime_knl_Cache_Proxy__include
#define xdc_runtime_knl_Cache_Proxy__include

#ifndef __nested__
#define __nested__
#define xdc_runtime_knl_Cache_Proxy__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_runtime_knl_Cache_Proxy___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/knl/package/package.defs.h>

#include <xdc/runtime/knl/ICacheSupport.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled__CR
#define xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled (xdc_runtime_knl_Cache_Proxy_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded__CR
#define xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded (xdc_runtime_knl_Cache_Proxy_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_runtime_knl_Cache_Proxy_Module__diagsMask;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__diagsMask xdc_runtime_knl_Cache_Proxy_Module__diagsMask__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__diagsMask__CR
#define xdc_runtime_knl_Cache_Proxy_Module__diagsMask__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__diagsMask*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__diagsMask__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__diagsMask (xdc_runtime_knl_Cache_Proxy_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_runtime_knl_Cache_Proxy_Module__gateObj;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__gateObj xdc_runtime_knl_Cache_Proxy_Module__gateObj__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__gateObj__CR
#define xdc_runtime_knl_Cache_Proxy_Module__gateObj__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__gateObj*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__gateObj__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__gateObj (xdc_runtime_knl_Cache_Proxy_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_runtime_knl_Cache_Proxy_Module__gatePrms;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__gatePrms xdc_runtime_knl_Cache_Proxy_Module__gatePrms__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__gatePrms__CR
#define xdc_runtime_knl_Cache_Proxy_Module__gatePrms__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__gatePrms*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__gatePrms__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__gatePrms (xdc_runtime_knl_Cache_Proxy_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_knl_Cache_Proxy_Module__id;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__id xdc_runtime_knl_Cache_Proxy_Module__id__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__id__CR
#define xdc_runtime_knl_Cache_Proxy_Module__id__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__id*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__id__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__id (xdc_runtime_knl_Cache_Proxy_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_runtime_knl_Cache_Proxy_Module__loggerDefined;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__loggerDefined xdc_runtime_knl_Cache_Proxy_Module__loggerDefined__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__loggerDefined__CR
#define xdc_runtime_knl_Cache_Proxy_Module__loggerDefined__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__loggerDefined*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__loggerDefined__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__loggerDefined (xdc_runtime_knl_Cache_Proxy_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_runtime_knl_Cache_Proxy_Module__loggerObj;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__loggerObj xdc_runtime_knl_Cache_Proxy_Module__loggerObj__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__loggerObj__CR
#define xdc_runtime_knl_Cache_Proxy_Module__loggerObj__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__loggerObj*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__loggerObj__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__loggerObj (xdc_runtime_knl_Cache_Proxy_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0 xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0__CR
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0 (xdc_runtime_knl_Cache_Proxy_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1 xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1__CR
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1 (xdc_runtime_knl_Cache_Proxy_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2 xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2__CR
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2 (xdc_runtime_knl_Cache_Proxy_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4 xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4__CR
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4 (xdc_runtime_knl_Cache_Proxy_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8 xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8__CR
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8__C (*((CT__xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8 (xdc_runtime_knl_Cache_Proxy_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_runtime_knl_Cache_Proxy_Object__count;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Object__count xdc_runtime_knl_Cache_Proxy_Object__count__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Object__count__CR
#define xdc_runtime_knl_Cache_Proxy_Object__count__C (*((CT__xdc_runtime_knl_Cache_Proxy_Object__count*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Object__count__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Object__count (xdc_runtime_knl_Cache_Proxy_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_knl_Cache_Proxy_Object__heap;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Object__heap xdc_runtime_knl_Cache_Proxy_Object__heap__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Object__heap__CR
#define xdc_runtime_knl_Cache_Proxy_Object__heap__C (*((CT__xdc_runtime_knl_Cache_Proxy_Object__heap*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Object__heap__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Object__heap (xdc_runtime_knl_Cache_Proxy_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_runtime_knl_Cache_Proxy_Object__sizeof;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Object__sizeof xdc_runtime_knl_Cache_Proxy_Object__sizeof__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Object__sizeof__CR
#define xdc_runtime_knl_Cache_Proxy_Object__sizeof__C (*((CT__xdc_runtime_knl_Cache_Proxy_Object__sizeof*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Object__sizeof__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Object__sizeof (xdc_runtime_knl_Cache_Proxy_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_runtime_knl_Cache_Proxy_Object__table;
__extern __FAR__ const CT__xdc_runtime_knl_Cache_Proxy_Object__table xdc_runtime_knl_Cache_Proxy_Object__table__C;
#ifdef xdc_runtime_knl_Cache_Proxy_Object__table__CR
#define xdc_runtime_knl_Cache_Proxy_Object__table__C (*((CT__xdc_runtime_knl_Cache_Proxy_Object__table*)(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Object__table__C_offset)))
#else
#define xdc_runtime_knl_Cache_Proxy_Object__table (xdc_runtime_knl_Cache_Proxy_Object__table__C)
#endif


/*
 * ======== VIRTUAL FUNCTIONS ========
 */

/* Fxns__ */
struct xdc_runtime_knl_Cache_Proxy_Fxns__ {
    const xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2* __sysp;
    xdc_Bool (*inv)(xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bool wait, xdc_runtime_Error_Block* eb);
    xdc_Bool (*wb)(xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bool wait, xdc_runtime_Error_Block* eb);
    xdc_Bool (*wbInv)(xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bool wait, xdc_runtime_Error_Block* eb);
    xdc_Bool (*wait)(xdc_runtime_Error_Block* eb);
    xdc_runtime_Types_SysFxns2 __sfxns;
};
#ifndef xdc_runtime_knl_Cache_Proxy_Module__FXNS__CR

/* Module__FXNS__C */
__extern const xdc_runtime_knl_Cache_Proxy_Fxns__ xdc_runtime_knl_Cache_Proxy_Module__FXNS__C;
#else
#define xdc_runtime_knl_Cache_Proxy_Module__FXNS__C (*(xdcRomConstPtr + xdc_runtime_knl_Cache_Proxy_Module__FXNS__C_offset))
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_runtime_knl_Cache_Proxy_Module_startup( state ) (-1)

/* Handle__label__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Handle__label__S, "xdc_runtime_knl_Cache_Proxy_Handle__label__S")
__extern xdc_runtime_Types_Label *xdc_runtime_knl_Cache_Proxy_Handle__label__S( xdc_Ptr obj, xdc_runtime_Types_Label *lab );

/* Module__startupDone__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Module__startupDone__S, "xdc_runtime_knl_Cache_Proxy_Module__startupDone__S")
__extern xdc_Bool xdc_runtime_knl_Cache_Proxy_Module__startupDone__S( void );

/* Object__get__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Object__get__S, "xdc_runtime_knl_Cache_Proxy_Object__get__S")
__extern xdc_Ptr xdc_runtime_knl_Cache_Proxy_Object__get__S( xdc_Ptr oarr, xdc_Int i );

/* Object__first__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Object__first__S, "xdc_runtime_knl_Cache_Proxy_Object__first__S")
__extern xdc_Ptr xdc_runtime_knl_Cache_Proxy_Object__first__S( void );

/* Object__next__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Object__next__S, "xdc_runtime_knl_Cache_Proxy_Object__next__S")
__extern xdc_Ptr xdc_runtime_knl_Cache_Proxy_Object__next__S( xdc_Ptr obj );

/* Params__init__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Params__init__S, "xdc_runtime_knl_Cache_Proxy_Params__init__S")
__extern xdc_Void xdc_runtime_knl_Cache_Proxy_Params__init__S( xdc_Ptr dst, const xdc_Void *src, xdc_SizeT psz, xdc_SizeT isz );

/* Proxy__abstract__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Proxy__abstract__S, "xdc_runtime_knl_Cache_Proxy_Proxy__abstract__S")
__extern xdc_Bool xdc_runtime_knl_Cache_Proxy_Proxy__abstract__S( void );

/* Proxy__delegate__S */
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_Proxy__delegate__S, "xdc_runtime_knl_Cache_Proxy_Proxy__delegate__S")
__extern xdc_CPtr xdc_runtime_knl_Cache_Proxy_Proxy__delegate__S( void );

/* inv__E */
#define xdc_runtime_knl_Cache_Proxy_inv xdc_runtime_knl_Cache_Proxy_inv__E
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_inv__E, "xdc_runtime_knl_Cache_Proxy_inv")
__extern xdc_Bool xdc_runtime_knl_Cache_Proxy_inv__E( xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bool wait, xdc_runtime_Error_Block *eb );

/* wb__E */
#define xdc_runtime_knl_Cache_Proxy_wb xdc_runtime_knl_Cache_Proxy_wb__E
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_wb__E, "xdc_runtime_knl_Cache_Proxy_wb")
__extern xdc_Bool xdc_runtime_knl_Cache_Proxy_wb__E( xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bool wait, xdc_runtime_Error_Block *eb );

/* wbInv__E */
#define xdc_runtime_knl_Cache_Proxy_wbInv xdc_runtime_knl_Cache_Proxy_wbInv__E
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_wbInv__E, "xdc_runtime_knl_Cache_Proxy_wbInv")
__extern xdc_Bool xdc_runtime_knl_Cache_Proxy_wbInv__E( xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bool wait, xdc_runtime_Error_Block *eb );

/* wait__E */
#define xdc_runtime_knl_Cache_Proxy_wait xdc_runtime_knl_Cache_Proxy_wait__E
xdc__CODESECT(xdc_runtime_knl_Cache_Proxy_wait__E, "xdc_runtime_knl_Cache_Proxy_wait")
__extern xdc_Bool xdc_runtime_knl_Cache_Proxy_wait__E( xdc_runtime_Error_Block *eb );


/*
 * ======== CONVERTORS ========
 */

/* Module_upCast */
static inline xdc_runtime_knl_ICacheSupport_Module xdc_runtime_knl_Cache_Proxy_Module_upCast(void);
static inline xdc_runtime_knl_ICacheSupport_Module xdc_runtime_knl_Cache_Proxy_Module_upCast(void)
{
    return (xdc_runtime_knl_ICacheSupport_Module)xdc_runtime_knl_Cache_Proxy_Proxy__delegate__S();
}

/* Module_to_xdc_runtime_knl_ICacheSupport */
#define xdc_runtime_knl_Cache_Proxy_Module_to_xdc_runtime_knl_ICacheSupport xdc_runtime_knl_Cache_Proxy_Module_upCast


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_runtime_knl_Cache_Proxy_Module_startupDone() xdc_runtime_knl_Cache_Proxy_Module__startupDone__S()

/* Object_heap */
#define xdc_runtime_knl_Cache_Proxy_Object_heap() xdc_runtime_knl_Cache_Proxy_Object__heap__C

/* Module_heap */
#define xdc_runtime_knl_Cache_Proxy_Module_heap() xdc_runtime_knl_Cache_Proxy_Object__heap__C

/* Module_id */
static inline CT__xdc_runtime_knl_Cache_Proxy_Module__id xdc_runtime_knl_Cache_Proxy_Module_id(void);
static inline CT__xdc_runtime_knl_Cache_Proxy_Module__id xdc_runtime_knl_Cache_Proxy_Module_id( void ) 
{
    return xdc_runtime_knl_Cache_Proxy_Module__id__C;
}

/* Proxy_abstract */
#define xdc_runtime_knl_Cache_Proxy_Proxy_abstract() xdc_runtime_knl_Cache_Proxy_Proxy__abstract__S()

/* Proxy_delegate */
#define xdc_runtime_knl_Cache_Proxy_Proxy_delegate() ((xdc_runtime_knl_ICacheSupport_Module)xdc_runtime_knl_Cache_Proxy_Proxy__delegate__S())


/*
 * ======== EPILOGUE ========
 */

#ifdef xdc_runtime_knl_Cache_Proxy__top__
#undef __nested__
#endif

#endif /* xdc_runtime_knl_Cache_Proxy__include */


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_runtime_knl_Cache_Proxy__nolocalnames)

#ifndef xdc_runtime_knl_Cache_Proxy__localnames__done
#define xdc_runtime_knl_Cache_Proxy__localnames__done

/* module prefix */
#define Cache_Proxy_inv xdc_runtime_knl_Cache_Proxy_inv
#define Cache_Proxy_wb xdc_runtime_knl_Cache_Proxy_wb
#define Cache_Proxy_wbInv xdc_runtime_knl_Cache_Proxy_wbInv
#define Cache_Proxy_wait xdc_runtime_knl_Cache_Proxy_wait
#define Cache_Proxy_Module_name xdc_runtime_knl_Cache_Proxy_Module_name
#define Cache_Proxy_Module_id xdc_runtime_knl_Cache_Proxy_Module_id
#define Cache_Proxy_Module_startup xdc_runtime_knl_Cache_Proxy_Module_startup
#define Cache_Proxy_Module_startupDone xdc_runtime_knl_Cache_Proxy_Module_startupDone
#define Cache_Proxy_Module_hasMask xdc_runtime_knl_Cache_Proxy_Module_hasMask
#define Cache_Proxy_Module_getMask xdc_runtime_knl_Cache_Proxy_Module_getMask
#define Cache_Proxy_Module_setMask xdc_runtime_knl_Cache_Proxy_Module_setMask
#define Cache_Proxy_Object_heap xdc_runtime_knl_Cache_Proxy_Object_heap
#define Cache_Proxy_Module_heap xdc_runtime_knl_Cache_Proxy_Module_heap
#define Cache_Proxy_Proxy_abstract xdc_runtime_knl_Cache_Proxy_Proxy_abstract
#define Cache_Proxy_Proxy_delegate xdc_runtime_knl_Cache_Proxy_Proxy_delegate
#define Cache_Proxy_Module_upCast xdc_runtime_knl_Cache_Proxy_Module_upCast
#define Cache_Proxy_Module_to_xdc_runtime_knl_ICacheSupport xdc_runtime_knl_Cache_Proxy_Module_to_xdc_runtime_knl_ICacheSupport

#endif /* xdc_runtime_knl_Cache_Proxy__localnames__done */
#endif
