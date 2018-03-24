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

#ifndef xdc_runtime_Core__include
#define xdc_runtime_Core__include

#ifndef __nested__
#define __nested__
#define xdc_runtime_Core__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_runtime_Core___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/package/package.defs.h>

#include <xdc/runtime/IModule.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/IHeap.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Text.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* ObjDesc */
struct xdc_runtime_Core_ObjDesc {
    xdc_CPtr fxnTab;
    xdc_runtime_Types_Link *modLink;
    xdc_SizeT objAlign;
    xdc_runtime_IHeap_Handle objHeap;
    xdc_SizeT objName;
    xdc_SizeT objSize;
    xdc_CPtr prmsInit;
    xdc_SizeT prmsSize;
};


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_runtime_Core_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_runtime_Core_Module__diagsEnabled xdc_runtime_Core_Module__diagsEnabled__C;
#ifdef xdc_runtime_Core_Module__diagsEnabled__CR
#define xdc_runtime_Core_Module__diagsEnabled__C (*((CT__xdc_runtime_Core_Module__diagsEnabled*)(xdcRomConstPtr + xdc_runtime_Core_Module__diagsEnabled__C_offset)))
#else
#define xdc_runtime_Core_Module__diagsEnabled (xdc_runtime_Core_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_runtime_Core_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_runtime_Core_Module__diagsIncluded xdc_runtime_Core_Module__diagsIncluded__C;
#ifdef xdc_runtime_Core_Module__diagsIncluded__CR
#define xdc_runtime_Core_Module__diagsIncluded__C (*((CT__xdc_runtime_Core_Module__diagsIncluded*)(xdcRomConstPtr + xdc_runtime_Core_Module__diagsIncluded__C_offset)))
#else
#define xdc_runtime_Core_Module__diagsIncluded (xdc_runtime_Core_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_runtime_Core_Module__diagsMask;
__extern __FAR__ const CT__xdc_runtime_Core_Module__diagsMask xdc_runtime_Core_Module__diagsMask__C;
#ifdef xdc_runtime_Core_Module__diagsMask__CR
#define xdc_runtime_Core_Module__diagsMask__C (*((CT__xdc_runtime_Core_Module__diagsMask*)(xdcRomConstPtr + xdc_runtime_Core_Module__diagsMask__C_offset)))
#else
#define xdc_runtime_Core_Module__diagsMask (xdc_runtime_Core_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_runtime_Core_Module__gateObj;
__extern __FAR__ const CT__xdc_runtime_Core_Module__gateObj xdc_runtime_Core_Module__gateObj__C;
#ifdef xdc_runtime_Core_Module__gateObj__CR
#define xdc_runtime_Core_Module__gateObj__C (*((CT__xdc_runtime_Core_Module__gateObj*)(xdcRomConstPtr + xdc_runtime_Core_Module__gateObj__C_offset)))
#else
#define xdc_runtime_Core_Module__gateObj (xdc_runtime_Core_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_runtime_Core_Module__gatePrms;
__extern __FAR__ const CT__xdc_runtime_Core_Module__gatePrms xdc_runtime_Core_Module__gatePrms__C;
#ifdef xdc_runtime_Core_Module__gatePrms__CR
#define xdc_runtime_Core_Module__gatePrms__C (*((CT__xdc_runtime_Core_Module__gatePrms*)(xdcRomConstPtr + xdc_runtime_Core_Module__gatePrms__C_offset)))
#else
#define xdc_runtime_Core_Module__gatePrms (xdc_runtime_Core_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Core_Module__id;
__extern __FAR__ const CT__xdc_runtime_Core_Module__id xdc_runtime_Core_Module__id__C;
#ifdef xdc_runtime_Core_Module__id__CR
#define xdc_runtime_Core_Module__id__C (*((CT__xdc_runtime_Core_Module__id*)(xdcRomConstPtr + xdc_runtime_Core_Module__id__C_offset)))
#else
#define xdc_runtime_Core_Module__id (xdc_runtime_Core_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_runtime_Core_Module__loggerDefined;
__extern __FAR__ const CT__xdc_runtime_Core_Module__loggerDefined xdc_runtime_Core_Module__loggerDefined__C;
#ifdef xdc_runtime_Core_Module__loggerDefined__CR
#define xdc_runtime_Core_Module__loggerDefined__C (*((CT__xdc_runtime_Core_Module__loggerDefined*)(xdcRomConstPtr + xdc_runtime_Core_Module__loggerDefined__C_offset)))
#else
#define xdc_runtime_Core_Module__loggerDefined (xdc_runtime_Core_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_runtime_Core_Module__loggerObj;
__extern __FAR__ const CT__xdc_runtime_Core_Module__loggerObj xdc_runtime_Core_Module__loggerObj__C;
#ifdef xdc_runtime_Core_Module__loggerObj__CR
#define xdc_runtime_Core_Module__loggerObj__C (*((CT__xdc_runtime_Core_Module__loggerObj*)(xdcRomConstPtr + xdc_runtime_Core_Module__loggerObj__C_offset)))
#else
#define xdc_runtime_Core_Module__loggerObj (xdc_runtime_Core_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Core_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_runtime_Core_Module__loggerFxn0 xdc_runtime_Core_Module__loggerFxn0__C;
#ifdef xdc_runtime_Core_Module__loggerFxn0__CR
#define xdc_runtime_Core_Module__loggerFxn0__C (*((CT__xdc_runtime_Core_Module__loggerFxn0*)(xdcRomConstPtr + xdc_runtime_Core_Module__loggerFxn0__C_offset)))
#else
#define xdc_runtime_Core_Module__loggerFxn0 (xdc_runtime_Core_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Core_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_runtime_Core_Module__loggerFxn1 xdc_runtime_Core_Module__loggerFxn1__C;
#ifdef xdc_runtime_Core_Module__loggerFxn1__CR
#define xdc_runtime_Core_Module__loggerFxn1__C (*((CT__xdc_runtime_Core_Module__loggerFxn1*)(xdcRomConstPtr + xdc_runtime_Core_Module__loggerFxn1__C_offset)))
#else
#define xdc_runtime_Core_Module__loggerFxn1 (xdc_runtime_Core_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Core_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_runtime_Core_Module__loggerFxn2 xdc_runtime_Core_Module__loggerFxn2__C;
#ifdef xdc_runtime_Core_Module__loggerFxn2__CR
#define xdc_runtime_Core_Module__loggerFxn2__C (*((CT__xdc_runtime_Core_Module__loggerFxn2*)(xdcRomConstPtr + xdc_runtime_Core_Module__loggerFxn2__C_offset)))
#else
#define xdc_runtime_Core_Module__loggerFxn2 (xdc_runtime_Core_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Core_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_runtime_Core_Module__loggerFxn4 xdc_runtime_Core_Module__loggerFxn4__C;
#ifdef xdc_runtime_Core_Module__loggerFxn4__CR
#define xdc_runtime_Core_Module__loggerFxn4__C (*((CT__xdc_runtime_Core_Module__loggerFxn4*)(xdcRomConstPtr + xdc_runtime_Core_Module__loggerFxn4__C_offset)))
#else
#define xdc_runtime_Core_Module__loggerFxn4 (xdc_runtime_Core_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Core_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_runtime_Core_Module__loggerFxn8 xdc_runtime_Core_Module__loggerFxn8__C;
#ifdef xdc_runtime_Core_Module__loggerFxn8__CR
#define xdc_runtime_Core_Module__loggerFxn8__C (*((CT__xdc_runtime_Core_Module__loggerFxn8*)(xdcRomConstPtr + xdc_runtime_Core_Module__loggerFxn8__C_offset)))
#else
#define xdc_runtime_Core_Module__loggerFxn8 (xdc_runtime_Core_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_runtime_Core_Object__count;
__extern __FAR__ const CT__xdc_runtime_Core_Object__count xdc_runtime_Core_Object__count__C;
#ifdef xdc_runtime_Core_Object__count__CR
#define xdc_runtime_Core_Object__count__C (*((CT__xdc_runtime_Core_Object__count*)(xdcRomConstPtr + xdc_runtime_Core_Object__count__C_offset)))
#else
#define xdc_runtime_Core_Object__count (xdc_runtime_Core_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Core_Object__heap;
__extern __FAR__ const CT__xdc_runtime_Core_Object__heap xdc_runtime_Core_Object__heap__C;
#ifdef xdc_runtime_Core_Object__heap__CR
#define xdc_runtime_Core_Object__heap__C (*((CT__xdc_runtime_Core_Object__heap*)(xdcRomConstPtr + xdc_runtime_Core_Object__heap__C_offset)))
#else
#define xdc_runtime_Core_Object__heap (xdc_runtime_Core_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_runtime_Core_Object__sizeof;
__extern __FAR__ const CT__xdc_runtime_Core_Object__sizeof xdc_runtime_Core_Object__sizeof__C;
#ifdef xdc_runtime_Core_Object__sizeof__CR
#define xdc_runtime_Core_Object__sizeof__C (*((CT__xdc_runtime_Core_Object__sizeof*)(xdcRomConstPtr + xdc_runtime_Core_Object__sizeof__C_offset)))
#else
#define xdc_runtime_Core_Object__sizeof (xdc_runtime_Core_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_runtime_Core_Object__table;
__extern __FAR__ const CT__xdc_runtime_Core_Object__table xdc_runtime_Core_Object__table__C;
#ifdef xdc_runtime_Core_Object__table__CR
#define xdc_runtime_Core_Object__table__C (*((CT__xdc_runtime_Core_Object__table*)(xdcRomConstPtr + xdc_runtime_Core_Object__table__C_offset)))
#else
#define xdc_runtime_Core_Object__table (xdc_runtime_Core_Object__table__C)
#endif

