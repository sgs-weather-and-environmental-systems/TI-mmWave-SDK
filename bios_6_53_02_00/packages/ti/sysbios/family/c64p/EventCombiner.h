/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D20
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

#ifndef ti_sysbios_family_c64p_EventCombiner__include
#define ti_sysbios_family_c64p_EventCombiner__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_c64p_EventCombiner__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_c64p_EventCombiner___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/c64p/package/package.defs.h>

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* NUM_EVENTS */
#define ti_sysbios_family_c64p_EventCombiner_NUM_EVENTS (128)

/* FuncPtr */
typedef xdc_Void (*ti_sysbios_family_c64p_EventCombiner_FuncPtr)(xdc_UArg __arg1);


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* DispatchTabElem */
struct ti_sysbios_family_c64p_EventCombiner_DispatchTabElem {
    ti_sysbios_family_c64p_EventCombiner_FuncPtr fxn;
    xdc_UArg arg;
};

/* Module_State */
typedef ti_sysbios_family_c64p_EventCombiner_DispatchTabElem __T1_ti_sysbios_family_c64p_EventCombiner_Module_State__dispatchTab;
typedef ti_sysbios_family_c64p_EventCombiner_DispatchTabElem __ARRAY1_ti_sysbios_family_c64p_EventCombiner_Module_State__dispatchTab[128];
typedef ti_sysbios_family_c64p_EventCombiner_DispatchTabElem __CARRAY1_ti_sysbios_family_c64p_EventCombiner_Module_State__dispatchTab[128];
typedef __ARRAY1_ti_sysbios_family_c64p_EventCombiner_Module_State__dispatchTab __TA_ti_sysbios_family_c64p_EventCombiner_Module_State__dispatchTab;


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled (ti_sysbios_family_c64p_EventCombiner_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded (ti_sysbios_family_c64p_EventCombiner_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsMask ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__diagsMask (ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_EventCombiner_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__gateObj ti_sysbios_family_c64p_EventCombiner_Module__gateObj__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__gateObj__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__gateObj__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__gateObj (ti_sysbios_family_c64p_EventCombiner_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_EventCombiner_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__gatePrms ti_sysbios_family_c64p_EventCombiner_Module__gatePrms__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__gatePrms__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__gatePrms__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__gatePrms (ti_sysbios_family_c64p_EventCombiner_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_c64p_EventCombiner_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__id ti_sysbios_family_c64p_EventCombiner_Module__id__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__id__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__id__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__id*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__id__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__id (ti_sysbios_family_c64p_EventCombiner_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined (ti_sysbios_family_c64p_EventCombiner_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerObj ti_sysbios_family_c64p_EventCombiner_Module__loggerObj__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__loggerObj__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerObj__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerObj (ti_sysbios_family_c64p_EventCombiner_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0 ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0 (ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1 ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1 (ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2 ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2 (ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4 ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4 (ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8 ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8__CR
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8 (ti_sysbios_family_c64p_EventCombiner_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_c64p_EventCombiner_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Object__count ti_sysbios_family_c64p_EventCombiner_Object__count__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Object__count__CR
#define ti_sysbios_family_c64p_EventCombiner_Object__count__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Object__count*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Object__count__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Object__count (ti_sysbios_family_c64p_EventCombiner_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_c64p_EventCombiner_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Object__heap ti_sysbios_family_c64p_EventCombiner_Object__heap__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Object__heap__CR
#define ti_sysbios_family_c64p_EventCombiner_Object__heap__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Object__heap__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Object__heap (ti_sysbios_family_c64p_EventCombiner_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_c64p_EventCombiner_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Object__sizeof ti_sysbios_family_c64p_EventCombiner_Object__sizeof__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Object__sizeof__CR
#define ti_sysbios_family_c64p_EventCombiner_Object__sizeof__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Object__sizeof (ti_sysbios_family_c64p_EventCombiner_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_EventCombiner_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_Object__table ti_sysbios_family_c64p_EventCombiner_Object__table__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_Object__table__CR
#define ti_sysbios_family_c64p_EventCombiner_Object__table__C (*((CT__ti_sysbios_family_c64p_EventCombiner_Object__table*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_Object__table__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_Object__table (ti_sysbios_family_c64p_EventCombiner_Object__table__C)
#endif

/* A_invalidEventId */
typedef xdc_runtime_Assert_Id CT__ti_sysbios_family_c64p_EventCombiner_A_invalidEventId;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_A_invalidEventId ti_sysbios_family_c64p_EventCombiner_A_invalidEventId__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_A_invalidEventId__CR
#define ti_sysbios_family_c64p_EventCombiner_A_invalidEventId (*((CT__ti_sysbios_family_c64p_EventCombiner_A_invalidEventId*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_A_invalidEventId__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_A_invalidEventId (ti_sysbios_family_c64p_EventCombiner_A_invalidEventId__C)
#endif

/* E_unpluggedEvent */
typedef xdc_runtime_Error_Id CT__ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent__CR
#define ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent (*((CT__ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent (ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent__C)
#endif

/* EVTMASK */
typedef xdc_Bits32 __T1_ti_sysbios_family_c64p_EventCombiner_EVTMASK;
typedef xdc_Bits32 __ARRAY1_ti_sysbios_family_c64p_EventCombiner_EVTMASK[4];
typedef xdc_Bits32 __CARRAY1_ti_sysbios_family_c64p_EventCombiner_EVTMASK[4];
typedef __CARRAY1_ti_sysbios_family_c64p_EventCombiner_EVTMASK __TA_ti_sysbios_family_c64p_EventCombiner_EVTMASK;
typedef __CARRAY1_ti_sysbios_family_c64p_EventCombiner_EVTMASK CT__ti_sysbios_family_c64p_EventCombiner_EVTMASK;
__extern __FAR__ const CT__ti_sysbios_family_c64p_EventCombiner_EVTMASK ti_sysbios_family_c64p_EventCombiner_EVTMASK__C;
#ifdef ti_sysbios_family_c64p_EventCombiner_EVTMASK__CR
#define ti_sysbios_family_c64p_EventCombiner_EVTMASK (*((CT__ti_sysbios_family_c64p_EventCombiner_EVTMASK*)(xdcRomConstPtr + ti_sysbios_family_c64p_EventCombiner_EVTMASK__C_offset)))
#else
#define ti_sysbios_family_c64p_EventCombiner_EVTMASK (ti_sysbios_family_c64p_EventCombiner_EVTMASK__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_c64p_EventCombiner_Module_startup ti_sysbios_family_c64p_EventCombiner_Module_startup__E
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_Module_startup__E, "ti_sysbios_family_c64p_EventCombiner_Module_startup")
__extern xdc_Int ti_sysbios_family_c64p_EventCombiner_Module_startup__E( xdc_Int state );
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_Module_startup__F, "ti_sysbios_family_c64p_EventCombiner_Module_startup")
__extern xdc_Int ti_sysbios_family_c64p_EventCombiner_Module_startup__F( xdc_Int state );

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_Module__startupDone__S, "ti_sysbios_family_c64p_EventCombiner_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_c64p_EventCombiner_Module__startupDone__S( void );

/* disableEvent__E */
#define ti_sysbios_family_c64p_EventCombiner_disableEvent ti_sysbios_family_c64p_EventCombiner_disableEvent__E
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_disableEvent__E, "ti_sysbios_family_c64p_EventCombiner_disableEvent")
__extern xdc_Void ti_sysbios_family_c64p_EventCombiner_disableEvent__E( xdc_UInt evt );

/* enableEvent__E */
#define ti_sysbios_family_c64p_EventCombiner_enableEvent ti_sysbios_family_c64p_EventCombiner_enableEvent__E
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_enableEvent__E, "ti_sysbios_family_c64p_EventCombiner_enableEvent")
__extern xdc_Void ti_sysbios_family_c64p_EventCombiner_enableEvent__E( xdc_UInt evt );

/* dispatch__E */
#define ti_sysbios_family_c64p_EventCombiner_dispatch ti_sysbios_family_c64p_EventCombiner_dispatch__E
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_dispatch__E, "ti_sysbios_family_c64p_EventCombiner_dispatch")
__extern xdc_Void ti_sysbios_family_c64p_EventCombiner_dispatch__E( xdc_UInt evt );

/* dispatchPlug__E */
#define ti_sysbios_family_c64p_EventCombiner_dispatchPlug ti_sysbios_family_c64p_EventCombiner_dispatchPlug__E
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_dispatchPlug__E, "ti_sysbios_family_c64p_EventCombiner_dispatchPlug")
__extern xdc_Void ti_sysbios_family_c64p_EventCombiner_dispatchPlug__E( xdc_UInt evt, ti_sysbios_family_c64p_EventCombiner_FuncPtr fxn, xdc_UArg arg, xdc_Bool unmask );

/* unused__E */
#define ti_sysbios_family_c64p_EventCombiner_unused ti_sysbios_family_c64p_EventCombiner_unused__E
xdc__CODESECT(ti_sysbios_family_c64p_EventCombiner_unused__E, "ti_sysbios_family_c64p_EventCombiner_unused")
__extern xdc_Void ti_sysbios_family_c64p_EventCombiner_unused__E( xdc_UArg arg );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_c64p_EventCombiner_Module_startupDone() ti_sysbios_family_c64p_EventCombiner_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_c64p_EventCombiner_Object_heap() ti_sysbios_family_c64p_EventCombiner_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_c64p_EventCombiner_Module_heap() ti_sysbios_family_c64p_EventCombiner_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_c64p_EventCombiner_Module__id ti_sysbios_family_c64p_EventCombiner_Module_id(void);
static inline CT__ti_sysbios_family_c64p_EventCombiner_Module__id ti_sysbios_family_c64p_EventCombiner_Module_id( void ) 
{
    return ti_sysbios_family_c64p_EventCombiner_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_c64p_EventCombiner_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_c64p_EventCombiner_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_c64p_EventCombiner_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_c64p_EventCombiner_Module_getMask( void ) 
{
    return ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C != NULL ? *ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_c64p_EventCombiner_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_c64p_EventCombiner_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_c64p_EventCombiner_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_c64p_EventCombiner__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_c64p_EventCombiner__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_c64p_EventCombiner__internalaccess))

#ifndef ti_sysbios_family_c64p_EventCombiner__include_state
#define ti_sysbios_family_c64p_EventCombiner__include_state

/* Module_State */
struct ti_sysbios_family_c64p_EventCombiner_Module_State {
    __TA_ti_sysbios_family_c64p_EventCombiner_Module_State__dispatchTab dispatchTab;
};

/* Module__state__V */
#ifndef ti_sysbios_family_c64p_EventCombiner_Module__state__VR
extern struct ti_sysbios_family_c64p_EventCombiner_Module_State__ ti_sysbios_family_c64p_EventCombiner_Module__state__V;
#else
#define ti_sysbios_family_c64p_EventCombiner_Module__state__V (*((struct ti_sysbios_family_c64p_EventCombiner_Module_State__*)(xdcRomStatePtr + ti_sysbios_family_c64p_EventCombiner_Module__state__V_offset)))
#endif

#endif /* ti_sysbios_family_c64p_EventCombiner__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_c64p_EventCombiner__nolocalnames)

#ifndef ti_sysbios_family_c64p_EventCombiner__localnames__done
#define ti_sysbios_family_c64p_EventCombiner__localnames__done

/* module prefix */
#define EventCombiner_NUM_EVENTS ti_sysbios_family_c64p_EventCombiner_NUM_EVENTS
#define EventCombiner_FuncPtr ti_sysbios_family_c64p_EventCombiner_FuncPtr
#define EventCombiner_DispatchTabElem ti_sysbios_family_c64p_EventCombiner_DispatchTabElem
#define EventCombiner_Module_State ti_sysbios_family_c64p_EventCombiner_Module_State
#define EventCombiner_A_invalidEventId ti_sysbios_family_c64p_EventCombiner_A_invalidEventId
#define EventCombiner_E_unpluggedEvent ti_sysbios_family_c64p_EventCombiner_E_unpluggedEvent
#define EventCombiner_EVTMASK ti_sysbios_family_c64p_EventCombiner_EVTMASK
#define EventCombiner_disableEvent ti_sysbios_family_c64p_EventCombiner_disableEvent
#define EventCombiner_enableEvent ti_sysbios_family_c64p_EventCombiner_enableEvent
#define EventCombiner_dispatch ti_sysbios_family_c64p_EventCombiner_dispatch
#define EventCombiner_dispatchPlug ti_sysbios_family_c64p_EventCombiner_dispatchPlug
#define EventCombiner_unused ti_sysbios_family_c64p_EventCombiner_unused
#define EventCombiner_Module_name ti_sysbios_family_c64p_EventCombiner_Module_name
#define EventCombiner_Module_id ti_sysbios_family_c64p_EventCombiner_Module_id
#define EventCombiner_Module_startup ti_sysbios_family_c64p_EventCombiner_Module_startup
#define EventCombiner_Module_startupDone ti_sysbios_family_c64p_EventCombiner_Module_startupDone
#define EventCombiner_Module_hasMask ti_sysbios_family_c64p_EventCombiner_Module_hasMask
#define EventCombiner_Module_getMask ti_sysbios_family_c64p_EventCombiner_Module_getMask
#define EventCombiner_Module_setMask ti_sysbios_family_c64p_EventCombiner_Module_setMask
#define EventCombiner_Object_heap ti_sysbios_family_c64p_EventCombiner_Object_heap
#define EventCombiner_Module_heap ti_sysbios_family_c64p_EventCombiner_Module_heap

#endif /* ti_sysbios_family_c64p_EventCombiner__localnames__done */
#endif
