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

#ifndef ti_sysbios_family_arm_ducati_smp_Power__include
#define ti_sysbios_family_arm_ducati_smp_Power__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_arm_ducati_smp_Power__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_arm_ducati_smp_Power___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/arm/ducati/smp/package/package.defs.h>

#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/family/arm/ducati/GateSmp.h>
#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* SuspendFuncHookPtr */
typedef xdc_Void (*ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr)(void);

/* SuspendArgs */
struct ti_sysbios_family_arm_ducati_smp_Power_SuspendArgs {
    xdc_Bool pmMasterCore;
    xdc_Bool rendezvousResume;
    xdc_Int dmaChannel;
    xdc_UInt intMask31_0;
    xdc_UInt intMask63_32;
    xdc_UInt intMask79_64;
};

/* L2RAM */
#define ti_sysbios_family_arm_ducati_smp_Power_L2RAM (0x55020000)


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* Struct8 */
struct ti_sysbios_family_arm_ducati_smp_Power_Struct8 {
    xdc_UInt32 a0;
    xdc_UInt32 a1;
    xdc_UInt32 a2;
    xdc_UInt32 a3;
    xdc_UInt32 a4;
    xdc_UInt32 a5;
    xdc_UInt32 a6;
    xdc_UInt32 a7;
};

/* Struct10 */
struct ti_sysbios_family_arm_ducati_smp_Power_Struct10 {
    xdc_UInt32 a0;
    xdc_UInt32 a1;
    xdc_UInt32 a2;
    xdc_UInt32 a3;
    xdc_UInt32 a4;
    xdc_UInt32 a5;
    xdc_UInt32 a6;
    xdc_UInt32 a7;
    xdc_UInt32 a8;
    xdc_UInt32 a9;
};

/* TablePIDS */
struct ti_sysbios_family_arm_ducati_smp_Power_TablePIDS {
    xdc_UInt32 PID1;
    xdc_UInt32 PID2;
};

/* IPRxRegs */
struct ti_sysbios_family_arm_ducati_smp_Power_IPRxRegs {
    xdc_UInt32 IPR0;
    xdc_UInt32 IPR1;
    xdc_UInt32 IPR2;
    xdc_UInt32 IPR3;
    xdc_UInt32 IPR4;
    xdc_UInt32 IPR5;
    xdc_UInt32 IPR6;
    xdc_UInt32 IPR7;
    xdc_UInt32 IPR8;
    xdc_UInt32 IPR9;
    xdc_UInt32 IPR10;
    xdc_UInt32 IPR11;
    xdc_UInt32 IPR12;
    xdc_UInt32 IPR13;
    xdc_UInt32 IPR14;
    xdc_UInt32 IPR15;
};

/* CfgRegs */
struct ti_sysbios_family_arm_ducati_smp_Power_CfgRegs {
    xdc_UInt32 VTOR;
    xdc_UInt32 AIRCR;
    xdc_UInt32 SCR;
    xdc_UInt32 CCR;
    xdc_UInt32 SHPR0;
    xdc_UInt32 SHPR4;
    xdc_UInt32 SHPR8;
    xdc_UInt32 SHCSR;
};

/* NVICContext */
struct ti_sysbios_family_arm_ducati_smp_Power_NVICContext {
    xdc_UInt32 AUXCTRL;
    xdc_UInt32 STCSR;
    xdc_UInt32 STRVR;
    xdc_UInt32 ISER0;
    xdc_UInt32 ISER1;
    xdc_UInt32 SCR;
    ti_sysbios_family_arm_ducati_smp_Power_IPRxRegs iprRegs;
    ti_sysbios_family_arm_ducati_smp_Power_CfgRegs cfgRegs;
};

