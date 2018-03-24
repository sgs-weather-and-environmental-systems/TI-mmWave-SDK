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

#ifndef ti_sysbios_family_c674_Power__include
#define ti_sysbios_family_c674_Power__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_c674_Power__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_c674_Power___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/c674/package/package.defs.h>

#include <ti/sysbios/knl/Queue.h>
#include <ti/sysbios/interfaces/IPower.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* Attrs */
struct ti_sysbios_family_c674_Power_Attrs {
    xdc_Bool scaleVoltage;
    xdc_Bool waitForVoltageScale;
};

/* Config */
struct ti_sysbios_family_c674_Power_Config {
    xdc_Bool scaleVoltage;
    xdc_Bool waitForVoltageScale;
};

/* SetpointInfo */
struct ti_sysbios_family_c674_Power_SetpointInfo {
    xdc_UInt frequency;
    xdc_UInt voltage;
};

/* SleepOverride */
struct ti_sysbios_family_c674_Power_SleepOverride {
    xdc_UInt sleepVoltage;
    xdc_UInt bypassedPLLs;
};

/* ConstraintHandle */
typedef xdc_UArg *ti_sysbios_family_c674_Power_ConstraintHandle;

/* NotifyHandle */
typedef xdc_Void *ti_sysbios_family_c674_Power_NotifyHandle;

/* FuncPtr */
typedef xdc_Void (*ti_sysbios_family_c674_Power_FuncPtr)(void);

/* Constraint */
enum ti_sysbios_family_c674_Power_Constraint {
    ti_sysbios_family_c674_Power_DISALLOWED_CPU_SETPOINT_MASK = 1,
    ti_sysbios_family_c674_Power_DISALLOWED_PER_SETPOINT_MASK = 2,
    ti_sysbios_family_c674_Power_DISALLOWEDSLEEPSTATE_MASK = 3
};
typedef enum ti_sysbios_family_c674_Power_Constraint ti_sysbios_family_c674_Power_Constraint;

/* Domain */
enum ti_sysbios_family_c674_Power_Domain {
    ti_sysbios_family_c674_Power_CPU = 0,
    ti_sysbios_family_c674_Power_PER
};
typedef enum ti_sysbios_family_c674_Power_Domain ti_sysbios_family_c674_Power_Domain;

/* Event */
enum ti_sysbios_family_c674_Power_Event {
    ti_sysbios_family_c674_Power_GOINGTOSTANDBY = 0,
    ti_sysbios_family_c674_Power_AWAKEFROMSTANDBY,
    ti_sysbios_family_c674_Power_GOINGTOSLEEP,
    ti_sysbios_family_c674_Power_AWAKEFROMSLEEP,
    ti_sysbios_family_c674_Power_GOINGTODEEPSLEEP,
    ti_sysbios_family_c674_Power_AWAKEFROMDEEPSLEEP,
    ti_sysbios_family_c674_Power_PENDING_CPU_SETPOINTCHANGE,
    ti_sysbios_family_c674_Power_PENDING_PER_SETPOINTCHANGE,
    ti_sysbios_family_c674_Power_DONE_CPU_SETPOINTCHANGE,
    ti_sysbios_family_c674_Power_DONE_PER_SETPOINTCHANGE,
    ti_sysbios_family_c674_Power_INVALIDEVENT
};
typedef enum ti_sysbios_family_c674_Power_Event ti_sysbios_family_c674_Power_Event;

/* NotifyResponse */
enum ti_sysbios_family_c674_Power_NotifyResponse {
    ti_sysbios_family_c674_Power_NOTIFYDONE = 0,
    ti_sysbios_family_c674_Power_NOTIFYNOTDONE,
    ti_sysbios_family_c674_Power_NOTIFYERROR
};
typedef enum ti_sysbios_family_c674_Power_NotifyResponse ti_sysbios_family_c674_Power_NotifyResponse;

/* EXTERNAL */
#define ti_sysbios_family_c674_Power_EXTERNAL (0x8)

/* RTC_ALARM */
#define ti_sysbios_family_c674_Power_RTC_ALARM (0x10)

/* PLL0 */
#define ti_sysbios_family_c674_Power_PLL0 (0x1)

/* PLL1 */
#define ti_sysbios_family_c674_Power_PLL1 (0x2)

/* CVFSCALING */
#define ti_sysbios_family_c674_Power_CVFSCALING (0x8)

/* CRESOURCETRACKING */
#define ti_sysbios_family_c674_Power_CRESOURCETRACKING (0x200)

/* Resource */
enum ti_sysbios_family_c674_Power_Resource {
    ti_sysbios_family_c674_Power_RSRC_EDMA3_CC_0 = 0,
    ti_sysbios_family_c674_Power_RSRC_EDMA3_TC_0 = 1,
    ti_sysbios_family_c674_Power_RSRC_EDMA3_TC_1 = 2,
    ti_sysbios_family_c674_Power_RSRC_EMIFA = 3,
    ti_sysbios_family_c674_Power_RSRC_SPI_0 = 4,
    ti_sysbios_family_c674_Power_RSRC_MMCSD_0 = 5,
    ti_sysbios_family_c674_Power_RSRC_AINTC = 6,
    ti_sysbios_family_c674_Power_RSRC_RSVD1 = 7,
    ti_sysbios_family_c674_Power_RSRC_UART_0 = 8,
    ti_sysbios_family_c674_Power_RSRC_RSVD2 = 9,
    ti_sysbios_family_c674_Power_RSRC_EDMA3_CC_1 = 10,
    ti_sysbios_family_c674_Power_RSRC_USB0 = 11,
    ti_sysbios_family_c674_Power_RSRC_USB1 = 12,
    ti_sysbios_family_c674_Power_RSRC_GPIO = 13,
    ti_sysbios_family_c674_Power_RSRC_UHPI = 14,
    ti_sysbios_family_c674_Power_RSRC_EMAC = 15,
    ti_sysbios_family_c674_Power_RSRC_DDR2 = 16,
    ti_sysbios_family_c674_Power_RSRC_MCASP_0 = 17,
    ti_sysbios_family_c674_Power_RSRC_SATA = 18,
    ti_sysbios_family_c674_Power_RSRC_VPIF = 19,
    ti_sysbios_family_c674_Power_RSRC_SPI_1 = 20,
    ti_sysbios_family_c674_Power_RSRC_I2C_1 = 21,
    ti_sysbios_family_c674_Power_RSRC_UART_1 = 22,
    ti_sysbios_family_c674_Power_RSRC_UART_2 = 23,
    ti_sysbios_family_c674_Power_RSRC_MCBSP_0 = 24,
    ti_sysbios_family_c674_Power_RSRC_MCBSP_1 = 25,
    ti_sysbios_family_c674_Power_RSRC_LCDC = 26,
    ti_sysbios_family_c674_Power_RSRC_EHRPWM = 27,
    ti_sysbios_family_c674_Power_RSRC_MMCSD_1 = 28,
    ti_sysbios_family_c674_Power_RSRC_UPP = 29,
    ti_sysbios_family_c674_Power_RSRC_ECAP = 30,
    ti_sysbios_family_c674_Power_RSRC_EDMA3_TC_2 = 31,
    ti_sysbios_family_c674_Power_RSRC_END = 32
};
typedef enum ti_sysbios_family_c674_Power_Resource ti_sysbios_family_c674_Power_Resource;

