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
 *     VIRTUAL FUNCTIONS
 *     FUNCTION DECLARATIONS
 *     CONVERTORS
 *     SYSTEM FUNCTIONS
 *
 *     EPILOGUE
 *     STATE STRUCTURES
 *     PREFIX ALIASES
 */


/*
 * ======== PROLOGUE ========
 */

#ifndef ti_sysbios_family_arm_a15_smp_Core__include
#define ti_sysbios_family_arm_a15_smp_Core__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_arm_a15_smp_Core__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_arm_a15_smp_Core___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/arm/a15/smp/Core__prologue.h>
#include <ti/sysbios/family/arm/a15/smp/package/package.defs.h>

#include <xdc/runtime/Error.h>
#include <ti/sysbios/family/arm/v7a/smp/GateSmp.h>
#include <ti/sysbios/interfaces/ICore.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* IpcFuncPtr */
typedef xdc_Void (*ti_sysbios_family_arm_a15_smp_Core_IpcFuncPtr)(xdc_UArg __arg1);


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* IpcMsg */
struct ti_sysbios_family_arm_a15_smp_Core_IpcMsg {
    ti_sysbios_family_arm_a15_smp_Core_IpcFuncPtr func;
    xdc_UArg arg;
};

/* Module_State */
typedef xdc_Bool __T1_ti_sysbios_family_arm_a15_smp_Core_Module_State__gateEntered;
typedef xdc_Bool *__ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__gateEntered;
typedef const xdc_Bool *__CARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__gateEntered;
typedef __ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__gateEntered __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__gateEntered;
typedef xdc_UInt __T1_ti_sysbios_family_arm_a15_smp_Core_Module_State__schedulerInts;
typedef xdc_UInt *__ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__schedulerInts;
typedef const xdc_UInt *__CARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__schedulerInts;
typedef __ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__schedulerInts __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__schedulerInts;
typedef volatile xdc_Bool __T1_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores;
typedef volatile xdc_Bool *__ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores;
typedef const volatile xdc_Bool *__CARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores;
typedef __ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores __T2_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores;
typedef volatile xdc_Bool **__ARRAY2_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores;
typedef const volatile xdc_Bool **__CARRAY2_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores;
typedef __ARRAY2_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores;
typedef volatile ti_sysbios_family_arm_a15_smp_Core_IpcMsg __T1_ti_sysbios_family_arm_a15_smp_Core_Module_State__ipcMsg;
typedef volatile ti_sysbios_family_arm_a15_smp_Core_IpcMsg *__ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__ipcMsg;
typedef const volatile ti_sysbios_family_arm_a15_smp_Core_IpcMsg *__CARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__ipcMsg;
typedef __ARRAY1_ti_sysbios_family_arm_a15_smp_Core_Module_State__ipcMsg __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__ipcMsg;


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled (ti_sysbios_family_arm_a15_smp_Core_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded (ti_sysbios_family_arm_a15_smp_Core_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask (ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_a15_smp_Core_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__gateObj ti_sysbios_family_arm_a15_smp_Core_Module__gateObj__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__gateObj__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__gateObj__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__gateObj (ti_sysbios_family_arm_a15_smp_Core_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms (ti_sysbios_family_arm_a15_smp_Core_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_arm_a15_smp_Core_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__id ti_sysbios_family_arm_a15_smp_Core_Module__id__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__id__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__id__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__id*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__id__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__id (ti_sysbios_family_arm_a15_smp_Core_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined (ti_sysbios_family_arm_a15_smp_Core_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj (ti_sysbios_family_arm_a15_smp_Core_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0 ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0 (ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1 ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1 (ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2 ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2 (ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4 ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4 (ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8 ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8__CR
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8 (ti_sysbios_family_arm_a15_smp_Core_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_arm_a15_smp_Core_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Object__count ti_sysbios_family_arm_a15_smp_Core_Object__count__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Object__count__CR
#define ti_sysbios_family_arm_a15_smp_Core_Object__count__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Object__count*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Object__count__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Object__count (ti_sysbios_family_arm_a15_smp_Core_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_arm_a15_smp_Core_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Object__heap ti_sysbios_family_arm_a15_smp_Core_Object__heap__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Object__heap__CR
#define ti_sysbios_family_arm_a15_smp_Core_Object__heap__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Object__heap__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Object__heap (ti_sysbios_family_arm_a15_smp_Core_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_arm_a15_smp_Core_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Object__sizeof ti_sysbios_family_arm_a15_smp_Core_Object__sizeof__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Object__sizeof__CR
#define ti_sysbios_family_arm_a15_smp_Core_Object__sizeof__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Object__sizeof (ti_sysbios_family_arm_a15_smp_Core_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_arm_a15_smp_Core_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_Object__table ti_sysbios_family_arm_a15_smp_Core_Object__table__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_Object__table__CR
#define ti_sysbios_family_arm_a15_smp_Core_Object__table__C (*((CT__ti_sysbios_family_arm_a15_smp_Core_Object__table*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Object__table__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_Object__table (ti_sysbios_family_arm_a15_smp_Core_Object__table__C)
#endif

/* numCores */
typedef xdc_UInt CT__ti_sysbios_family_arm_a15_smp_Core_numCores;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_numCores ti_sysbios_family_arm_a15_smp_Core_numCores__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_numCores__CR
#define ti_sysbios_family_arm_a15_smp_Core_numCores (*((CT__ti_sysbios_family_arm_a15_smp_Core_numCores*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_numCores__C_offset)))
#else
#ifdef ti_sysbios_family_arm_a15_smp_Core_numCores__D
#define ti_sysbios_family_arm_a15_smp_Core_numCores (ti_sysbios_family_arm_a15_smp_Core_numCores__D)
#else
#define ti_sysbios_family_arm_a15_smp_Core_numCores (ti_sysbios_family_arm_a15_smp_Core_numCores__C)
#endif
#endif

/* CPUMASK */
typedef xdc_UInt CT__ti_sysbios_family_arm_a15_smp_Core_CPUMASK;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_CPUMASK ti_sysbios_family_arm_a15_smp_Core_CPUMASK__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_CPUMASK__CR
#define ti_sysbios_family_arm_a15_smp_Core_CPUMASK (*((CT__ti_sysbios_family_arm_a15_smp_Core_CPUMASK*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_CPUMASK__C_offset)))
#else
#ifdef ti_sysbios_family_arm_a15_smp_Core_CPUMASK__D
#define ti_sysbios_family_arm_a15_smp_Core_CPUMASK (ti_sysbios_family_arm_a15_smp_Core_CPUMASK__D)
#else
#define ti_sysbios_family_arm_a15_smp_Core_CPUMASK (ti_sysbios_family_arm_a15_smp_Core_CPUMASK__C)
#endif
#endif

/* initBootRegs */
typedef xdc_Bool CT__ti_sysbios_family_arm_a15_smp_Core_initBootRegs;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_initBootRegs ti_sysbios_family_arm_a15_smp_Core_initBootRegs__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_initBootRegs__CR
#define ti_sysbios_family_arm_a15_smp_Core_initBootRegs (*((CT__ti_sysbios_family_arm_a15_smp_Core_initBootRegs*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_initBootRegs__C_offset)))
#else
#ifdef ti_sysbios_family_arm_a15_smp_Core_initBootRegs__D
#define ti_sysbios_family_arm_a15_smp_Core_initBootRegs (ti_sysbios_family_arm_a15_smp_Core_initBootRegs__D)
#else
#define ti_sysbios_family_arm_a15_smp_Core_initBootRegs (ti_sysbios_family_arm_a15_smp_Core_initBootRegs__C)
#endif
#endif

/* useSkernelCmd */
typedef xdc_Bool CT__ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd__CR
#define ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd (*((CT__ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd__C_offset)))
#else
#ifdef ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd__D
#define ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd (ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd__D)
#else
#define ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd (ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd__C)
#endif
#endif

/* resetSection */
typedef xdc_String CT__ti_sysbios_family_arm_a15_smp_Core_resetSection;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_resetSection ti_sysbios_family_arm_a15_smp_Core_resetSection__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_resetSection__CR
#define ti_sysbios_family_arm_a15_smp_Core_resetSection (*((CT__ti_sysbios_family_arm_a15_smp_Core_resetSection*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_resetSection__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_resetSection (ti_sysbios_family_arm_a15_smp_Core_resetSection__C)
#endif

/* gate */
typedef ti_sysbios_family_arm_v7a_smp_GateSmp_Handle CT__ti_sysbios_family_arm_a15_smp_Core_gate;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_gate ti_sysbios_family_arm_a15_smp_Core_gate__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_gate__CR
#define ti_sysbios_family_arm_a15_smp_Core_gate (*((CT__ti_sysbios_family_arm_a15_smp_Core_gate*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_gate__C_offset)))
#else
#define ti_sysbios_family_arm_a15_smp_Core_gate (ti_sysbios_family_arm_a15_smp_Core_gate__C)
#endif

/* bootMagicBase */
typedef xdc_UInt32 CT__ti_sysbios_family_arm_a15_smp_Core_bootMagicBase;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_bootMagicBase ti_sysbios_family_arm_a15_smp_Core_bootMagicBase__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_bootMagicBase__CR
#define ti_sysbios_family_arm_a15_smp_Core_bootMagicBase (*((CT__ti_sysbios_family_arm_a15_smp_Core_bootMagicBase*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_bootMagicBase__C_offset)))
#else
#ifdef ti_sysbios_family_arm_a15_smp_Core_bootMagicBase__D
#define ti_sysbios_family_arm_a15_smp_Core_bootMagicBase (ti_sysbios_family_arm_a15_smp_Core_bootMagicBase__D)
#else
#define ti_sysbios_family_arm_a15_smp_Core_bootMagicBase (ti_sysbios_family_arm_a15_smp_Core_bootMagicBase__C)
#endif
#endif

/* initStackFlag */
typedef xdc_Bool CT__ti_sysbios_family_arm_a15_smp_Core_initStackFlag;
__extern __FAR__ const CT__ti_sysbios_family_arm_a15_smp_Core_initStackFlag ti_sysbios_family_arm_a15_smp_Core_initStackFlag__C;
#ifdef ti_sysbios_family_arm_a15_smp_Core_initStackFlag__CR
#define ti_sysbios_family_arm_a15_smp_Core_initStackFlag (*((CT__ti_sysbios_family_arm_a15_smp_Core_initStackFlag*)(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_initStackFlag__C_offset)))
#else
#ifdef ti_sysbios_family_arm_a15_smp_Core_initStackFlag__D
#define ti_sysbios_family_arm_a15_smp_Core_initStackFlag (ti_sysbios_family_arm_a15_smp_Core_initStackFlag__D)
#else
#define ti_sysbios_family_arm_a15_smp_Core_initStackFlag (ti_sysbios_family_arm_a15_smp_Core_initStackFlag__C)
#endif
#endif


/*
 * ======== VIRTUAL FUNCTIONS ========
 */

/* Fxns__ */
struct ti_sysbios_family_arm_a15_smp_Core_Fxns__ {
    const xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2* __sysp;
    xdc_UInt (*getId)(void);
    xdc_Void (*interruptCore)(xdc_UInt coreId);
    xdc_IArg (*lock)(void);
    xdc_Void (*unlock)(void);
    xdc_UInt (*hwiDisable)(void);
    xdc_UInt (*hwiEnable)(void);
    xdc_Void (*hwiRestore)(xdc_UInt key);
    xdc_runtime_Types_SysFxns2 __sfxns;
};
#ifndef ti_sysbios_family_arm_a15_smp_Core_Module__FXNS__CR

/* Module__FXNS__C */
__extern const ti_sysbios_family_arm_a15_smp_Core_Fxns__ ti_sysbios_family_arm_a15_smp_Core_Module__FXNS__C;
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__FXNS__C (*(xdcRomConstPtr + ti_sysbios_family_arm_a15_smp_Core_Module__FXNS__C_offset))
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_arm_a15_smp_Core_Module_startup ti_sysbios_family_arm_a15_smp_Core_Module_startup__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_Module_startup__E, "ti_sysbios_family_arm_a15_smp_Core_Module_startup")
__extern xdc_Int ti_sysbios_family_arm_a15_smp_Core_Module_startup__E( xdc_Int state );
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_Module_startup__F, "ti_sysbios_family_arm_a15_smp_Core_Module_startup")
__extern xdc_Int ti_sysbios_family_arm_a15_smp_Core_Module_startup__F( xdc_Int state );

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_Module__startupDone__S, "ti_sysbios_family_arm_a15_smp_Core_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_arm_a15_smp_Core_Module__startupDone__S( void );

/* getId__E */
#define ti_sysbios_family_arm_a15_smp_Core_getId ti_sysbios_family_arm_a15_smp_Core_getId__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_getId__E, "ti_sysbios_family_arm_a15_smp_Core_getId")
__extern xdc_UInt ti_sysbios_family_arm_a15_smp_Core_getId__E( void );

/* interruptCore__E */
#define ti_sysbios_family_arm_a15_smp_Core_interruptCore ti_sysbios_family_arm_a15_smp_Core_interruptCore__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_interruptCore__E, "ti_sysbios_family_arm_a15_smp_Core_interruptCore")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_interruptCore__E( xdc_UInt coreId );

/* lock__E */
#define ti_sysbios_family_arm_a15_smp_Core_lock ti_sysbios_family_arm_a15_smp_Core_lock__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_lock__E, "ti_sysbios_family_arm_a15_smp_Core_lock")
__extern xdc_IArg ti_sysbios_family_arm_a15_smp_Core_lock__E( void );

/* unlock__E */
#define ti_sysbios_family_arm_a15_smp_Core_unlock ti_sysbios_family_arm_a15_smp_Core_unlock__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_unlock__E, "ti_sysbios_family_arm_a15_smp_Core_unlock")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_unlock__E( void );

/* getRevisionNumber__E */
#define ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber__E, "ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber")
__extern xdc_UInt8 ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber__E( void );

/* notifySpinLock__E */
#define ti_sysbios_family_arm_a15_smp_Core_notifySpinLock ti_sysbios_family_arm_a15_smp_Core_notifySpinLock__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_notifySpinLock__E, "ti_sysbios_family_arm_a15_smp_Core_notifySpinLock")
__extern xdc_UInt ti_sysbios_family_arm_a15_smp_Core_notifySpinLock__E( void );

/* notifySpinUnlock__E */
#define ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock__E, "ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock__E( xdc_UInt key );

/* notify__E */
#define ti_sysbios_family_arm_a15_smp_Core_notify ti_sysbios_family_arm_a15_smp_Core_notify__E
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_notify__E, "ti_sysbios_family_arm_a15_smp_Core_notify")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_notify__E( ti_sysbios_family_arm_a15_smp_Core_IpcFuncPtr func, xdc_UArg arg, xdc_UInt cpuMask );

/* enableActlrSmp__I */
#define ti_sysbios_family_arm_a15_smp_Core_enableActlrSmp ti_sysbios_family_arm_a15_smp_Core_enableActlrSmp__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_enableActlrSmp__I, "ti_sysbios_family_arm_a15_smp_Core_enableActlrSmp")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_enableActlrSmp__I( void );

/* resetOMAP5xxx__I */
#define ti_sysbios_family_arm_a15_smp_Core_resetOMAP5xxx ti_sysbios_family_arm_a15_smp_Core_resetOMAP5xxx__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_resetOMAP5xxx__I, "ti_sysbios_family_arm_a15_smp_Core_resetOMAP5xxx")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_resetOMAP5xxx__I( void );

/* resetKeystone2__I */
#define ti_sysbios_family_arm_a15_smp_Core_resetKeystone2 ti_sysbios_family_arm_a15_smp_Core_resetKeystone2__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_resetKeystone2__I, "ti_sysbios_family_arm_a15_smp_Core_resetKeystone2")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_resetKeystone2__I( void );

/* startCoreXOMAP5xxx__I */
#define ti_sysbios_family_arm_a15_smp_Core_startCoreXOMAP5xxx ti_sysbios_family_arm_a15_smp_Core_startCoreXOMAP5xxx__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_startCoreXOMAP5xxx__I, "ti_sysbios_family_arm_a15_smp_Core_startCoreXOMAP5xxx")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_startCoreXOMAP5xxx__I( void );

/* startCoreXKeystone2__I */
#define ti_sysbios_family_arm_a15_smp_Core_startCoreXKeystone2 ti_sysbios_family_arm_a15_smp_Core_startCoreXKeystone2__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_startCoreXKeystone2__I, "ti_sysbios_family_arm_a15_smp_Core_startCoreXKeystone2")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_startCoreXKeystone2__I( void );

/* exit__I */
#define ti_sysbios_family_arm_a15_smp_Core_exit ti_sysbios_family_arm_a15_smp_Core_exit__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_exit__I, "ti_sysbios_family_arm_a15_smp_Core_exit")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_exit__I( xdc_UArg arg );

/* hwiFunc__I */
#define ti_sysbios_family_arm_a15_smp_Core_hwiFunc ti_sysbios_family_arm_a15_smp_Core_hwiFunc__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_hwiFunc__I, "ti_sysbios_family_arm_a15_smp_Core_hwiFunc")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_hwiFunc__I( xdc_UArg arg );

/* skernelCmd__I */
#define ti_sysbios_family_arm_a15_smp_Core_skernelCmd ti_sysbios_family_arm_a15_smp_Core_skernelCmd__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_skernelCmd__I, "ti_sysbios_family_arm_a15_smp_Core_skernelCmd")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_skernelCmd__I( xdc_UInt32 cmd, xdc_UInt32 coreId, xdc_UInt32 startAddr );

/* smpBoot__I */
#define ti_sysbios_family_arm_a15_smp_Core_smpBoot ti_sysbios_family_arm_a15_smp_Core_smpBoot__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_smpBoot__I, "ti_sysbios_family_arm_a15_smp_Core_smpBoot")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_smpBoot__I( void );

/* startup__I */
#define ti_sysbios_family_arm_a15_smp_Core_startup ti_sysbios_family_arm_a15_smp_Core_startup__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_startup__I, "ti_sysbios_family_arm_a15_smp_Core_startup")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_startup__I( void );

/* atexit__I */
#define ti_sysbios_family_arm_a15_smp_Core_atexit ti_sysbios_family_arm_a15_smp_Core_atexit__I
xdc__CODESECT(ti_sysbios_family_arm_a15_smp_Core_atexit__I, "ti_sysbios_family_arm_a15_smp_Core_atexit")
__extern xdc_Void ti_sysbios_family_arm_a15_smp_Core_atexit__I( xdc_Int arg );


/*
 * ======== CONVERTORS ========
 */

/* Module_upCast */
static inline ti_sysbios_interfaces_ICore_Module ti_sysbios_family_arm_a15_smp_Core_Module_upCast(void);
static inline ti_sysbios_interfaces_ICore_Module ti_sysbios_family_arm_a15_smp_Core_Module_upCast(void)
{
    return (ti_sysbios_interfaces_ICore_Module)&ti_sysbios_family_arm_a15_smp_Core_Module__FXNS__C;
}

/* Module_to_ti_sysbios_interfaces_ICore */
#define ti_sysbios_family_arm_a15_smp_Core_Module_to_ti_sysbios_interfaces_ICore ti_sysbios_family_arm_a15_smp_Core_Module_upCast


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_arm_a15_smp_Core_Module_startupDone() ti_sysbios_family_arm_a15_smp_Core_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_arm_a15_smp_Core_Object_heap() ti_sysbios_family_arm_a15_smp_Core_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_arm_a15_smp_Core_Module_heap() ti_sysbios_family_arm_a15_smp_Core_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_arm_a15_smp_Core_Module__id ti_sysbios_family_arm_a15_smp_Core_Module_id(void);
static inline CT__ti_sysbios_family_arm_a15_smp_Core_Module__id ti_sysbios_family_arm_a15_smp_Core_Module_id( void ) 
{
    return ti_sysbios_family_arm_a15_smp_Core_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_arm_a15_smp_Core_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_arm_a15_smp_Core_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_arm_a15_smp_Core_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_arm_a15_smp_Core_Module_getMask( void ) 
{
    return ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C != NULL ? *ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_arm_a15_smp_Core_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_arm_a15_smp_Core_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_arm_a15_smp_Core_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#include <ti/sysbios/family/arm/a15/smp/Core__epilogue.h>

#ifdef ti_sysbios_family_arm_a15_smp_Core__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_arm_a15_smp_Core__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_arm_a15_smp_Core__internalaccess))

#ifndef ti_sysbios_family_arm_a15_smp_Core__include_state
#define ti_sysbios_family_arm_a15_smp_Core__include_state

/* Module_State */
struct ti_sysbios_family_arm_a15_smp_Core_Module_State {
    __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__gateEntered gateEntered;
    __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__schedulerInts schedulerInts;
    __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__syncCores syncCores;
    __TA_ti_sysbios_family_arm_a15_smp_Core_Module_State__ipcMsg ipcMsg;
    volatile xdc_Bool notifyLock;
};

/* Module__state__V */
#ifndef ti_sysbios_family_arm_a15_smp_Core_Module__state__VR
extern struct ti_sysbios_family_arm_a15_smp_Core_Module_State__ ti_sysbios_family_arm_a15_smp_Core_Module__state__V;
#else
#define ti_sysbios_family_arm_a15_smp_Core_Module__state__V (*((struct ti_sysbios_family_arm_a15_smp_Core_Module_State__*)(xdcRomStatePtr + ti_sysbios_family_arm_a15_smp_Core_Module__state__V_offset)))
#endif

#endif /* ti_sysbios_family_arm_a15_smp_Core__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_arm_a15_smp_Core__nolocalnames)

#ifndef ti_sysbios_family_arm_a15_smp_Core__localnames__done
#define ti_sysbios_family_arm_a15_smp_Core__localnames__done

/* module prefix */
#define Core_IpcFuncPtr ti_sysbios_family_arm_a15_smp_Core_IpcFuncPtr
#define Core_IpcMsg ti_sysbios_family_arm_a15_smp_Core_IpcMsg
#define Core_Module_State ti_sysbios_family_arm_a15_smp_Core_Module_State
#define Core_numCores ti_sysbios_family_arm_a15_smp_Core_numCores
#define Core_CPUMASK ti_sysbios_family_arm_a15_smp_Core_CPUMASK
#define Core_initBootRegs ti_sysbios_family_arm_a15_smp_Core_initBootRegs
#define Core_useSkernelCmd ti_sysbios_family_arm_a15_smp_Core_useSkernelCmd
#define Core_resetSection ti_sysbios_family_arm_a15_smp_Core_resetSection
#define Core_gate ti_sysbios_family_arm_a15_smp_Core_gate
#define Core_bootMagicBase ti_sysbios_family_arm_a15_smp_Core_bootMagicBase
#define Core_initStackFlag ti_sysbios_family_arm_a15_smp_Core_initStackFlag
#define Core_getId ti_sysbios_family_arm_a15_smp_Core_getId
#define Core_interruptCore ti_sysbios_family_arm_a15_smp_Core_interruptCore
#define Core_lock ti_sysbios_family_arm_a15_smp_Core_lock
#define Core_unlock ti_sysbios_family_arm_a15_smp_Core_unlock
#define Core_hwiDisable ti_sysbios_family_arm_a15_smp_Core_hwiDisable
#define Core_hwiEnable ti_sysbios_family_arm_a15_smp_Core_hwiEnable
#define Core_hwiRestore ti_sysbios_family_arm_a15_smp_Core_hwiRestore
#define Core_getRevisionNumber ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber
#define Core_notifySpinLock ti_sysbios_family_arm_a15_smp_Core_notifySpinLock
#define Core_notifySpinUnlock ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock
#define Core_notify ti_sysbios_family_arm_a15_smp_Core_notify
#define Core_Module_name ti_sysbios_family_arm_a15_smp_Core_Module_name
#define Core_Module_id ti_sysbios_family_arm_a15_smp_Core_Module_id
#define Core_Module_startup ti_sysbios_family_arm_a15_smp_Core_Module_startup
#define Core_Module_startupDone ti_sysbios_family_arm_a15_smp_Core_Module_startupDone
#define Core_Module_hasMask ti_sysbios_family_arm_a15_smp_Core_Module_hasMask
#define Core_Module_getMask ti_sysbios_family_arm_a15_smp_Core_Module_getMask
#define Core_Module_setMask ti_sysbios_family_arm_a15_smp_Core_Module_setMask
#define Core_Object_heap ti_sysbios_family_arm_a15_smp_Core_Object_heap
#define Core_Module_heap ti_sysbios_family_arm_a15_smp_Core_Module_heap
#define Core_Module_upCast ti_sysbios_family_arm_a15_smp_Core_Module_upCast
#define Core_Module_to_ti_sysbios_interfaces_ICore ti_sysbios_family_arm_a15_smp_Core_Module_to_ti_sysbios_interfaces_ICore

#endif /* ti_sysbios_family_arm_a15_smp_Core__localnames__done */
#endif