/* ContextAMMU */
typedef xdc_UInt32 __T1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeAddr;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeAddr[4];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeAddr[4];
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeAddr __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeAddr;
typedef xdc_UInt32 __T1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeXlteAddr;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeXlteAddr[4];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeXlteAddr[4];
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeXlteAddr __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeXlteAddr;
typedef xdc_UInt32 __T1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largePolicy;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largePolicy[4];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largePolicy[4];
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largePolicy __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largePolicy;
typedef xdc_UInt32 __T1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medAddr;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medAddr[2];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medAddr[2];
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medAddr __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medAddr;
typedef xdc_UInt32 __T1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medXlteAddr;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medXlteAddr[2];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medXlteAddr[2];
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medXlteAddr __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medXlteAddr;
typedef xdc_UInt32 __T1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medPolicy;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medPolicy[2];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medPolicy[2];
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medPolicy __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medPolicy;
struct ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU {
    __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeAddr largeAddr;
    __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largeXlteAddr largeXlteAddr;
    __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__largePolicy largePolicy;
    __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medAddr medAddr;
    __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medXlteAddr medXlteAddr;
    __TA_ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU__medPolicy medPolicy;
    ti_sysbios_family_arm_ducati_smp_Power_Struct10 smallAddr;
    ti_sysbios_family_arm_ducati_smp_Power_Struct10 smallXlteAddr;
    ti_sysbios_family_arm_ducati_smp_Power_Struct10 smallPolicy;
    xdc_UInt32 mmuConfig;
};

/* ContextCTM */
struct ti_sysbios_family_arm_ducati_smp_Power_ContextCTM {
    xdc_UInt32 CNTL;
    xdc_UInt32 STMCNTL;
    xdc_UInt32 STMMSTID;
    xdc_UInt32 STMINTVL;
    xdc_UInt32 STMSEL0;
    xdc_UInt32 TINTVLR0;
    xdc_UInt32 TINTVLR1;
    xdc_UInt32 GNBL0;
    ti_sysbios_family_arm_ducati_smp_Power_Struct8 control;
};

/* CpuRegs */
struct ti_sysbios_family_arm_ducati_smp_Power_CpuRegs {
    xdc_UInt32 R4;
    xdc_UInt32 R5;
    xdc_UInt32 R6;
    xdc_UInt32 R7;
    xdc_UInt32 R8;
    xdc_UInt32 R9;
    xdc_UInt32 R10;
    xdc_UInt32 R11;
    xdc_UInt32 LR;
    xdc_UInt32 CONTROL;
    xdc_UInt32 BASEPRI;
    xdc_UInt32 MSP;
    xdc_UInt32 pSP;
};

/* PrivateContext */
struct ti_sysbios_family_arm_ducati_smp_Power_PrivateContext {
    ti_sysbios_family_arm_ducati_smp_Power_CpuRegs privateCPU;
    ti_sysbios_family_arm_ducati_smp_Power_NVICContext privateNVIC;
    ti_sysbios_family_arm_ducati_smp_Power_TablePIDS privatePIDS;
};

/* UnicacheConfig */
struct ti_sysbios_family_arm_ducati_smp_Power_UnicacheConfig {
    xdc_UInt32 L1_CONFIG;
    xdc_UInt32 L1_OCP;
};

/* SubsystemContext */
struct ti_sysbios_family_arm_ducati_smp_Power_SubsystemContext {
    xdc_UInt32 WUGEN_MEVT0;
    xdc_UInt32 WUGEN_MEVT1;
    ti_sysbios_family_arm_ducati_smp_Power_UnicacheConfig cacheConfig;
    ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU ammuConfig;
    ti_sysbios_family_arm_ducati_smp_Power_ContextCTM ctmConfig;
};

/* DucatiContext */
struct ti_sysbios_family_arm_ducati_smp_Power_DucatiContext {
    ti_sysbios_family_arm_ducati_smp_Power_PrivateContext masterContext;
    ti_sysbios_family_arm_ducati_smp_Power_PrivateContext slaveContext;
    ti_sysbios_family_arm_ducati_smp_Power_SubsystemContext ssContext;
};

