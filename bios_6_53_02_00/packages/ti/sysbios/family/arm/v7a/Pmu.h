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

#ifndef ti_sysbios_family_arm_v7a_Pmu__include
#define ti_sysbios_family_arm_v7a_Pmu__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_arm_v7a_Pmu__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_arm_v7a_Pmu___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/arm/v7a/package/package.defs.h>

#include <xdc/runtime/Assert.h>
#include <ti/sysbios/hal/Hwi.h>
#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* IntHandlerFuncPtr */
typedef xdc_Void (*ti_sysbios_family_arm_v7a_Pmu_IntHandlerFuncPtr)(xdc_UArg __arg1);


/*
 * ======== INTERNAL DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled (ti_sysbios_family_arm_v7a_Pmu_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded (ti_sysbios_family_arm_v7a_Pmu_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask (ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v7a_Pmu_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__gateObj ti_sysbios_family_arm_v7a_Pmu_Module__gateObj__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__gateObj__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__gateObj__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__gateObj (ti_sysbios_family_arm_v7a_Pmu_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms (ti_sysbios_family_arm_v7a_Pmu_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_arm_v7a_Pmu_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__id ti_sysbios_family_arm_v7a_Pmu_Module__id__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__id__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__id__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__id*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__id__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__id (ti_sysbios_family_arm_v7a_Pmu_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined (ti_sysbios_family_arm_v7a_Pmu_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj (ti_sysbios_family_arm_v7a_Pmu_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0 ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0 (ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1 ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1 (ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2 ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2 (ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4 ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4 (ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8 ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8__CR
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8 (ti_sysbios_family_arm_v7a_Pmu_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_arm_v7a_Pmu_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Object__count ti_sysbios_family_arm_v7a_Pmu_Object__count__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Object__count__CR
#define ti_sysbios_family_arm_v7a_Pmu_Object__count__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Object__count*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Object__count__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Object__count (ti_sysbios_family_arm_v7a_Pmu_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_arm_v7a_Pmu_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Object__heap ti_sysbios_family_arm_v7a_Pmu_Object__heap__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Object__heap__CR
#define ti_sysbios_family_arm_v7a_Pmu_Object__heap__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Object__heap__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Object__heap (ti_sysbios_family_arm_v7a_Pmu_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_arm_v7a_Pmu_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Object__sizeof ti_sysbios_family_arm_v7a_Pmu_Object__sizeof__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Object__sizeof__CR
#define ti_sysbios_family_arm_v7a_Pmu_Object__sizeof__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Object__sizeof (ti_sysbios_family_arm_v7a_Pmu_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v7a_Pmu_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_Object__table ti_sysbios_family_arm_v7a_Pmu_Object__table__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_Object__table__CR
#define ti_sysbios_family_arm_v7a_Pmu_Object__table__C (*((CT__ti_sysbios_family_arm_v7a_Pmu_Object__table*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_Object__table__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_Object__table (ti_sysbios_family_arm_v7a_Pmu_Object__table__C)
#endif

/* intNum */
typedef xdc_UInt CT__ti_sysbios_family_arm_v7a_Pmu_intNum;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_intNum ti_sysbios_family_arm_v7a_Pmu_intNum__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_intNum__CR
#define ti_sysbios_family_arm_v7a_Pmu_intNum (*((CT__ti_sysbios_family_arm_v7a_Pmu_intNum*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_intNum__C_offset)))
#else
#ifdef ti_sysbios_family_arm_v7a_Pmu_intNum__D
#define ti_sysbios_family_arm_v7a_Pmu_intNum (ti_sysbios_family_arm_v7a_Pmu_intNum__D)
#else
#define ti_sysbios_family_arm_v7a_Pmu_intNum (ti_sysbios_family_arm_v7a_Pmu_intNum__C)
#endif
#endif