/* A_initializedParams */
typedef xdc_runtime_Assert_Id CT__xdc_runtime_Core_A_initializedParams;
__extern __FAR__ const CT__xdc_runtime_Core_A_initializedParams xdc_runtime_Core_A_initializedParams__C;
#ifdef xdc_runtime_Core_A_initializedParams__CR
#define xdc_runtime_Core_A_initializedParams (*((CT__xdc_runtime_Core_A_initializedParams*)(xdcRomConstPtr + xdc_runtime_Core_A_initializedParams__C_offset)))
#else
#define xdc_runtime_Core_A_initializedParams (xdc_runtime_Core_A_initializedParams__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_runtime_Core_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(xdc_runtime_Core_Module__startupDone__S, "xdc_runtime_Core_Module__startupDone__S")
__extern xdc_Bool xdc_runtime_Core_Module__startupDone__S( void );

/* allocObject__I */
#define xdc_runtime_Core_allocObject xdc_runtime_Core_allocObject__I
xdc__CODESECT(xdc_runtime_Core_allocObject__I, "xdc_runtime_Core_allocObject")
__extern xdc_Ptr xdc_runtime_Core_allocObject__I( const xdc_runtime_Core_ObjDesc *od, xdc_runtime_Error_Block *eb );

/* assignLabel__I */
#define xdc_runtime_Core_assignLabel xdc_runtime_Core_assignLabel__I
xdc__CODESECT(xdc_runtime_Core_assignLabel__I, "xdc_runtime_Core_assignLabel")
__extern xdc_Void xdc_runtime_Core_assignLabel__I( xdc_runtime_Types_Label *lab, xdc_runtime_Text_CordAddr iname, xdc_Bool named );