/* SdmaRegs */
struct ti_sysbios_family_arm_ducati_smp_Power_SdmaRegs {
    volatile xdc_UInt32 CCR;
    xdc_UInt32 CLNK;
    xdc_UInt32 CICR;
    xdc_UInt32 CSR;
    xdc_UInt32 CSDP;
    xdc_UInt32 CEN;
    xdc_UInt32 CFN;
    xdc_UInt32 CSSA;
    xdc_UInt32 CDSA;
    xdc_UInt32 CSEI;
    xdc_UInt32 CSFI;
    xdc_UInt32 CDEI;
    xdc_UInt32 CDFI;
};


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled (ti_sysbios_family_arm_ducati_smp_Power_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded (ti_sysbios_family_arm_ducati_smp_Power_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask (ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj (ti_sysbios_family_arm_ducati_smp_Power_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms (ti_sysbios_family_arm_ducati_smp_Power_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_arm_ducati_smp_Power_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__id ti_sysbios_family_arm_ducati_smp_Power_Module__id__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__id__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__id__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__id*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__id__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__id (ti_sysbios_family_arm_ducati_smp_Power_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined (ti_sysbios_family_arm_ducati_smp_Power_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj (ti_sysbios_family_arm_ducati_smp_Power_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0 ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0 (ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1 ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1 (ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2 ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2 (ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4 ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4 (ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8 ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8 (ti_sysbios_family_arm_ducati_smp_Power_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_arm_ducati_smp_Power_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Object__count ti_sysbios_family_arm_ducati_smp_Power_Object__count__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Object__count__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Object__count__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Object__count*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Object__count__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Object__count (ti_sysbios_family_arm_ducati_smp_Power_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_arm_ducati_smp_Power_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Object__heap ti_sysbios_family_arm_ducati_smp_Power_Object__heap__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Object__heap__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Object__heap__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Object__heap__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Object__heap (ti_sysbios_family_arm_ducati_smp_Power_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof (ti_sysbios_family_arm_ducati_smp_Power_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_arm_ducati_smp_Power_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_Object__table ti_sysbios_family_arm_ducati_smp_Power_Object__table__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_Object__table__CR
#define ti_sysbios_family_arm_ducati_smp_Power_Object__table__C (*((CT__ti_sysbios_family_arm_ducati_smp_Power_Object__table*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_Object__table__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Object__table (ti_sysbios_family_arm_ducati_smp_Power_Object__table__C)
#endif

/* sdmaRegs */
typedef xdc_Ptr CT__ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs__CR
#define ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs (*((CT__ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs (ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs__C)
#endif

/* idle */
typedef xdc_Bool CT__ti_sysbios_family_arm_ducati_smp_Power_idle;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_idle ti_sysbios_family_arm_ducati_smp_Power_idle__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_idle__CR
#define ti_sysbios_family_arm_ducati_smp_Power_idle (*((CT__ti_sysbios_family_arm_ducati_smp_Power_idle*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_idle__C_offset)))
#else
#ifdef ti_sysbios_family_arm_ducati_smp_Power_idle__D
#define ti_sysbios_family_arm_ducati_smp_Power_idle (ti_sysbios_family_arm_ducati_smp_Power_idle__D)
#else
#define ti_sysbios_family_arm_ducati_smp_Power_idle (ti_sysbios_family_arm_ducati_smp_Power_idle__C)
#endif
#endif

/* preSuspendHooks */
typedef ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr __T1_ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks;
typedef struct { int length; ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr *elem; } __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks;
typedef struct { int length; ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr const *elem; } __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks;
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks __TA_ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks;
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks CT__ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks__CR
#define ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks (*((CT__ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks (ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks__C)
#endif

/* postSuspendHooks */
typedef ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr __T1_ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks;
typedef struct { int length; ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr *elem; } __ARRAY1_ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks;
typedef struct { int length; ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr const *elem; } __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks;
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks __TA_ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks;
typedef __CARRAY1_ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks CT__ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks__CR
#define ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks (*((CT__ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks (ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks__C)
#endif

/* enable */
typedef xdc_Bool CT__ti_sysbios_family_arm_ducati_smp_Power_enable;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_enable ti_sysbios_family_arm_ducati_smp_Power_enable__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_enable__CR
#define ti_sysbios_family_arm_ducati_smp_Power_enable (*((CT__ti_sysbios_family_arm_ducati_smp_Power_enable*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_enable__C_offset)))
#else
#ifdef ti_sysbios_family_arm_ducati_smp_Power_enable__D
#define ti_sysbios_family_arm_ducati_smp_Power_enable (ti_sysbios_family_arm_ducati_smp_Power_enable__D)
#else
#define ti_sysbios_family_arm_ducati_smp_Power_enable (ti_sysbios_family_arm_ducati_smp_Power_enable__C)
#endif
#endif

/* gate */
typedef ti_sysbios_family_arm_ducati_GateSmp_Handle CT__ti_sysbios_family_arm_ducati_smp_Power_gate;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_gate ti_sysbios_family_arm_ducati_smp_Power_gate__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_gate__CR
#define ti_sysbios_family_arm_ducati_smp_Power_gate (*((CT__ti_sysbios_family_arm_ducati_smp_Power_gate*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_gate__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_gate (ti_sysbios_family_arm_ducati_smp_Power_gate__C)
#endif

/* taskCore0 */
typedef ti_sysbios_knl_Task_Handle CT__ti_sysbios_family_arm_ducati_smp_Power_taskCore0;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_taskCore0 ti_sysbios_family_arm_ducati_smp_Power_taskCore0__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_taskCore0__CR
#define ti_sysbios_family_arm_ducati_smp_Power_taskCore0 (*((CT__ti_sysbios_family_arm_ducati_smp_Power_taskCore0*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_taskCore0__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_taskCore0 (ti_sysbios_family_arm_ducati_smp_Power_taskCore0__C)
#endif

/* taskCore1 */
typedef ti_sysbios_knl_Task_Handle CT__ti_sysbios_family_arm_ducati_smp_Power_taskCore1;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_taskCore1 ti_sysbios_family_arm_ducati_smp_Power_taskCore1__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_taskCore1__CR
#define ti_sysbios_family_arm_ducati_smp_Power_taskCore1 (*((CT__ti_sysbios_family_arm_ducati_smp_Power_taskCore1*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_taskCore1__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_taskCore1 (ti_sysbios_family_arm_ducati_smp_Power_taskCore1__C)
#endif

/* semCore0 */
typedef ti_sysbios_knl_Semaphore_Handle CT__ti_sysbios_family_arm_ducati_smp_Power_semCore0;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_semCore0 ti_sysbios_family_arm_ducati_smp_Power_semCore0__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_semCore0__CR
#define ti_sysbios_family_arm_ducati_smp_Power_semCore0 (*((CT__ti_sysbios_family_arm_ducati_smp_Power_semCore0*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_semCore0__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_semCore0 (ti_sysbios_family_arm_ducati_smp_Power_semCore0__C)
#endif

/* semCore1 */
typedef ti_sysbios_knl_Semaphore_Handle CT__ti_sysbios_family_arm_ducati_smp_Power_semCore1;
__extern __FAR__ const CT__ti_sysbios_family_arm_ducati_smp_Power_semCore1 ti_sysbios_family_arm_ducati_smp_Power_semCore1__C;
#ifdef ti_sysbios_family_arm_ducati_smp_Power_semCore1__CR
#define ti_sysbios_family_arm_ducati_smp_Power_semCore1 (*((CT__ti_sysbios_family_arm_ducati_smp_Power_semCore1*)(xdcRomConstPtr + ti_sysbios_family_arm_ducati_smp_Power_semCore1__C_offset)))
#else
#define ti_sysbios_family_arm_ducati_smp_Power_semCore1 (ti_sysbios_family_arm_ducati_smp_Power_semCore1__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_arm_ducati_smp_Power_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_arm_ducati_smp_Power_Module__startupDone__S, "ti_sysbios_family_arm_ducati_smp_Power_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_arm_ducati_smp_Power_Module__startupDone__S( void );

/* idleCPU__E */
#define ti_sysbios_family_arm_ducati_smp_Power_idleCPU ti_sysbios_family_arm_ducati_smp_Power_idleCPU__E
xdc__CODESECT(ti_sysbios_family_arm_ducati_smp_Power_idleCPU__E, "ti_sysbios_family_arm_ducati_smp_Power_idleCPU")
__extern xdc_Void ti_sysbios_family_arm_ducati_smp_Power_idleCPU__E( void );

/* suspend__E */
#define ti_sysbios_family_arm_ducati_smp_Power_suspend ti_sysbios_family_arm_ducati_smp_Power_suspend__E
xdc__CODESECT(ti_sysbios_family_arm_ducati_smp_Power_suspend__E, "ti_sysbios_family_arm_ducati_smp_Power_suspend")
__extern xdc_UInt ti_sysbios_family_arm_ducati_smp_Power_suspend__E( ti_sysbios_family_arm_ducati_smp_Power_SuspendArgs *args );

/* taskFxnCore0__I */
#define ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore0 ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore0__I
xdc__CODESECT(ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore0__I, "ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore0")
__extern xdc_Void ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore0__I( xdc_UArg arg1, xdc_UArg arg2 );

/* taskFxnCore1__I */
#define ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore1 ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore1__I
xdc__CODESECT(ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore1__I, "ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore1")
__extern xdc_Void ti_sysbios_family_arm_ducati_smp_Power_taskFxnCore1__I( xdc_UArg arg1, xdc_UArg arg2 );

/* doSuspend__I */
#define ti_sysbios_family_arm_ducati_smp_Power_doSuspend ti_sysbios_family_arm_ducati_smp_Power_doSuspend__I
xdc__CODESECT(ti_sysbios_family_arm_ducati_smp_Power_doSuspend__I, "ti_sysbios_family_arm_ducati_smp_Power_doSuspend")
__extern xdc_UInt ti_sysbios_family_arm_ducati_smp_Power_doSuspend__I( ti_sysbios_family_arm_ducati_smp_Power_SuspendArgs *args );

/* saveCpuRegs__I */
#define ti_sysbios_family_arm_ducati_smp_Power_saveCpuRegs ti_sysbios_family_arm_ducati_smp_Power_saveCpuRegs__I
xdc__CODESECT(ti_sysbios_family_arm_ducati_smp_Power_saveCpuRegs__I, "ti_sysbios_family_arm_ducati_smp_Power_saveCpuRegs")
__extern xdc_UInt32 ti_sysbios_family_arm_ducati_smp_Power_saveCpuRegs__I( xdc_Ptr saveAddress, xdc_Ptr readyFlag );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_arm_ducati_smp_Power_Module_startupDone() ti_sysbios_family_arm_ducati_smp_Power_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_arm_ducati_smp_Power_Object_heap() ti_sysbios_family_arm_ducati_smp_Power_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_arm_ducati_smp_Power_Module_heap() ti_sysbios_family_arm_ducati_smp_Power_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_arm_ducati_smp_Power_Module__id ti_sysbios_family_arm_ducati_smp_Power_Module_id(void);
static inline CT__ti_sysbios_family_arm_ducati_smp_Power_Module__id ti_sysbios_family_arm_ducati_smp_Power_Module_id( void ) 
{
    return ti_sysbios_family_arm_ducati_smp_Power_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_arm_ducati_smp_Power_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_arm_ducati_smp_Power_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_arm_ducati_smp_Power_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_arm_ducati_smp_Power_Module_getMask( void ) 
{
    return ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C != NULL ? *ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_arm_ducati_smp_Power_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_arm_ducati_smp_Power_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_arm_ducati_smp_Power_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_arm_ducati_smp_Power__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_arm_ducati_smp_Power__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_arm_ducati_smp_Power__internalaccess))

#ifndef ti_sysbios_family_arm_ducati_smp_Power__include_state
#define ti_sysbios_family_arm_ducati_smp_Power__include_state

/* Module_State */
struct ti_sysbios_family_arm_ducati_smp_Power_Module_State {
    xdc_UInt dmaChan0;
    xdc_UInt resetFlag0;
    xdc_UInt resetFlag1;
    xdc_UInt intMask31_0;
    xdc_UInt intMask63_32;
    xdc_UInt intMask79_64;
};

/* Module__state__V */
#ifndef ti_sysbios_family_arm_ducati_smp_Power_Module__state__VR
extern struct ti_sysbios_family_arm_ducati_smp_Power_Module_State__ ti_sysbios_family_arm_ducati_smp_Power_Module__state__V;
#else
#define ti_sysbios_family_arm_ducati_smp_Power_Module__state__V (*((struct ti_sysbios_family_arm_ducati_smp_Power_Module_State__*)(xdcRomStatePtr + ti_sysbios_family_arm_ducati_smp_Power_Module__state__V_offset)))
#endif

#endif /* ti_sysbios_family_arm_ducati_smp_Power__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_arm_ducati_smp_Power__nolocalnames)

#ifndef ti_sysbios_family_arm_ducati_smp_Power__localnames__done
#define ti_sysbios_family_arm_ducati_smp_Power__localnames__done

/* module prefix */
#define Power_SuspendFuncHookPtr ti_sysbios_family_arm_ducati_smp_Power_SuspendFuncHookPtr
#define Power_SuspendArgs ti_sysbios_family_arm_ducati_smp_Power_SuspendArgs
#define Power_L2RAM ti_sysbios_family_arm_ducati_smp_Power_L2RAM
#define Power_Struct8 ti_sysbios_family_arm_ducati_smp_Power_Struct8
#define Power_Struct10 ti_sysbios_family_arm_ducati_smp_Power_Struct10
#define Power_TablePIDS ti_sysbios_family_arm_ducati_smp_Power_TablePIDS
#define Power_IPRxRegs ti_sysbios_family_arm_ducati_smp_Power_IPRxRegs
#define Power_CfgRegs ti_sysbios_family_arm_ducati_smp_Power_CfgRegs
#define Power_NVICContext ti_sysbios_family_arm_ducati_smp_Power_NVICContext
#define Power_ContextAMMU ti_sysbios_family_arm_ducati_smp_Power_ContextAMMU
#define Power_ContextCTM ti_sysbios_family_arm_ducati_smp_Power_ContextCTM
#define Power_CpuRegs ti_sysbios_family_arm_ducati_smp_Power_CpuRegs
#define Power_PrivateContext ti_sysbios_family_arm_ducati_smp_Power_PrivateContext
#define Power_UnicacheConfig ti_sysbios_family_arm_ducati_smp_Power_UnicacheConfig
#define Power_SubsystemContext ti_sysbios_family_arm_ducati_smp_Power_SubsystemContext
#define Power_DucatiContext ti_sysbios_family_arm_ducati_smp_Power_DucatiContext
#define Power_SdmaRegs ti_sysbios_family_arm_ducati_smp_Power_SdmaRegs
#define Power_Module_State ti_sysbios_family_arm_ducati_smp_Power_Module_State
#define Power_sdmaRegs ti_sysbios_family_arm_ducati_smp_Power_sdmaRegs
#define Power_idle ti_sysbios_family_arm_ducati_smp_Power_idle
#define Power_preSuspendHooks ti_sysbios_family_arm_ducati_smp_Power_preSuspendHooks
#define Power_postSuspendHooks ti_sysbios_family_arm_ducati_smp_Power_postSuspendHooks
#define Power_enable ti_sysbios_family_arm_ducati_smp_Power_enable
#define Power_gate ti_sysbios_family_arm_ducati_smp_Power_gate
#define Power_taskCore0 ti_sysbios_family_arm_ducati_smp_Power_taskCore0
#define Power_taskCore1 ti_sysbios_family_arm_ducati_smp_Power_taskCore1
#define Power_semCore0 ti_sysbios_family_arm_ducati_smp_Power_semCore0
#define Power_semCore1 ti_sysbios_family_arm_ducati_smp_Power_semCore1
#define Power_idleCPU ti_sysbios_family_arm_ducati_smp_Power_idleCPU
#define Power_suspend ti_sysbios_family_arm_ducati_smp_Power_suspend
#define Power_Module_name ti_sysbios_family_arm_ducati_smp_Power_Module_name
#define Power_Module_id ti_sysbios_family_arm_ducati_smp_Power_Module_id
#define Power_Module_startup ti_sysbios_family_arm_ducati_smp_Power_Module_startup
#define Power_Module_startupDone ti_sysbios_family_arm_ducati_smp_Power_Module_startupDone
#define Power_Module_hasMask ti_sysbios_family_arm_ducati_smp_Power_Module_hasMask
#define Power_Module_getMask ti_sysbios_family_arm_ducati_smp_Power_Module_getMask
#define Power_Module_setMask ti_sysbios_family_arm_ducati_smp_Power_Module_setMask
#define Power_Object_heap ti_sysbios_family_arm_ducati_smp_Power_Object_heap
#define Power_Module_heap ti_sysbios_family_arm_ducati_smp_Power_Module_heap

#endif /* ti_sysbios_family_arm_ducati_smp_Power__localnames__done */
#endif