/* A_badIntNum */
typedef xdc_runtime_Assert_Id CT__ti_sysbios_family_arm_v7a_Pmu_A_badIntNum;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_A_badIntNum ti_sysbios_family_arm_v7a_Pmu_A_badIntNum__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_A_badIntNum__CR
#define ti_sysbios_family_arm_v7a_Pmu_A_badIntNum (*((CT__ti_sysbios_family_arm_v7a_Pmu_A_badIntNum*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_A_badIntNum__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_A_badIntNum (ti_sysbios_family_arm_v7a_Pmu_A_badIntNum__C)
#endif

/* A_invalidCounterId */
typedef xdc_runtime_Assert_Id CT__ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId;
__extern __FAR__ const CT__ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId__C;
#ifdef ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId__CR
#define ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId (*((CT__ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId*)(xdcRomConstPtr + ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId__C_offset)))
#else
#define ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId (ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_arm_v7a_Pmu_Module_startup ti_sysbios_family_arm_v7a_Pmu_Module_startup__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_Module_startup__E, "ti_sysbios_family_arm_v7a_Pmu_Module_startup")
__extern xdc_Int ti_sysbios_family_arm_v7a_Pmu_Module_startup__E( xdc_Int state );
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_Module_startup__F, "ti_sysbios_family_arm_v7a_Pmu_Module_startup")
__extern xdc_Int ti_sysbios_family_arm_v7a_Pmu_Module_startup__F( xdc_Int state );

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_Module__startupDone__S, "ti_sysbios_family_arm_v7a_Pmu_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_arm_v7a_Pmu_Module__startupDone__S( void );

/* setInterruptFunc__E */
#define ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc__E, "ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc__E( ti_sysbios_family_arm_v7a_Pmu_IntHandlerFuncPtr interruptFunc );

/* startCounter__E */
#define ti_sysbios_family_arm_v7a_Pmu_startCounter ti_sysbios_family_arm_v7a_Pmu_startCounter__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_startCounter__E, "ti_sysbios_family_arm_v7a_Pmu_startCounter")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_startCounter__E( xdc_UInt counterId );

/* stopCounter__E */
#define ti_sysbios_family_arm_v7a_Pmu_stopCounter ti_sysbios_family_arm_v7a_Pmu_stopCounter__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_stopCounter__E, "ti_sysbios_family_arm_v7a_Pmu_stopCounter")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_stopCounter__E( xdc_UInt counterId );

/* resetCount__E */
#define ti_sysbios_family_arm_v7a_Pmu_resetCount ti_sysbios_family_arm_v7a_Pmu_resetCount__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_resetCount__E, "ti_sysbios_family_arm_v7a_Pmu_resetCount")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_resetCount__E( xdc_UInt counterId );

/* setCount__E */
#define ti_sysbios_family_arm_v7a_Pmu_setCount ti_sysbios_family_arm_v7a_Pmu_setCount__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_setCount__E, "ti_sysbios_family_arm_v7a_Pmu_setCount")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_setCount__E( xdc_UInt counterId, xdc_UInt32 counterVal );

/* configureCounter__E */
#define ti_sysbios_family_arm_v7a_Pmu_configureCounter ti_sysbios_family_arm_v7a_Pmu_configureCounter__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_configureCounter__E, "ti_sysbios_family_arm_v7a_Pmu_configureCounter")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_configureCounter__E( xdc_UInt counterId, xdc_UInt eventNum, xdc_Bool interruptEnable );

/* enableInterrupt__E */
#define ti_sysbios_family_arm_v7a_Pmu_enableInterrupt ti_sysbios_family_arm_v7a_Pmu_enableInterrupt__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_enableInterrupt__E, "ti_sysbios_family_arm_v7a_Pmu_enableInterrupt")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_enableInterrupt__E( xdc_UInt counterId );

/* disableInterrupt__E */
#define ti_sysbios_family_arm_v7a_Pmu_disableInterrupt ti_sysbios_family_arm_v7a_Pmu_disableInterrupt__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_disableInterrupt__E, "ti_sysbios_family_arm_v7a_Pmu_disableInterrupt")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_disableInterrupt__E( xdc_UInt counterId );