/* SleepCode */
enum ti_sysbios_family_c674_Power_SleepCode {
    ti_sysbios_family_c674_Power_STANDBY = 0x1,
    ti_sysbios_family_c674_Power_SLEEP = 0x2,
    ti_sysbios_family_c674_Power_DEEPSLEEP = 0x4
};
typedef enum ti_sysbios_family_c674_Power_SleepCode ti_sysbios_family_c674_Power_SleepCode;

/* Status */
enum ti_sysbios_family_c674_Power_Status {
    ti_sysbios_family_c674_Power_SOK = 0,
    ti_sysbios_family_c674_Power_EFAIL = 1,
    ti_sysbios_family_c674_Power_EINVALIDEVENT = 2,
    ti_sysbios_family_c674_Power_EINVALIDHANDLE = 3,
    ti_sysbios_family_c674_Power_EINVALIDPOINTER = 4,
    ti_sysbios_family_c674_Power_EINVALIDVALUE = 5,
    ti_sysbios_family_c674_Power_ENOTIMPLEMENTED = 6,
    ti_sysbios_family_c674_Power_ENOTSUPPORTED = 7,
    ti_sysbios_family_c674_Power_EOUTOFRANGE = 8,
    ti_sysbios_family_c674_Power_ETIMEOUT = 9,
    ti_sysbios_family_c674_Power_EBUSY = 10,
    ti_sysbios_family_c674_Power_EINITFAILURE = 11,
    ti_sysbios_family_c674_Power_ETOOMANYCALLS = 12
};
typedef enum ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_Status;

/* pmiLib */
enum ti_sysbios_family_c674_Power_pmiLib {
    ti_sysbios_family_c674_Power_pmiLib_evm6748,
    ti_sysbios_family_c674_Power_pmiLib_shared_evm6748,
    ti_sysbios_family_c674_Power_pmiLib_lcdk,
    ti_sysbios_family_c674_Power_pmiLib_null,
    ti_sysbios_family_c674_Power_pmiLib_user
};
typedef enum ti_sysbios_family_c674_Power_pmiLib ti_sysbios_family_c674_Power_pmiLib;

/* psclLib */
enum ti_sysbios_family_c674_Power_psclLib {
    ti_sysbios_family_c674_Power_psclLib_evm6748,
    ti_sysbios_family_c674_Power_psclLib_evm6748_372,
    ti_sysbios_family_c674_Power_psclLib_evm6748_408,
    ti_sysbios_family_c674_Power_psclLib_evm6748_456,
    ti_sysbios_family_c674_Power_psclLib_lcdk,
    ti_sysbios_family_c674_Power_psclLib_null,
    ti_sysbios_family_c674_Power_psclLib_user
};
typedef enum ti_sysbios_family_c674_Power_psclLib ti_sysbios_family_c674_Power_psclLib;


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* CWAITFORV */
#define ti_sysbios_family_c674_Power_CWAITFORV (0x20)

/* CSCALEVWITHF */
#define ti_sysbios_family_c674_Power_CSCALEVWITHF (0x10)

/* CMOVEINITSPS */
#define ti_sysbios_family_c674_Power_CMOVEINITSPS (0x1000)

/* RELEASE */
#define ti_sysbios_family_c674_Power_RELEASE (0)

/* SET */
#define ti_sysbios_family_c674_Power_SET (1)

/* QUERY */
#define ti_sysbios_family_c674_Power_QUERY (2)

/* SigType */
enum ti_sysbios_family_c674_Power_SigType {
    ti_sysbios_family_c674_Power_SigType_INTERNAL = 0,
    ti_sysbios_family_c674_Power_SigType_EXTERNAL
};
typedef enum ti_sysbios_family_c674_Power_SigType ti_sysbios_family_c674_Power_SigType;