/* assignParams__I */
#define xdc_runtime_Core_assignParams xdc_runtime_Core_assignParams__I
xdc__CODESECT(xdc_runtime_Core_assignParams__I, "xdc_runtime_Core_assignParams")
__extern xdc_Void xdc_runtime_Core_assignParams__I( xdc_Ptr dstPrms, xdc_CPtr srcPrms, xdc_SizeT mpsz, xdc_SizeT ipsz );

/* createObject__I */
#define xdc_runtime_Core_createObject xdc_runtime_Core_createObject__I
xdc__CODESECT(xdc_runtime_Core_createObject__I, "xdc_runtime_Core_createObject")
__extern xdc_Ptr xdc_runtime_Core_createObject__I( const xdc_runtime_Core_ObjDesc *od, xdc_Ptr curObj, xdc_Ptr resPrms, xdc_CPtr argPrms, xdc_SizeT argPrmsSize, xdc_runtime_Error_Block *eb );

/* constructObject__I */
#define xdc_runtime_Core_constructObject xdc_runtime_Core_constructObject__I
xdc__CODESECT(xdc_runtime_Core_constructObject__I, "xdc_runtime_Core_constructObject")
__extern xdc_Ptr xdc_runtime_Core_constructObject__I( const xdc_runtime_Core_ObjDesc *od, xdc_Ptr curObj, xdc_Ptr resPrms, xdc_CPtr argPrms, xdc_SizeT argPrmsSize, xdc_runtime_Error_Block *eb );