/* clearOverflowStatus__E */
#define ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus__E, "ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus__E( xdc_UInt counterId );

/* getCount__E */
#define ti_sysbios_family_arm_v7a_Pmu_getCount ti_sysbios_family_arm_v7a_Pmu_getCount__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_getCount__E, "ti_sysbios_family_arm_v7a_Pmu_getCount")
__extern xdc_UInt32 ti_sysbios_family_arm_v7a_Pmu_getCount__E( xdc_UInt counterId );

/* getNumCounters__E */
#define ti_sysbios_family_arm_v7a_Pmu_getNumCounters ti_sysbios_family_arm_v7a_Pmu_getNumCounters__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_getNumCounters__E, "ti_sysbios_family_arm_v7a_Pmu_getNumCounters")
__extern xdc_UInt ti_sysbios_family_arm_v7a_Pmu_getNumCounters__E( void );

/* getOverflowStatus__E */
#define ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus__E, "ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus")
__extern xdc_Bool ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus__E( xdc_UInt counterId );

/* getEnabled__E */
#define ti_sysbios_family_arm_v7a_Pmu_getEnabled ti_sysbios_family_arm_v7a_Pmu_getEnabled__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_getEnabled__E, "ti_sysbios_family_arm_v7a_Pmu_getEnabled")
__extern xdc_UInt32 ti_sysbios_family_arm_v7a_Pmu_getEnabled__E( void );

/* startCounterI__E */
#define ti_sysbios_family_arm_v7a_Pmu_startCounterI ti_sysbios_family_arm_v7a_Pmu_startCounterI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_startCounterI__E, "ti_sysbios_family_arm_v7a_Pmu_startCounterI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_startCounterI__E( xdc_UInt counterId );

/* stopCounterI__E */
#define ti_sysbios_family_arm_v7a_Pmu_stopCounterI ti_sysbios_family_arm_v7a_Pmu_stopCounterI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_stopCounterI__E, "ti_sysbios_family_arm_v7a_Pmu_stopCounterI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_stopCounterI__E( xdc_UInt counterId );

/* resetCountI__E */
#define ti_sysbios_family_arm_v7a_Pmu_resetCountI ti_sysbios_family_arm_v7a_Pmu_resetCountI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_resetCountI__E, "ti_sysbios_family_arm_v7a_Pmu_resetCountI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_resetCountI__E( xdc_UInt counterId );

/* setCountI__E */
#define ti_sysbios_family_arm_v7a_Pmu_setCountI ti_sysbios_family_arm_v7a_Pmu_setCountI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_setCountI__E, "ti_sysbios_family_arm_v7a_Pmu_setCountI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_setCountI__E( xdc_UInt counterId, xdc_UInt32 counterVal );

/* enableInterruptI__E */
#define ti_sysbios_family_arm_v7a_Pmu_enableInterruptI ti_sysbios_family_arm_v7a_Pmu_enableInterruptI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_enableInterruptI__E, "ti_sysbios_family_arm_v7a_Pmu_enableInterruptI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_enableInterruptI__E( xdc_UInt counterId );

/* disableInterruptI__E */
#define ti_sysbios_family_arm_v7a_Pmu_disableInterruptI ti_sysbios_family_arm_v7a_Pmu_disableInterruptI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_disableInterruptI__E, "ti_sysbios_family_arm_v7a_Pmu_disableInterruptI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_disableInterruptI__E( xdc_UInt counterId );

/* clearOverflowStatusI__E */
#define ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI__E, "ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI__E( xdc_UInt counterId );

/* getCountI__E */
#define ti_sysbios_family_arm_v7a_Pmu_getCountI ti_sysbios_family_arm_v7a_Pmu_getCountI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_getCountI__E, "ti_sysbios_family_arm_v7a_Pmu_getCountI")
__extern xdc_UInt32 ti_sysbios_family_arm_v7a_Pmu_getCountI__E( xdc_UInt counterId );

