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

#ifndef xdc_runtime_Gate__include
#define xdc_runtime_Gate__include

#ifndef __nested__
#define __nested__
#define xdc_runtime_Gate__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_runtime_Gate___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Gate__prologue.h>
#include <xdc/runtime/package/package.defs.h>

#include <xdc/runtime/IModule.h>
#include <xdc/runtime/IGateProvider.h>
#include <xdc/runtime/Error.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* Ref */


/*
 * ======== INTERNAL DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_runtime_Gate_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__diagsEnabled xdc_runtime_Gate_Module__diagsEnabled__C;
#ifdef xdc_runtime_Gate_Module__diagsEnabled__CR
#define xdc_runtime_Gate_Module__diagsEnabled__C (*((CT__xdc_runtime_Gate_Module__diagsEnabled*)(xdcRomConstPtr + xdc_runtime_Gate_Module__diagsEnabled__C_offset)))
#else
#define xdc_runtime_Gate_Module__diagsEnabled (xdc_runtime_Gate_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_runtime_Gate_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__diagsIncluded xdc_runtime_Gate_Module__diagsIncluded__C;
#ifdef xdc_runtime_Gate_Module__diagsIncluded__CR
#define xdc_runtime_Gate_Module__diagsIncluded__C (*((CT__xdc_runtime_Gate_Module__diagsIncluded*)(xdcRomConstPtr + xdc_runtime_Gate_Module__diagsIncluded__C_offset)))
#else
#define xdc_runtime_Gate_Module__diagsIncluded (xdc_runtime_Gate_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_runtime_Gate_Module__diagsMask;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__diagsMask xdc_runtime_Gate_Module__diagsMask__C;
#ifdef xdc_runtime_Gate_Module__diagsMask__CR
#define xdc_runtime_Gate_Module__diagsMask__C (*((CT__xdc_runtime_Gate_Module__diagsMask*)(xdcRomConstPtr + xdc_runtime_Gate_Module__diagsMask__C_offset)))
#else
#define xdc_runtime_Gate_Module__diagsMask (xdc_runtime_Gate_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_runtime_Gate_Module__gateObj;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__gateObj xdc_runtime_Gate_Module__gateObj__C;
#ifdef xdc_runtime_Gate_Module__gateObj__CR
#define xdc_runtime_Gate_Module__gateObj__C (*((CT__xdc_runtime_Gate_Module__gateObj*)(xdcRomConstPtr + xdc_runtime_Gate_Module__gateObj__C_offset)))
#else
#define xdc_runtime_Gate_Module__gateObj (xdc_runtime_Gate_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_runtime_Gate_Module__gatePrms;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__gatePrms xdc_runtime_Gate_Module__gatePrms__C;
#ifdef xdc_runtime_Gate_Module__gatePrms__CR
#define xdc_runtime_Gate_Module__gatePrms__C (*((CT__xdc_runtime_Gate_Module__gatePrms*)(xdcRomConstPtr + xdc_runtime_Gate_Module__gatePrms__C_offset)))
#else
#define xdc_runtime_Gate_Module__gatePrms (xdc_runtime_Gate_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Gate_Module__id;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__id xdc_runtime_Gate_Module__id__C;
#ifdef xdc_runtime_Gate_Module__id__CR
#define xdc_runtime_Gate_Module__id__C (*((CT__xdc_runtime_Gate_Module__id*)(xdcRomConstPtr + xdc_runtime_Gate_Module__id__C_offset)))
#else
#define xdc_runtime_Gate_Module__id (xdc_runtime_Gate_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_runtime_Gate_Module__loggerDefined;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__loggerDefined xdc_runtime_Gate_Module__loggerDefined__C;
#ifdef xdc_runtime_Gate_Module__loggerDefined__CR
#define xdc_runtime_Gate_Module__loggerDefined__C (*((CT__xdc_runtime_Gate_Module__loggerDefined*)(xdcRomConstPtr + xdc_runtime_Gate_Module__loggerDefined__C_offset)))
#else
#define xdc_runtime_Gate_Module__loggerDefined (xdc_runtime_Gate_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_runtime_Gate_Module__loggerObj;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__loggerObj xdc_runtime_Gate_Module__loggerObj__C;
#ifdef xdc_runtime_Gate_Module__loggerObj__CR
#define xdc_runtime_Gate_Module__loggerObj__C (*((CT__xdc_runtime_Gate_Module__loggerObj*)(xdcRomConstPtr + xdc_runtime_Gate_Module__loggerObj__C_offset)))
#else
#define xdc_runtime_Gate_Module__loggerObj (xdc_runtime_Gate_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Gate_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__loggerFxn0 xdc_runtime_Gate_Module__loggerFxn0__C;
#ifdef xdc_runtime_Gate_Module__loggerFxn0__CR
#define xdc_runtime_Gate_Module__loggerFxn0__C (*((CT__xdc_runtime_Gate_Module__loggerFxn0*)(xdcRomConstPtr + xdc_runtime_Gate_Module__loggerFxn0__C_offset)))
#else
#define xdc_runtime_Gate_Module__loggerFxn0 (xdc_runtime_Gate_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Gate_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__loggerFxn1 xdc_runtime_Gate_Module__loggerFxn1__C;
#ifdef xdc_runtime_Gate_Module__loggerFxn1__CR
#define xdc_runtime_Gate_Module__loggerFxn1__C (*((CT__xdc_runtime_Gate_Module__loggerFxn1*)(xdcRomConstPtr + xdc_runtime_Gate_Module__loggerFxn1__C_offset)))
#else
#define xdc_runtime_Gate_Module__loggerFxn1 (xdc_runtime_Gate_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Gate_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__loggerFxn2 xdc_runtime_Gate_Module__loggerFxn2__C;
#ifdef xdc_runtime_Gate_Module__loggerFxn2__CR
#define xdc_runtime_Gate_Module__loggerFxn2__C (*((CT__xdc_runtime_Gate_Module__loggerFxn2*)(xdcRomConstPtr + xdc_runtime_Gate_Module__loggerFxn2__C_offset)))
#else
#define xdc_runtime_Gate_Module__loggerFxn2 (xdc_runtime_Gate_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Gate_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__loggerFxn4 xdc_runtime_Gate_Module__loggerFxn4__C;
#ifdef xdc_runtime_Gate_Module__loggerFxn4__CR
#define xdc_runtime_Gate_Module__loggerFxn4__C (*((CT__xdc_runtime_Gate_Module__loggerFxn4*)(xdcRomConstPtr + xdc_runtime_Gate_Module__loggerFxn4__C_offset)))
#else
#define xdc_runtime_Gate_Module__loggerFxn4 (xdc_runtime_Gate_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Gate_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_runtime_Gate_Module__loggerFxn8 xdc_runtime_Gate_Module__loggerFxn8__C;
#ifdef xdc_runtime_Gate_Module__loggerFxn8__CR
#define xdc_runtime_Gate_Module__loggerFxn8__C (*((CT__xdc_runtime_Gate_Module__loggerFxn8*)(xdcRomConstPtr + xdc_runtime_Gate_Module__loggerFxn8__C_offset)))
#else
#define xdc_runtime_Gate_Module__loggerFxn8 (xdc_runtime_Gate_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_runtime_Gate_Object__count;
__extern __FAR__ const CT__xdc_runtime_Gate_Object__count xdc_runtime_Gate_Object__count__C;
#ifdef xdc_runtime_Gate_Object__count__CR
#define xdc_runtime_Gate_Object__count__C (*((CT__xdc_runtime_Gate_Object__count*)(xdcRomConstPtr + xdc_runtime_Gate_Object__count__C_offset)))
#else
#define xdc_runtime_Gate_Object__count (xdc_runtime_Gate_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Gate_Object__heap;
__extern __FAR__ const CT__xdc_runtime_Gate_Object__heap xdc_runtime_Gate_Object__heap__C;
#ifdef xdc_runtime_Gate_Object__heap__CR
#define xdc_runtime_Gate_Object__heap__C (*((CT__xdc_runtime_Gate_Object__heap*)(xdcRomConstPtr + xdc_runtime_Gate_Object__heap__C_offset)))
#else
#define xdc_runtime_Gate_Object__heap (xdc_runtime_Gate_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_runtime_Gate_Object__sizeof;
__extern __FAR__ const CT__xdc_runtime_Gate_Object__sizeof xdc_runtime_Gate_Object__sizeof__C;
#ifdef xdc_runtime_Gate_Object__sizeof__CR
#define xdc_runtime_Gate_Object__sizeof__C (*((CT__xdc_runtime_Gate_Object__sizeof*)(xdcRomConstPtr + xdc_runtime_Gate_Object__sizeof__C_offset)))
#else
#define xdc_runtime_Gate_Object__sizeof (xdc_runtime_Gate_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_runtime_Gate_Object__table;
__extern __FAR__ const CT__xdc_runtime_Gate_Object__table xdc_runtime_Gate_Object__table__C;
#ifdef xdc_runtime_Gate_Object__table__CR
#define xdc_runtime_Gate_Object__table__C (*((CT__xdc_runtime_Gate_Object__table*)(xdcRomConstPtr + xdc_runtime_Gate_Object__table__C_offset)))
#else
#define xdc_runtime_Gate_Object__table (xdc_runtime_Gate_Object__table__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_runtime_Gate_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(xdc_runtime_Gate_Module__startupDone__S, "xdc_runtime_Gate_Module__startupDone__S")
__extern xdc_Bool xdc_runtime_Gate_Module__startupDone__S( void );

/* enterSystem__E */
#define xdc_runtime_Gate_enterSystem xdc_runtime_Gate_enterSystem__E
xdc__CODESECT(xdc_runtime_Gate_enterSystem__E, "xdc_runtime_Gate_enterSystem")
__extern xdc_IArg xdc_runtime_Gate_enterSystem__E( void );