/* Module_State */
typedef ti_sysbios_knl_Queue_Instance_State __T1_ti_sysbios_family_c674_Power_Module_State__notifyQ;
typedef ti_sysbios_knl_Queue_Instance_State *__ARRAY1_ti_sysbios_family_c674_Power_Module_State__notifyQ;
typedef const ti_sysbios_knl_Queue_Instance_State *__CARRAY1_ti_sysbios_family_c674_Power_Module_State__notifyQ;
typedef __ARRAY1_ti_sysbios_family_c674_Power_Module_State__notifyQ __TA_ti_sysbios_family_c674_Power_Module_State__notifyQ;


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_c674_Power_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__diagsEnabled ti_sysbios_family_c674_Power_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_c674_Power_Module__diagsEnabled__CR
#define ti_sysbios_family_c674_Power_Module__diagsEnabled__C (*((CT__ti_sysbios_family_c674_Power_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__diagsEnabled (ti_sysbios_family_c674_Power_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_c674_Power_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__diagsIncluded ti_sysbios_family_c674_Power_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_c674_Power_Module__diagsIncluded__CR
#define ti_sysbios_family_c674_Power_Module__diagsIncluded__C (*((CT__ti_sysbios_family_c674_Power_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__diagsIncluded (ti_sysbios_family_c674_Power_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_c674_Power_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__diagsMask ti_sysbios_family_c674_Power_Module__diagsMask__C;
#ifdef ti_sysbios_family_c674_Power_Module__diagsMask__CR
#define ti_sysbios_family_c674_Power_Module__diagsMask__C (*((CT__ti_sysbios_family_c674_Power_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__diagsMask (ti_sysbios_family_c674_Power_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_c674_Power_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__gateObj ti_sysbios_family_c674_Power_Module__gateObj__C;
#ifdef ti_sysbios_family_c674_Power_Module__gateObj__CR
#define ti_sysbios_family_c674_Power_Module__gateObj__C (*((CT__ti_sysbios_family_c674_Power_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__gateObj (ti_sysbios_family_c674_Power_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_c674_Power_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__gatePrms ti_sysbios_family_c674_Power_Module__gatePrms__C;
#ifdef ti_sysbios_family_c674_Power_Module__gatePrms__CR
#define ti_sysbios_family_c674_Power_Module__gatePrms__C (*((CT__ti_sysbios_family_c674_Power_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__gatePrms (ti_sysbios_family_c674_Power_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_c674_Power_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__id ti_sysbios_family_c674_Power_Module__id__C;
#ifdef ti_sysbios_family_c674_Power_Module__id__CR
#define ti_sysbios_family_c674_Power_Module__id__C (*((CT__ti_sysbios_family_c674_Power_Module__id*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__id__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__id (ti_sysbios_family_c674_Power_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_c674_Power_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__loggerDefined ti_sysbios_family_c674_Power_Module__loggerDefined__C;
#ifdef ti_sysbios_family_c674_Power_Module__loggerDefined__CR
#define ti_sysbios_family_c674_Power_Module__loggerDefined__C (*((CT__ti_sysbios_family_c674_Power_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__loggerDefined (ti_sysbios_family_c674_Power_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_c674_Power_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__loggerObj ti_sysbios_family_c674_Power_Module__loggerObj__C;
#ifdef ti_sysbios_family_c674_Power_Module__loggerObj__CR
#define ti_sysbios_family_c674_Power_Module__loggerObj__C (*((CT__ti_sysbios_family_c674_Power_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__loggerObj (ti_sysbios_family_c674_Power_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_c674_Power_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__loggerFxn0 ti_sysbios_family_c674_Power_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_c674_Power_Module__loggerFxn0__CR
#define ti_sysbios_family_c674_Power_Module__loggerFxn0__C (*((CT__ti_sysbios_family_c674_Power_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__loggerFxn0 (ti_sysbios_family_c674_Power_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_c674_Power_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__loggerFxn1 ti_sysbios_family_c674_Power_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_c674_Power_Module__loggerFxn1__CR
#define ti_sysbios_family_c674_Power_Module__loggerFxn1__C (*((CT__ti_sysbios_family_c674_Power_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__loggerFxn1 (ti_sysbios_family_c674_Power_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_c674_Power_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__loggerFxn2 ti_sysbios_family_c674_Power_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_c674_Power_Module__loggerFxn2__CR
#define ti_sysbios_family_c674_Power_Module__loggerFxn2__C (*((CT__ti_sysbios_family_c674_Power_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__loggerFxn2 (ti_sysbios_family_c674_Power_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_c674_Power_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__loggerFxn4 ti_sysbios_family_c674_Power_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_c674_Power_Module__loggerFxn4__CR
#define ti_sysbios_family_c674_Power_Module__loggerFxn4__C (*((CT__ti_sysbios_family_c674_Power_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__loggerFxn4 (ti_sysbios_family_c674_Power_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_c674_Power_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Module__loggerFxn8 ti_sysbios_family_c674_Power_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_c674_Power_Module__loggerFxn8__CR
#define ti_sysbios_family_c674_Power_Module__loggerFxn8__C (*((CT__ti_sysbios_family_c674_Power_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Module__loggerFxn8 (ti_sysbios_family_c674_Power_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_c674_Power_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Object__count ti_sysbios_family_c674_Power_Object__count__C;
#ifdef ti_sysbios_family_c674_Power_Object__count__CR
#define ti_sysbios_family_c674_Power_Object__count__C (*((CT__ti_sysbios_family_c674_Power_Object__count*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Object__count__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Object__count (ti_sysbios_family_c674_Power_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_c674_Power_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Object__heap ti_sysbios_family_c674_Power_Object__heap__C;
#ifdef ti_sysbios_family_c674_Power_Object__heap__CR
#define ti_sysbios_family_c674_Power_Object__heap__C (*((CT__ti_sysbios_family_c674_Power_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Object__heap__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Object__heap (ti_sysbios_family_c674_Power_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_c674_Power_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Object__sizeof ti_sysbios_family_c674_Power_Object__sizeof__C;
#ifdef ti_sysbios_family_c674_Power_Object__sizeof__CR
#define ti_sysbios_family_c674_Power_Object__sizeof__C (*((CT__ti_sysbios_family_c674_Power_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Object__sizeof (ti_sysbios_family_c674_Power_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_c674_Power_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_Object__table ti_sysbios_family_c674_Power_Object__table__C;
#ifdef ti_sysbios_family_c674_Power_Object__table__CR
#define ti_sysbios_family_c674_Power_Object__table__C (*((CT__ti_sysbios_family_c674_Power_Object__table*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_Object__table__C_offset)))
#else
#define ti_sysbios_family_c674_Power_Object__table (ti_sysbios_family_c674_Power_Object__table__C)
#endif

/* idle */
typedef xdc_Bool CT__ti_sysbios_family_c674_Power_idle;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_idle ti_sysbios_family_c674_Power_idle__C;
#ifdef ti_sysbios_family_c674_Power_idle__CR
#define ti_sysbios_family_c674_Power_idle (*((CT__ti_sysbios_family_c674_Power_idle*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_idle__C_offset)))
#else
#ifdef ti_sysbios_family_c674_Power_idle__D
#define ti_sysbios_family_c674_Power_idle (ti_sysbios_family_c674_Power_idle__D)
#else
#define ti_sysbios_family_c674_Power_idle (ti_sysbios_family_c674_Power_idle__C)
#endif
#endif

/* trackResources */
typedef xdc_Bool CT__ti_sysbios_family_c674_Power_trackResources;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_trackResources ti_sysbios_family_c674_Power_trackResources__C;
#ifdef ti_sysbios_family_c674_Power_trackResources__CR
#define ti_sysbios_family_c674_Power_trackResources (*((CT__ti_sysbios_family_c674_Power_trackResources*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_trackResources__C_offset)))
#else
#ifdef ti_sysbios_family_c674_Power_trackResources__D
#define ti_sysbios_family_c674_Power_trackResources (ti_sysbios_family_c674_Power_trackResources__D)
#else
#define ti_sysbios_family_c674_Power_trackResources (ti_sysbios_family_c674_Power_trackResources__C)
#endif
#endif

/* enableScaling */
typedef xdc_Bool CT__ti_sysbios_family_c674_Power_enableScaling;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_enableScaling ti_sysbios_family_c674_Power_enableScaling__C;
#ifdef ti_sysbios_family_c674_Power_enableScaling__CR
#define ti_sysbios_family_c674_Power_enableScaling (*((CT__ti_sysbios_family_c674_Power_enableScaling*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_enableScaling__C_offset)))
#else
#ifdef ti_sysbios_family_c674_Power_enableScaling__D
#define ti_sysbios_family_c674_Power_enableScaling (ti_sysbios_family_c674_Power_enableScaling__D)
#else
#define ti_sysbios_family_c674_Power_enableScaling (ti_sysbios_family_c674_Power_enableScaling__C)
#endif
#endif

/* initialSetpointCPU */
typedef xdc_UInt CT__ti_sysbios_family_c674_Power_initialSetpointCPU;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_initialSetpointCPU ti_sysbios_family_c674_Power_initialSetpointCPU__C;
#ifdef ti_sysbios_family_c674_Power_initialSetpointCPU__CR
#define ti_sysbios_family_c674_Power_initialSetpointCPU (*((CT__ti_sysbios_family_c674_Power_initialSetpointCPU*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_initialSetpointCPU__C_offset)))
#else
#ifdef ti_sysbios_family_c674_Power_initialSetpointCPU__D
#define ti_sysbios_family_c674_Power_initialSetpointCPU (ti_sysbios_family_c674_Power_initialSetpointCPU__D)
#else
#define ti_sysbios_family_c674_Power_initialSetpointCPU (ti_sysbios_family_c674_Power_initialSetpointCPU__C)
#endif
#endif