/* getOverflowStatusI__E */
#define ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI__E
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI__E, "ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI")
__extern xdc_UInt32 ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI__E( xdc_UInt counterId );

/* configureCounterI__I */
#define ti_sysbios_family_arm_v7a_Pmu_configureCounterI ti_sysbios_family_arm_v7a_Pmu_configureCounterI__I
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_configureCounterI__I, "ti_sysbios_family_arm_v7a_Pmu_configureCounterI")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_configureCounterI__I( xdc_UInt counterId, xdc_UInt eventNum );

/* clearOverflowStatusReg__I */
#define ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusReg ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusReg__I
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusReg__I, "ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusReg")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusReg__I( xdc_UInt32 clearMask );

/* getOverflowStatusReg__I */
#define ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusReg ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusReg__I
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusReg__I, "ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusReg")
__extern xdc_UInt32 ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusReg__I( void );

/* initCounters__I */
#define ti_sysbios_family_arm_v7a_Pmu_initCounters ti_sysbios_family_arm_v7a_Pmu_initCounters__I
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_initCounters__I, "ti_sysbios_family_arm_v7a_Pmu_initCounters")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_initCounters__I( xdc_UInt32 counterMask );

/* interruptHandler__I */
#define ti_sysbios_family_arm_v7a_Pmu_interruptHandler ti_sysbios_family_arm_v7a_Pmu_interruptHandler__I
xdc__CODESECT(ti_sysbios_family_arm_v7a_Pmu_interruptHandler__I, "ti_sysbios_family_arm_v7a_Pmu_interruptHandler")
__extern xdc_Void ti_sysbios_family_arm_v7a_Pmu_interruptHandler__I( xdc_UArg arg );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_arm_v7a_Pmu_Module_startupDone() ti_sysbios_family_arm_v7a_Pmu_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_arm_v7a_Pmu_Object_heap() ti_sysbios_family_arm_v7a_Pmu_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_arm_v7a_Pmu_Module_heap() ti_sysbios_family_arm_v7a_Pmu_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_arm_v7a_Pmu_Module__id ti_sysbios_family_arm_v7a_Pmu_Module_id(void);
static inline CT__ti_sysbios_family_arm_v7a_Pmu_Module__id ti_sysbios_family_arm_v7a_Pmu_Module_id( void ) 
{
    return ti_sysbios_family_arm_v7a_Pmu_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_arm_v7a_Pmu_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_arm_v7a_Pmu_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_arm_v7a_Pmu_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_arm_v7a_Pmu_Module_getMask( void ) 
{
    return ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C != NULL ? *ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_arm_v7a_Pmu_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_arm_v7a_Pmu_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_arm_v7a_Pmu_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_arm_v7a_Pmu__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_arm_v7a_Pmu__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_arm_v7a_Pmu__internalaccess))

#ifndef ti_sysbios_family_arm_v7a_Pmu__include_state
#define ti_sysbios_family_arm_v7a_Pmu__include_state

/* Module_State */
struct ti_sysbios_family_arm_v7a_Pmu_Module_State {
    xdc_UInt numCounters;
    ti_sysbios_hal_Hwi_Handle hwiHandle;
    ti_sysbios_family_arm_v7a_Pmu_IntHandlerFuncPtr interruptFunc;
};

/* Module__state__V */
#ifndef ti_sysbios_family_arm_v7a_Pmu_Module__state__VR
extern struct ti_sysbios_family_arm_v7a_Pmu_Module_State__ ti_sysbios_family_arm_v7a_Pmu_Module__state__V;
#else
#define ti_sysbios_family_arm_v7a_Pmu_Module__state__V (*((struct ti_sysbios_family_arm_v7a_Pmu_Module_State__*)(xdcRomStatePtr + ti_sysbios_family_arm_v7a_Pmu_Module__state__V_offset)))
#endif