/* deleteObject__I */
#define xdc_runtime_Core_deleteObject xdc_runtime_Core_deleteObject__I
xdc__CODESECT(xdc_runtime_Core_deleteObject__I, "xdc_runtime_Core_deleteObject")
__extern xdc_Void xdc_runtime_Core_deleteObject__I( const xdc_runtime_Core_ObjDesc *od, xdc_Ptr curObj, xdc_Fxn finalFxn, xdc_Int istat, xdc_Bool consFlg );

/* delistObject__I */
#define xdc_runtime_Core_delistObject xdc_runtime_Core_delistObject__I
xdc__CODESECT(xdc_runtime_Core_delistObject__I, "xdc_runtime_Core_delistObject")
__extern xdc_Void xdc_runtime_Core_delistObject__I( const xdc_runtime_Core_ObjDesc *od, xdc_Ptr curObj );

/* destructObject__I */
#define xdc_runtime_Core_destructObject xdc_runtime_Core_destructObject__I
xdc__CODESECT(xdc_runtime_Core_destructObject__I, "xdc_runtime_Core_destructObject")
__extern xdc_Void xdc_runtime_Core_destructObject__I( const xdc_runtime_Core_ObjDesc *od, xdc_Ptr curObj, xdc_Fxn finalFxn, xdc_Int istat, xdc_Bool consFlg );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_runtime_Core_Module_startupDone() xdc_runtime_Core_Module__startupDone__S()

/* Object_heap */
#define xdc_runtime_Core_Object_heap() xdc_runtime_Core_Object__heap__C

/* Module_heap */
#define xdc_runtime_Core_Module_heap() xdc_runtime_Core_Object__heap__C

/* Module_id */
static inline CT__xdc_runtime_Core_Module__id xdc_runtime_Core_Module_id(void);
static inline CT__xdc_runtime_Core_Module__id xdc_runtime_Core_Module_id( void ) 
{
    return xdc_runtime_Core_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool xdc_runtime_Core_Module_hasMask(void);
static inline xdc_Bool xdc_runtime_Core_Module_hasMask(void) 
{
    return (xdc_Bool)(xdc_runtime_Core_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 xdc_runtime_Core_Module_getMask(void);
static inline xdc_Bits16 xdc_runtime_Core_Module_getMask( void ) 
{
    return xdc_runtime_Core_Module__diagsMask__C != NULL ? *xdc_runtime_Core_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void xdc_runtime_Core_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void xdc_runtime_Core_Module_setMask(xdc_Bits16 mask)
{
    if (xdc_runtime_Core_Module__diagsMask__C != NULL) {
        *xdc_runtime_Core_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef xdc_runtime_Core__top__
#undef __nested__
#endif

#endif /* xdc_runtime_Core__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(xdc_runtime_Core__internalaccess))

#ifndef xdc_runtime_Core__include_state
#define xdc_runtime_Core__include_state


#endif /* xdc_runtime_Core__include_state */

#endif

/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_runtime_Core__nolocalnames)

#ifndef xdc_runtime_Core__localnames__done
#define xdc_runtime_Core__localnames__done

/* module prefix */
#define Core_ObjDesc xdc_runtime_Core_ObjDesc
#define Core_A_initializedParams xdc_runtime_Core_A_initializedParams
#define Core_Module_name xdc_runtime_Core_Module_name
#define Core_Module_id xdc_runtime_Core_Module_id
#define Core_Module_startup xdc_runtime_Core_Module_startup
#define Core_Module_startupDone xdc_runtime_Core_Module_startupDone
#define Core_Module_hasMask xdc_runtime_Core_Module_hasMask
#define Core_Module_getMask xdc_runtime_Core_Module_getMask
#define Core_Module_setMask xdc_runtime_Core_Module_setMask
#define Core_Object_heap xdc_runtime_Core_Object_heap
#define Core_Module_heap xdc_runtime_Core_Module_heap

#endif /* xdc_runtime_Core__localnames__done */
#endif
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