/* initialSetpointPER */
typedef xdc_UInt CT__ti_sysbios_family_c674_Power_initialSetpointPER;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_initialSetpointPER ti_sysbios_family_c674_Power_initialSetpointPER__C;
#ifdef ti_sysbios_family_c674_Power_initialSetpointPER__CR
#define ti_sysbios_family_c674_Power_initialSetpointPER (*((CT__ti_sysbios_family_c674_Power_initialSetpointPER*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_initialSetpointPER__C_offset)))
#else
#ifdef ti_sysbios_family_c674_Power_initialSetpointPER__D
#define ti_sysbios_family_c674_Power_initialSetpointPER (ti_sysbios_family_c674_Power_initialSetpointPER__D)
#else
#define ti_sysbios_family_c674_Power_initialSetpointPER (ti_sysbios_family_c674_Power_initialSetpointPER__C)
#endif
#endif

/* CAPSMASK */
typedef xdc_UInt CT__ti_sysbios_family_c674_Power_CAPSMASK;
__extern __FAR__ const CT__ti_sysbios_family_c674_Power_CAPSMASK ti_sysbios_family_c674_Power_CAPSMASK__C;
#ifdef ti_sysbios_family_c674_Power_CAPSMASK__CR
#define ti_sysbios_family_c674_Power_CAPSMASK (*((CT__ti_sysbios_family_c674_Power_CAPSMASK*)(xdcRomConstPtr + ti_sysbios_family_c674_Power_CAPSMASK__C_offset)))
#else
#ifdef ti_sysbios_family_c674_Power_CAPSMASK__D
#define ti_sysbios_family_c674_Power_CAPSMASK (ti_sysbios_family_c674_Power_CAPSMASK__D)
#else
#define ti_sysbios_family_c674_Power_CAPSMASK (ti_sysbios_family_c674_Power_CAPSMASK__C)
#endif
#endif


/*
 * ======== VIRTUAL FUNCTIONS ========
 */

/* Fxns__ */
struct ti_sysbios_family_c674_Power_Fxns__ {
    const xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2* __sysp;
    xdc_runtime_Types_SysFxns2 __sfxns;
};
#ifndef ti_sysbios_family_c674_Power_Module__FXNS__CR

/* Module__FXNS__C */
__extern const ti_sysbios_family_c674_Power_Fxns__ ti_sysbios_family_c674_Power_Module__FXNS__C;
#else
#define ti_sysbios_family_c674_Power_Module__FXNS__C (*(xdcRomConstPtr + ti_sysbios_family_c674_Power_Module__FXNS__C_offset))
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_c674_Power_Module_startup ti_sysbios_family_c674_Power_Module_startup__E
xdc__CODESECT(ti_sysbios_family_c674_Power_Module_startup__E, "ti_sysbios_family_c674_Power_Module_startup")
__extern xdc_Int ti_sysbios_family_c674_Power_Module_startup__E( xdc_Int state );
xdc__CODESECT(ti_sysbios_family_c674_Power_Module_startup__F, "ti_sysbios_family_c674_Power_Module_startup")
__extern xdc_Int ti_sysbios_family_c674_Power_Module_startup__F( xdc_Int state );

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_c674_Power_Module__startupDone__S, "ti_sysbios_family_c674_Power_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_c674_Power_Module__startupDone__S( void );

/* changeSetpoint__E */
#define ti_sysbios_family_c674_Power_changeSetpoint ti_sysbios_family_c674_Power_changeSetpoint__E
xdc__CODESECT(ti_sysbios_family_c674_Power_changeSetpoint__E, "ti_sysbios_family_c674_Power_changeSetpoint")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_changeSetpoint__E( ti_sysbios_family_c674_Power_Domain domain, xdc_UInt newSetpoint, xdc_UInt notifyTimeout );

/* configure__E */
#define ti_sysbios_family_c674_Power_configure ti_sysbios_family_c674_Power_configure__E
xdc__CODESECT(ti_sysbios_family_c674_Power_configure__E, "ti_sysbios_family_c674_Power_configure")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_configure__E( ti_sysbios_family_c674_Power_Attrs attrs );

/* getCapabilities__E */
#define ti_sysbios_family_c674_Power_getCapabilities ti_sysbios_family_c674_Power_getCapabilities__E
xdc__CODESECT(ti_sysbios_family_c674_Power_getCapabilities__E, "ti_sysbios_family_c674_Power_getCapabilities")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_getCapabilities__E( xdc_UInt *capsMask );

/* getConstraintInfo__E */
#define ti_sysbios_family_c674_Power_getConstraintInfo ti_sysbios_family_c674_Power_getConstraintInfo__E
xdc__CODESECT(ti_sysbios_family_c674_Power_getConstraintInfo__E, "ti_sysbios_family_c674_Power_getConstraintInfo")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_getConstraintInfo__E( ti_sysbios_family_c674_Power_Constraint type, xdc_UArg *value );

/* getCurrentSetpoint__E */
#define ti_sysbios_family_c674_Power_getCurrentSetpoint ti_sysbios_family_c674_Power_getCurrentSetpoint__E
xdc__CODESECT(ti_sysbios_family_c674_Power_getCurrentSetpoint__E, "ti_sysbios_family_c674_Power_getCurrentSetpoint")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_getCurrentSetpoint__E( ti_sysbios_family_c674_Power_Domain domain, xdc_UInt *setpoint );

/* getDependencyCount__E */
#define ti_sysbios_family_c674_Power_getDependencyCount ti_sysbios_family_c674_Power_getDependencyCount__E
xdc__CODESECT(ti_sysbios_family_c674_Power_getDependencyCount__E, "ti_sysbios_family_c674_Power_getDependencyCount")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_getDependencyCount__E( ti_sysbios_family_c674_Power_Resource resourceID, xdc_UInt *count );

/* getNumSetpoints__E */
#define ti_sysbios_family_c674_Power_getNumSetpoints ti_sysbios_family_c674_Power_getNumSetpoints__E
xdc__CODESECT(ti_sysbios_family_c674_Power_getNumSetpoints__E, "ti_sysbios_family_c674_Power_getNumSetpoints")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_getNumSetpoints__E( ti_sysbios_family_c674_Power_Domain domain, xdc_UInt *numberSetpoints );

/* getSetpointInfo__E */
#define ti_sysbios_family_c674_Power_getSetpointInfo ti_sysbios_family_c674_Power_getSetpointInfo__E
xdc__CODESECT(ti_sysbios_family_c674_Power_getSetpointInfo__E, "ti_sysbios_family_c674_Power_getSetpointInfo")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_getSetpointInfo__E( ti_sysbios_family_c674_Power_Domain domain, xdc_UInt setpoint, xdc_UInt *frequency, xdc_UInt *voltage );