#endif /* ti_sysbios_family_arm_v7a_Pmu__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_arm_v7a_Pmu__nolocalnames)

#ifndef ti_sysbios_family_arm_v7a_Pmu__localnames__done
#define ti_sysbios_family_arm_v7a_Pmu__localnames__done

/* module prefix */
#define Pmu_IntHandlerFuncPtr ti_sysbios_family_arm_v7a_Pmu_IntHandlerFuncPtr
#define Pmu_Module_State ti_sysbios_family_arm_v7a_Pmu_Module_State
#define Pmu_intNum ti_sysbios_family_arm_v7a_Pmu_intNum
#define Pmu_A_badIntNum ti_sysbios_family_arm_v7a_Pmu_A_badIntNum
#define Pmu_A_invalidCounterId ti_sysbios_family_arm_v7a_Pmu_A_invalidCounterId
#define Pmu_setInterruptFunc ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc
#define Pmu_startCounter ti_sysbios_family_arm_v7a_Pmu_startCounter
#define Pmu_stopCounter ti_sysbios_family_arm_v7a_Pmu_stopCounter
#define Pmu_resetCount ti_sysbios_family_arm_v7a_Pmu_resetCount
#define Pmu_setCount ti_sysbios_family_arm_v7a_Pmu_setCount
#define Pmu_configureCounter ti_sysbios_family_arm_v7a_Pmu_configureCounter
#define Pmu_enableInterrupt ti_sysbios_family_arm_v7a_Pmu_enableInterrupt
#define Pmu_disableInterrupt ti_sysbios_family_arm_v7a_Pmu_disableInterrupt
#define Pmu_clearOverflowStatus ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus
#define Pmu_getCount ti_sysbios_family_arm_v7a_Pmu_getCount
#define Pmu_getNumCounters ti_sysbios_family_arm_v7a_Pmu_getNumCounters
#define Pmu_getOverflowStatus ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus
#define Pmu_getEnabled ti_sysbios_family_arm_v7a_Pmu_getEnabled
#define Pmu_startCounterI ti_sysbios_family_arm_v7a_Pmu_startCounterI
#define Pmu_stopCounterI ti_sysbios_family_arm_v7a_Pmu_stopCounterI
#define Pmu_resetCountI ti_sysbios_family_arm_v7a_Pmu_resetCountI
#define Pmu_setCountI ti_sysbios_family_arm_v7a_Pmu_setCountI
#define Pmu_enableInterruptI ti_sysbios_family_arm_v7a_Pmu_enableInterruptI
#define Pmu_disableInterruptI ti_sysbios_family_arm_v7a_Pmu_disableInterruptI
#define Pmu_clearOverflowStatusI ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI
#define Pmu_getCountI ti_sysbios_family_arm_v7a_Pmu_getCountI
#define Pmu_getOverflowStatusI ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI
#define Pmu_Module_name ti_sysbios_family_arm_v7a_Pmu_Module_name
#define Pmu_Module_id ti_sysbios_family_arm_v7a_Pmu_Module_id
#define Pmu_Module_startup ti_sysbios_family_arm_v7a_Pmu_Module_startup
#define Pmu_Module_startupDone ti_sysbios_family_arm_v7a_Pmu_Module_startupDone
#define Pmu_Module_hasMask ti_sysbios_family_arm_v7a_Pmu_Module_hasMask
#define Pmu_Module_getMask ti_sysbios_family_arm_v7a_Pmu_Module_getMask
#define Pmu_Module_setMask ti_sysbios_family_arm_v7a_Pmu_Module_setMask
#define Pmu_Object_heap ti_sysbios_family_arm_v7a_Pmu_Object_heap
#define Pmu_Module_heap ti_sysbios_family_arm_v7a_Pmu_Module_heap

#endif /* ti_sysbios_family_arm_v7a_Pmu__localnames__done */
#endif