/* leaveSystem__E */
#define xdc_runtime_Gate_leaveSystem xdc_runtime_Gate_leaveSystem__E
xdc__CODESECT(xdc_runtime_Gate_leaveSystem__E, "xdc_runtime_Gate_leaveSystem")
__extern xdc_Void xdc_runtime_Gate_leaveSystem__E( xdc_IArg key );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_runtime_Gate_Module_startupDone() xdc_runtime_Gate_Module__startupDone__S()

/* Object_heap */
#define xdc_runtime_Gate_Object_heap() xdc_runtime_Gate_Object__heap__C

/* Module_heap */
#define xdc_runtime_Gate_Module_heap() xdc_runtime_Gate_Object__heap__C

/* Module_id */
static inline CT__xdc_runtime_Gate_Module__id xdc_runtime_Gate_Module_id(void);
static inline CT__xdc_runtime_Gate_Module__id xdc_runtime_Gate_Module_id( void ) 
{
    return xdc_runtime_Gate_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool xdc_runtime_Gate_Module_hasMask(void);
static inline xdc_Bool xdc_runtime_Gate_Module_hasMask(void) 
{
    return (xdc_Bool)(xdc_runtime_Gate_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 xdc_runtime_Gate_Module_getMask(void);
static inline xdc_Bits16 xdc_runtime_Gate_Module_getMask( void ) 
{
    return xdc_runtime_Gate_Module__diagsMask__C != NULL ? *xdc_runtime_Gate_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void xdc_runtime_Gate_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void xdc_runtime_Gate_Module_setMask(xdc_Bits16 mask)
{
    if (xdc_runtime_Gate_Module__diagsMask__C != NULL) {
        *xdc_runtime_Gate_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#include <xdc/runtime/Gate__epilogue.h>

#ifdef xdc_runtime_Gate__top__
#undef __nested__
#endif

#endif /* xdc_runtime_Gate__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(xdc_runtime_Gate__internalaccess))

#ifndef xdc_runtime_Gate__include_state
#define xdc_runtime_Gate__include_state


#endif /* xdc_runtime_Gate__include_state */

#endif

/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_runtime_Gate__nolocalnames)

#ifndef xdc_runtime_Gate__localnames__done
#define xdc_runtime_Gate__localnames__done

/* module prefix */
#define Gate_Ref xdc_runtime_Gate_Ref
#define Gate_allocInstance xdc_runtime_Gate_allocInstance
#define Gate_freeInstance xdc_runtime_Gate_freeInstance
#define Gate_enterInstance xdc_runtime_Gate_enterInstance
#define Gate_enterModule xdc_runtime_Gate_enterModule
#define Gate_enterSystem xdc_runtime_Gate_enterSystem
#define Gate_leaveInstance xdc_runtime_Gate_leaveInstance
#define Gate_leaveModule xdc_runtime_Gate_leaveModule
#define Gate_leaveSystem xdc_runtime_Gate_leaveSystem
#define Gate_canBlock xdc_runtime_Gate_canBlock
#define Gate_canBePreempted xdc_runtime_Gate_canBePreempted
#define Gate_Module_name xdc_runtime_Gate_Module_name
#define Gate_Module_id xdc_runtime_Gate_Module_id
#define Gate_Module_startup xdc_runtime_Gate_Module_startup
#define Gate_Module_startupDone xdc_runtime_Gate_Module_startupDone
#define Gate_Module_hasMask xdc_runtime_Gate_Module_hasMask
#define Gate_Module_getMask xdc_runtime_Gate_Module_getMask
#define Gate_Module_setMask xdc_runtime_Gate_Module_setMask
#define Gate_Object_heap xdc_runtime_Gate_Object_heap
#define Gate_Module_heap xdc_runtime_Gate_Module_heap

#endif /* xdc_runtime_Gate__localnames__done */
#endif
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