/* getTransitionLatency__E */
#define ti_sysbios_family_c674_Power_getTransitionLatency ti_sysbios_family_c674_Power_getTransitionLatency__E
xdc__CODESECT(ti_sysbios_family_c674_Power_getTransitionLatency__E, "ti_sysbios_family_c674_Power_getTransitionLatency")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_getTransitionLatency__E( ti_sysbios_family_c674_Power_Domain domain, xdc_UInt initialSetpoint, xdc_UInt finalSetpoint, xdc_UInt *frequencyLatency, xdc_UInt *voltageLatency );

/* registerConstraint__E */
#define ti_sysbios_family_c674_Power_registerConstraint ti_sysbios_family_c674_Power_registerConstraint__E
xdc__CODESECT(ti_sysbios_family_c674_Power_registerConstraint__E, "ti_sysbios_family_c674_Power_registerConstraint")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_registerConstraint__E( ti_sysbios_family_c674_Power_Constraint type, xdc_UArg value, ti_sysbios_family_c674_Power_ConstraintHandle *handle );

/* registerNotify__E */
#define ti_sysbios_family_c674_Power_registerNotify ti_sysbios_family_c674_Power_registerNotify__E
xdc__CODESECT(ti_sysbios_family_c674_Power_registerNotify__E, "ti_sysbios_family_c674_Power_registerNotify")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_registerNotify__E( ti_sysbios_family_c674_Power_Event eventType, xdc_UInt eventMask, xdc_Fxn notifyFxn, xdc_UArg clientArg, ti_sysbios_family_c674_Power_NotifyHandle *notifyHandle, xdc_Fxn *delayedCompletionFxn );

/* releaseDependency__E */
#define ti_sysbios_family_c674_Power_releaseDependency ti_sysbios_family_c674_Power_releaseDependency__E
xdc__CODESECT(ti_sysbios_family_c674_Power_releaseDependency__E, "ti_sysbios_family_c674_Power_releaseDependency")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_releaseDependency__E( ti_sysbios_family_c674_Power_Resource resourceID );

/* setDependency__E */
#define ti_sysbios_family_c674_Power_setDependency ti_sysbios_family_c674_Power_setDependency__E
xdc__CODESECT(ti_sysbios_family_c674_Power_setDependency__E, "ti_sysbios_family_c674_Power_setDependency")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_setDependency__E( ti_sysbios_family_c674_Power_Resource resourceID );

/* signalEvent__E */
#define ti_sysbios_family_c674_Power_signalEvent ti_sysbios_family_c674_Power_signalEvent__E
xdc__CODESECT(ti_sysbios_family_c674_Power_signalEvent__E, "ti_sysbios_family_c674_Power_signalEvent")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_signalEvent__E( ti_sysbios_family_c674_Power_Event eventType, xdc_UArg eventArg1, xdc_UArg eventArg2, xdc_UInt notifyTimeout );

/* sleepDSP__E */
#define ti_sysbios_family_c674_Power_sleepDSP ti_sysbios_family_c674_Power_sleepDSP__E
xdc__CODESECT(ti_sysbios_family_c674_Power_sleepDSP__E, "ti_sysbios_family_c674_Power_sleepDSP")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_sleepDSP__E( xdc_UInt sleepCode, xdc_UInt sleepArg, xdc_UInt notifyTimeout );

/* unregisterConstraint__E */
#define ti_sysbios_family_c674_Power_unregisterConstraint ti_sysbios_family_c674_Power_unregisterConstraint__E
xdc__CODESECT(ti_sysbios_family_c674_Power_unregisterConstraint__E, "ti_sysbios_family_c674_Power_unregisterConstraint")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_unregisterConstraint__E( ti_sysbios_family_c674_Power_ConstraintHandle handle );

/* unregisterNotify__E */
#define ti_sysbios_family_c674_Power_unregisterNotify ti_sysbios_family_c674_Power_unregisterNotify__E
xdc__CODESECT(ti_sysbios_family_c674_Power_unregisterNotify__E, "ti_sysbios_family_c674_Power_unregisterNotify")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_unregisterNotify__E( ti_sysbios_family_c674_Power_NotifyHandle notifyHandle );

/* delayCompletion0__I */
#define ti_sysbios_family_c674_Power_delayCompletion0 ti_sysbios_family_c674_Power_delayCompletion0__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion0__I, "ti_sysbios_family_c674_Power_delayCompletion0")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion0__I( void );

/* delayCompletion1__I */
#define ti_sysbios_family_c674_Power_delayCompletion1 ti_sysbios_family_c674_Power_delayCompletion1__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion1__I, "ti_sysbios_family_c674_Power_delayCompletion1")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion1__I( void );

/* delayCompletion2__I */
#define ti_sysbios_family_c674_Power_delayCompletion2 ti_sysbios_family_c674_Power_delayCompletion2__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion2__I, "ti_sysbios_family_c674_Power_delayCompletion2")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion2__I( void );

/* delayCompletion3__I */
#define ti_sysbios_family_c674_Power_delayCompletion3 ti_sysbios_family_c674_Power_delayCompletion3__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion3__I, "ti_sysbios_family_c674_Power_delayCompletion3")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion3__I( void );

/* delayCompletion4__I */
#define ti_sysbios_family_c674_Power_delayCompletion4 ti_sysbios_family_c674_Power_delayCompletion4__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion4__I, "ti_sysbios_family_c674_Power_delayCompletion4")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion4__I( void );

/* delayCompletion5__I */
#define ti_sysbios_family_c674_Power_delayCompletion5 ti_sysbios_family_c674_Power_delayCompletion5__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion5__I, "ti_sysbios_family_c674_Power_delayCompletion5")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion5__I( void );

/* delayCompletion6__I */
#define ti_sysbios_family_c674_Power_delayCompletion6 ti_sysbios_family_c674_Power_delayCompletion6__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion6__I, "ti_sysbios_family_c674_Power_delayCompletion6")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion6__I( void );

/* delayCompletion7__I */
#define ti_sysbios_family_c674_Power_delayCompletion7 ti_sysbios_family_c674_Power_delayCompletion7__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion7__I, "ti_sysbios_family_c674_Power_delayCompletion7")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion7__I( void );

/* delayCompletion8__I */
#define ti_sysbios_family_c674_Power_delayCompletion8 ti_sysbios_family_c674_Power_delayCompletion8__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion8__I, "ti_sysbios_family_c674_Power_delayCompletion8")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion8__I( void );

/* delayCompletion9__I */
#define ti_sysbios_family_c674_Power_delayCompletion9 ti_sysbios_family_c674_Power_delayCompletion9__I
xdc__CODESECT(ti_sysbios_family_c674_Power_delayCompletion9__I, "ti_sysbios_family_c674_Power_delayCompletion9")
__extern xdc_Void ti_sysbios_family_c674_Power_delayCompletion9__I( void );

/* idleStopClock__I */
#define ti_sysbios_family_c674_Power_idleStopClock ti_sysbios_family_c674_Power_idleStopClock__I
xdc__CODESECT(ti_sysbios_family_c674_Power_idleStopClock__I, "ti_sysbios_family_c674_Power_idleStopClock")
__extern xdc_Void ti_sysbios_family_c674_Power_idleStopClock__I( void );

/* init__I */
#define ti_sysbios_family_c674_Power_init ti_sysbios_family_c674_Power_init__I
xdc__CODESECT(ti_sysbios_family_c674_Power_init__I, "ti_sysbios_family_c674_Power_init")
__extern xdc_Void ti_sysbios_family_c674_Power_init__I( void );

/* initRefCounts__I */
#define ti_sysbios_family_c674_Power_initRefCounts ti_sysbios_family_c674_Power_initRefCounts__I
xdc__CODESECT(ti_sysbios_family_c674_Power_initRefCounts__I, "ti_sysbios_family_c674_Power_initRefCounts")
__extern xdc_Void ti_sysbios_family_c674_Power_initRefCounts__I( void );

/* notify__I */
#define ti_sysbios_family_c674_Power_notify ti_sysbios_family_c674_Power_notify__I
xdc__CODESECT(ti_sysbios_family_c674_Power_notify__I, "ti_sysbios_family_c674_Power_notify")
__extern ti_sysbios_family_c674_Power_Status ti_sysbios_family_c674_Power_notify__I( ti_sysbios_family_c674_Power_Event eventType, xdc_UInt timeout, ti_sysbios_family_c674_Power_SigType sigType, xdc_UArg extArg1, xdc_UArg extArg2 );

/* rebuildConstraint__I */
#define ti_sysbios_family_c674_Power_rebuildConstraint ti_sysbios_family_c674_Power_rebuildConstraint__I
xdc__CODESECT(ti_sysbios_family_c674_Power_rebuildConstraint__I, "ti_sysbios_family_c674_Power_rebuildConstraint")
__extern xdc_Void ti_sysbios_family_c674_Power_rebuildConstraint__I( ti_sysbios_family_c674_Power_Constraint type );

/* updateConstraints__I */
#define ti_sysbios_family_c674_Power_updateConstraints ti_sysbios_family_c674_Power_updateConstraints__I
xdc__CODESECT(ti_sysbios_family_c674_Power_updateConstraints__I, "ti_sysbios_family_c674_Power_updateConstraints")
__extern xdc_Void ti_sysbios_family_c674_Power_updateConstraints__I( ti_sysbios_family_c674_Power_Constraint type, xdc_UArg value );


/*
 * ======== CONVERTORS ========
 */

/* Module_upCast */
static inline ti_sysbios_interfaces_IPower_Module ti_sysbios_family_c674_Power_Module_upCast(void);
static inline ti_sysbios_interfaces_IPower_Module ti_sysbios_family_c674_Power_Module_upCast(void)
{
    return (ti_sysbios_interfaces_IPower_Module)&ti_sysbios_family_c674_Power_Module__FXNS__C;
}

/* Module_to_ti_sysbios_interfaces_IPower */
#define ti_sysbios_family_c674_Power_Module_to_ti_sysbios_interfaces_IPower ti_sysbios_family_c674_Power_Module_upCast


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_c674_Power_Module_startupDone() ti_sysbios_family_c674_Power_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_c674_Power_Object_heap() ti_sysbios_family_c674_Power_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_c674_Power_Module_heap() ti_sysbios_family_c674_Power_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_c674_Power_Module__id ti_sysbios_family_c674_Power_Module_id(void);
static inline CT__ti_sysbios_family_c674_Power_Module__id ti_sysbios_family_c674_Power_Module_id( void ) 
{
    return ti_sysbios_family_c674_Power_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_c674_Power_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_c674_Power_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_c674_Power_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_c674_Power_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_c674_Power_Module_getMask( void ) 
{
    return ti_sysbios_family_c674_Power_Module__diagsMask__C != NULL ? *ti_sysbios_family_c674_Power_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_c674_Power_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_c674_Power_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_c674_Power_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_c674_Power_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_c674_Power__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_c674_Power__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_c674_Power__internalaccess))

#ifndef ti_sysbios_family_c674_Power__include_state
#define ti_sysbios_family_c674_Power__include_state

/* Module_State */
struct ti_sysbios_family_c674_Power_Module_State {
    xdc_UInt32 currentSetpointCPU;
    xdc_UInt32 currentSetpointPER;
    xdc_UInt32 disallowedSetpointsCPU;
    xdc_UInt32 disallowedSetpointsPER;
    xdc_UInt32 disallowedSleepModes;
    __TA_ti_sysbios_family_c674_Power_Module_State__notifyQ notifyQ;
    xdc_UInt32 nextSP;
    xdc_UInt32 previousSP;
    xdc_UInt32 nextSPPER;
    xdc_UInt32 previousSPPER;
    xdc_UInt32 numSPCPU;
    xdc_UInt32 numSPPER;
    ti_sysbios_family_c674_Power_Config currentConfig;
    xdc_Bool PSCLinitOK;
    xdc_Bool busy;
    char __dummy;
};

/* Module__state__V */
#ifndef ti_sysbios_family_c674_Power_Module__state__VR
extern struct ti_sysbios_family_c674_Power_Module_State__ ti_sysbios_family_c674_Power_Module__state__V;
#else
#define ti_sysbios_family_c674_Power_Module__state__V (*((struct ti_sysbios_family_c674_Power_Module_State__*)(xdcRomStatePtr + ti_sysbios_family_c674_Power_Module__state__V_offset)))
#endif

/* Module_State_constraintsQ */
#ifndef ti_sysbios_family_c674_Power_Module_State_constraintsQ__OR
__extern __FAR__ const xdc_SizeT ti_sysbios_family_c674_Power_Module_State_constraintsQ__O;
#endif
static inline ti_sysbios_knl_Queue_Handle ti_sysbios_family_c674_Power_Module_State_constraintsQ();
static inline ti_sysbios_knl_Queue_Handle ti_sysbios_family_c674_Power_Module_State_constraintsQ()
{
    return (ti_sysbios_knl_Queue_Handle)(((char*)&ti_sysbios_family_c674_Power_Module__state__V) + ti_sysbios_family_c674_Power_Module_State_constraintsQ__O);
}

#endif /* ti_sysbios_family_c674_Power__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_c674_Power__nolocalnames)

#ifndef ti_sysbios_family_c674_Power__localnames__done
#define ti_sysbios_family_c674_Power__localnames__done

/* module prefix */
#define Power_Attrs ti_sysbios_family_c674_Power_Attrs
#define Power_Config ti_sysbios_family_c674_Power_Config
#define Power_SetpointInfo ti_sysbios_family_c674_Power_SetpointInfo
#define Power_SleepOverride ti_sysbios_family_c674_Power_SleepOverride
#define Power_ConstraintHandle ti_sysbios_family_c674_Power_ConstraintHandle
#define Power_NotifyHandle ti_sysbios_family_c674_Power_NotifyHandle
#define Power_FuncPtr ti_sysbios_family_c674_Power_FuncPtr
#define Power_Constraint ti_sysbios_family_c674_Power_Constraint
#define Power_Domain ti_sysbios_family_c674_Power_Domain
#define Power_Event ti_sysbios_family_c674_Power_Event
#define Power_NotifyResponse ti_sysbios_family_c674_Power_NotifyResponse
#define Power_EXTERNAL ti_sysbios_family_c674_Power_EXTERNAL
#define Power_RTC_ALARM ti_sysbios_family_c674_Power_RTC_ALARM
#define Power_PLL0 ti_sysbios_family_c674_Power_PLL0
#define Power_PLL1 ti_sysbios_family_c674_Power_PLL1
#define Power_CVFSCALING ti_sysbios_family_c674_Power_CVFSCALING
#define Power_CRESOURCETRACKING ti_sysbios_family_c674_Power_CRESOURCETRACKING
#define Power_Resource ti_sysbios_family_c674_Power_Resource
#define Power_SleepCode ti_sysbios_family_c674_Power_SleepCode
#define Power_Status ti_sysbios_family_c674_Power_Status
#define Power_pmiLib ti_sysbios_family_c674_Power_pmiLib
#define Power_psclLib ti_sysbios_family_c674_Power_psclLib
#define Power_CWAITFORV ti_sysbios_family_c674_Power_CWAITFORV
#define Power_CSCALEVWITHF ti_sysbios_family_c674_Power_CSCALEVWITHF
#define Power_CMOVEINITSPS ti_sysbios_family_c674_Power_CMOVEINITSPS
#define Power_RELEASE ti_sysbios_family_c674_Power_RELEASE
#define Power_SET ti_sysbios_family_c674_Power_SET
#define Power_QUERY ti_sysbios_family_c674_Power_QUERY
#define Power_SigType ti_sysbios_family_c674_Power_SigType
#define Power_Module_State ti_sysbios_family_c674_Power_Module_State
#define Power_DISALLOWED_CPU_SETPOINT_MASK ti_sysbios_family_c674_Power_DISALLOWED_CPU_SETPOINT_MASK
#define Power_DISALLOWED_PER_SETPOINT_MASK ti_sysbios_family_c674_Power_DISALLOWED_PER_SETPOINT_MASK
#define Power_DISALLOWEDSLEEPSTATE_MASK ti_sysbios_family_c674_Power_DISALLOWEDSLEEPSTATE_MASK
#define Power_CPU ti_sysbios_family_c674_Power_CPU
#define Power_PER ti_sysbios_family_c674_Power_PER
#define Power_GOINGTOSTANDBY ti_sysbios_family_c674_Power_GOINGTOSTANDBY
#define Power_AWAKEFROMSTANDBY ti_sysbios_family_c674_Power_AWAKEFROMSTANDBY
#define Power_GOINGTOSLEEP ti_sysbios_family_c674_Power_GOINGTOSLEEP
#define Power_AWAKEFROMSLEEP ti_sysbios_family_c674_Power_AWAKEFROMSLEEP
#define Power_GOINGTODEEPSLEEP ti_sysbios_family_c674_Power_GOINGTODEEPSLEEP
#define Power_AWAKEFROMDEEPSLEEP ti_sysbios_family_c674_Power_AWAKEFROMDEEPSLEEP
#define Power_PENDING_CPU_SETPOINTCHANGE ti_sysbios_family_c674_Power_PENDING_CPU_SETPOINTCHANGE
#define Power_PENDING_PER_SETPOINTCHANGE ti_sysbios_family_c674_Power_PENDING_PER_SETPOINTCHANGE
#define Power_DONE_CPU_SETPOINTCHANGE ti_sysbios_family_c674_Power_DONE_CPU_SETPOINTCHANGE
#define Power_DONE_PER_SETPOINTCHANGE ti_sysbios_family_c674_Power_DONE_PER_SETPOINTCHANGE
#define Power_INVALIDEVENT ti_sysbios_family_c674_Power_INVALIDEVENT
#define Power_NOTIFYDONE ti_sysbios_family_c674_Power_NOTIFYDONE
#define Power_NOTIFYNOTDONE ti_sysbios_family_c674_Power_NOTIFYNOTDONE
#define Power_NOTIFYERROR ti_sysbios_family_c674_Power_NOTIFYERROR
#define Power_RSRC_EDMA3_CC_0 ti_sysbios_family_c674_Power_RSRC_EDMA3_CC_0
#define Power_RSRC_EDMA3_TC_0 ti_sysbios_family_c674_Power_RSRC_EDMA3_TC_0
#define Power_RSRC_EDMA3_TC_1 ti_sysbios_family_c674_Power_RSRC_EDMA3_TC_1
#define Power_RSRC_EMIFA ti_sysbios_family_c674_Power_RSRC_EMIFA
#define Power_RSRC_SPI_0 ti_sysbios_family_c674_Power_RSRC_SPI_0
#define Power_RSRC_MMCSD_0 ti_sysbios_family_c674_Power_RSRC_MMCSD_0
#define Power_RSRC_AINTC ti_sysbios_family_c674_Power_RSRC_AINTC
#define Power_RSRC_RSVD1 ti_sysbios_family_c674_Power_RSRC_RSVD1
#define Power_RSRC_UART_0 ti_sysbios_family_c674_Power_RSRC_UART_0
#define Power_RSRC_RSVD2 ti_sysbios_family_c674_Power_RSRC_RSVD2
#define Power_RSRC_EDMA3_CC_1 ti_sysbios_family_c674_Power_RSRC_EDMA3_CC_1
#define Power_RSRC_USB0 ti_sysbios_family_c674_Power_RSRC_USB0
#define Power_RSRC_USB1 ti_sysbios_family_c674_Power_RSRC_USB1
#define Power_RSRC_GPIO ti_sysbios_family_c674_Power_RSRC_GPIO
#define Power_RSRC_UHPI ti_sysbios_family_c674_Power_RSRC_UHPI
#define Power_RSRC_EMAC ti_sysbios_family_c674_Power_RSRC_EMAC
#define Power_RSRC_DDR2 ti_sysbios_family_c674_Power_RSRC_DDR2
#define Power_RSRC_MCASP_0 ti_sysbios_family_c674_Power_RSRC_MCASP_0
#define Power_RSRC_SATA ti_sysbios_family_c674_Power_RSRC_SATA
#define Power_RSRC_VPIF ti_sysbios_family_c674_Power_RSRC_VPIF
#define Power_RSRC_SPI_1 ti_sysbios_family_c674_Power_RSRC_SPI_1
#define Power_RSRC_I2C_1 ti_sysbios_family_c674_Power_RSRC_I2C_1
#define Power_RSRC_UART_1 ti_sysbios_family_c674_Power_RSRC_UART_1
#define Power_RSRC_UART_2 ti_sysbios_family_c674_Power_RSRC_UART_2
#define Power_RSRC_MCBSP_0 ti_sysbios_family_c674_Power_RSRC_MCBSP_0
#define Power_RSRC_MCBSP_1 ti_sysbios_family_c674_Power_RSRC_MCBSP_1
#define Power_RSRC_LCDC ti_sysbios_family_c674_Power_RSRC_LCDC
#define Power_RSRC_EHRPWM ti_sysbios_family_c674_Power_RSRC_EHRPWM
#define Power_RSRC_MMCSD_1 ti_sysbios_family_c674_Power_RSRC_MMCSD_1
#define Power_RSRC_UPP ti_sysbios_family_c674_Power_RSRC_UPP
#define Power_RSRC_ECAP ti_sysbios_family_c674_Power_RSRC_ECAP
#define Power_RSRC_EDMA3_TC_2 ti_sysbios_family_c674_Power_RSRC_EDMA3_TC_2
#define Power_RSRC_END ti_sysbios_family_c674_Power_RSRC_END
#define Power_STANDBY ti_sysbios_family_c674_Power_STANDBY
#define Power_SLEEP ti_sysbios_family_c674_Power_SLEEP
#define Power_DEEPSLEEP ti_sysbios_family_c674_Power_DEEPSLEEP
#define Power_SOK ti_sysbios_family_c674_Power_SOK
#define Power_EFAIL ti_sysbios_family_c674_Power_EFAIL
#define Power_EINVALIDEVENT ti_sysbios_family_c674_Power_EINVALIDEVENT
#define Power_EINVALIDHANDLE ti_sysbios_family_c674_Power_EINVALIDHANDLE
#define Power_EINVALIDPOINTER ti_sysbios_family_c674_Power_EINVALIDPOINTER
#define Power_EINVALIDVALUE ti_sysbios_family_c674_Power_EINVALIDVALUE
#define Power_ENOTIMPLEMENTED ti_sysbios_family_c674_Power_ENOTIMPLEMENTED
#define Power_ENOTSUPPORTED ti_sysbios_family_c674_Power_ENOTSUPPORTED
#define Power_EOUTOFRANGE ti_sysbios_family_c674_Power_EOUTOFRANGE
#define Power_ETIMEOUT ti_sysbios_family_c674_Power_ETIMEOUT
#define Power_EBUSY ti_sysbios_family_c674_Power_EBUSY
#define Power_EINITFAILURE ti_sysbios_family_c674_Power_EINITFAILURE
#define Power_ETOOMANYCALLS ti_sysbios_family_c674_Power_ETOOMANYCALLS
#define Power_pmiLib_evm6748 ti_sysbios_family_c674_Power_pmiLib_evm6748
#define Power_pmiLib_shared_evm6748 ti_sysbios_family_c674_Power_pmiLib_shared_evm6748
#define Power_pmiLib_lcdk ti_sysbios_family_c674_Power_pmiLib_lcdk
#define Power_pmiLib_null ti_sysbios_family_c674_Power_pmiLib_null
#define Power_pmiLib_user ti_sysbios_family_c674_Power_pmiLib_user
#define Power_psclLib_evm6748 ti_sysbios_family_c674_Power_psclLib_evm6748
#define Power_psclLib_evm6748_372 ti_sysbios_family_c674_Power_psclLib_evm6748_372
#define Power_psclLib_evm6748_408 ti_sysbios_family_c674_Power_psclLib_evm6748_408
#define Power_psclLib_evm6748_456 ti_sysbios_family_c674_Power_psclLib_evm6748_456
#define Power_psclLib_lcdk ti_sysbios_family_c674_Power_psclLib_lcdk
#define Power_psclLib_null ti_sysbios_family_c674_Power_psclLib_null
#define Power_psclLib_user ti_sysbios_family_c674_Power_psclLib_user
#define Power_SigType_INTERNAL ti_sysbios_family_c674_Power_SigType_INTERNAL
#define Power_SigType_EXTERNAL ti_sysbios_family_c674_Power_SigType_EXTERNAL
#define Power_idle ti_sysbios_family_c674_Power_idle
#define Power_trackResources ti_sysbios_family_c674_Power_trackResources
#define Power_enableScaling ti_sysbios_family_c674_Power_enableScaling
#define Power_initialSetpointCPU ti_sysbios_family_c674_Power_initialSetpointCPU
#define Power_initialSetpointPER ti_sysbios_family_c674_Power_initialSetpointPER
#define Power_CAPSMASK ti_sysbios_family_c674_Power_CAPSMASK
#define Power_Module_State_constraintsQ ti_sysbios_family_c674_Power_Module_State_constraintsQ
#define Power_changeSetpoint ti_sysbios_family_c674_Power_changeSetpoint
#define Power_configure ti_sysbios_family_c674_Power_configure
#define Power_getCapabilities ti_sysbios_family_c674_Power_getCapabilities
#define Power_getConstraintInfo ti_sysbios_family_c674_Power_getConstraintInfo
#define Power_getCurrentSetpoint ti_sysbios_family_c674_Power_getCurrentSetpoint
#define Power_getDependencyCount ti_sysbios_family_c674_Power_getDependencyCount
#define Power_getNumSetpoints ti_sysbios_family_c674_Power_getNumSetpoints
#define Power_getSetpointInfo ti_sysbios_family_c674_Power_getSetpointInfo
#define Power_getTransitionLatency ti_sysbios_family_c674_Power_getTransitionLatency
#define Power_registerConstraint ti_sysbios_family_c674_Power_registerConstraint
#define Power_registerNotify ti_sysbios_family_c674_Power_registerNotify
#define Power_releaseDependency ti_sysbios_family_c674_Power_releaseDependency
#define Power_setDependency ti_sysbios_family_c674_Power_setDependency
#define Power_signalEvent ti_sysbios_family_c674_Power_signalEvent
#define Power_sleepDSP ti_sysbios_family_c674_Power_sleepDSP
#define Power_unregisterConstraint ti_sysbios_family_c674_Power_unregisterConstraint
#define Power_unregisterNotify ti_sysbios_family_c674_Power_unregisterNotify
#define Power_Module_name ti_sysbios_family_c674_Power_Module_name
#define Power_Module_id ti_sysbios_family_c674_Power_Module_id
#define Power_Module_startup ti_sysbios_family_c674_Power_Module_startup
#define Power_Module_startupDone ti_sysbios_family_c674_Power_Module_startupDone
#define Power_Module_hasMask ti_sysbios_family_c674_Power_Module_hasMask
#define Power_Module_getMask ti_sysbios_family_c674_Power_Module_getMask
#define Power_Module_setMask ti_sysbios_family_c674_Power_Module_setMask
#define Power_Object_heap ti_sysbios_family_c674_Power_Object_heap
#define Power_Module_heap ti_sysbios_family_c674_Power_Module_heap
#define Power_Module_upCast ti_sysbios_family_c674_Power_Module_upCast
#define Power_Module_to_ti_sysbios_interfaces_IPower ti_sysbios_family_c674_Power_Module_to_ti_sysbios_interfaces_IPower

#endif /* ti_sysbios_family_c674_Power__localnames__done */
#endif
