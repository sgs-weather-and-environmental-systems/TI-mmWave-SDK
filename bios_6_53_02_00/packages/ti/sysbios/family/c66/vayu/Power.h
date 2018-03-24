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

#ifndef ti_sysbios_family_c66_vayu_Power__include
#define ti_sysbios_family_c66_vayu_Power__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_c66_vayu_Power__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_c66_vayu_Power___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/c66/vayu/package/package.defs.h>

#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* Suspend */
enum ti_sysbios_family_c66_vayu_Power_Suspend {
    ti_sysbios_family_c66_vayu_Power_Suspend_HIBERNATE
};
typedef enum ti_sysbios_family_c66_vayu_Power_Suspend ti_sysbios_family_c66_vayu_Power_Suspend;


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* CpuSysRegs */
struct ti_sysbios_family_c66_vayu_Power_CpuSysRegs {
    xdc_UInt32 AMR;
    xdc_UInt32 CSR;
    xdc_UInt32 IER;
    xdc_UInt32 ISTP;
    xdc_UInt32 IRP;
    xdc_UInt32 ILC;
    xdc_UInt32 RILC;
    xdc_UInt32 REP;
    xdc_UInt32 FADCR;
    xdc_UInt32 FAUCR;
    xdc_UInt32 FMCR;
    xdc_UInt32 SSR;
    xdc_UInt32 GPLYA;
    xdc_UInt32 GPLYB;
    xdc_UInt32 GFPGFR;
    xdc_UInt32 TSR;
    xdc_UInt32 ITSR;
    xdc_UInt32 IERR;
};

/* IntcConfig */
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_IntcConfig__PAMAP;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__PAMAP[16];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__PAMAP[16];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__PAMAP __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__PAMAP;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_IntcConfig__MAR;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__MAR[244];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__MAR[244];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__MAR __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__MAR;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L2MPPA;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L2MPPA[32];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L2MPPA[32];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L2MPPA __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__L2MPPA;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1PMPPA;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1PMPPA[16];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1PMPPA[16];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1PMPPA __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1PMPPA;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1DMPPA;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1DMPPA[16];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1DMPPA[16];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1DMPPA __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1DMPPA;
struct ti_sysbios_family_c66_vayu_Power_IntcConfig {
    xdc_UInt32 EVTMASK0;
    xdc_UInt32 EVTMASK1;
    xdc_UInt32 EVTMASK2;
    xdc_UInt32 EVTMASK3;
    xdc_UInt32 EXPMASK0;
    xdc_UInt32 EXPMASK1;
    xdc_UInt32 EXPMASK2;
    xdc_UInt32 EXPMASK3;
    xdc_UInt32 INTMUX1;
    xdc_UInt32 INTMUX2;
    xdc_UInt32 INTMUX3;
    xdc_UInt32 AEGMUX0;
    xdc_UInt32 AEGMUX1;
    xdc_UInt32 INTDMASK;
    xdc_UInt32 PDCCMD;
    __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__PAMAP PAMAP;
    xdc_UInt32 L2CFG;
    xdc_UInt32 L1PCFG;
    xdc_UInt32 L1PCC;
    xdc_UInt32 L1DCFG;
    xdc_UInt32 L1DCC;
    __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__MAR MAR;
    __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__L2MPPA L2MPPA;
    __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1PMPPA L1PMPPA;
    __TA_ti_sysbios_family_c66_vayu_Power_IntcConfig__L1DMPPA L1DMPPA;
};

/* SystemConfig */
struct ti_sysbios_family_c66_vayu_Power_SystemConfig {
    xdc_UInt32 DSP_SYS_SYSCONFIG;
    xdc_UInt32 BUSCONFIG;
    xdc_UInt32 IRQWAKEEN0;
    xdc_UInt32 IRQWAKEEN1;
    xdc_UInt32 DMAWAKEEN0;
    xdc_UInt32 DMAWAKEEN1;
    xdc_UInt32 EVTOUTSET;
    xdc_UInt32 ERRINTIRQENABLESET;
    xdc_UInt32 EDMAWAKE0IRQENABLESET;
    xdc_UInt32 EDMAWAKE1IRQENABLESET;
};

/* EdmaConfig */
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DCHMAP;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DCHMAP[64];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DCHMAP[64];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DCHMAP __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DCHMAP;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__QCHMAP;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__QCHMAP[8];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__QCHMAP[8];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__QCHMAP __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__QCHMAP;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DMAQNUM;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DMAQNUM[8];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DMAQNUM[8];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DMAQNUM __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DMAQNUM;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__regionAccessBits;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__regionAccessBits[24];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__regionAccessBits[24];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__regionAccessBits __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__regionAccessBits;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__PaRAMs;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__PaRAMs[1024];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__PaRAMs[1024];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_EdmaConfig__PaRAMs __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__PaRAMs;
struct ti_sysbios_family_c66_vayu_Power_EdmaConfig {
    xdc_UInt32 CLKGDIS;
    __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DCHMAP DCHMAP;
    __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__QCHMAP QCHMAP;
    __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__DMAQNUM DMAQNUM;
    xdc_UInt32 QDMAQNUM;
    xdc_UInt32 QUETCMAP;
    xdc_UInt32 QUEPRI;
    __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__regionAccessBits regionAccessBits;
    xdc_UInt32 QWMTHRA;
    xdc_UInt32 AETCTL;
    xdc_UInt32 IER;
    xdc_UInt32 IERH;
    xdc_UInt32 QEER;
    __TA_ti_sysbios_family_c66_vayu_Power_EdmaConfig__PaRAMs PaRAMs;
};

/* CpuRam */
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1PSram;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1PSram[8192];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1PSram[8192];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1PSram __TA_ti_sysbios_family_c66_vayu_Power_CpuRam__L1PSram;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1DSram;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1DSram[8192];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1DSram[8192];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L1DSram __TA_ti_sysbios_family_c66_vayu_Power_CpuRam__L1DSram;
typedef xdc_UInt32 __T1_ti_sysbios_family_c66_vayu_Power_CpuRam__L2Sram;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L2Sram[73728];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L2Sram[73728];
typedef __CARRAY1_ti_sysbios_family_c66_vayu_Power_CpuRam__L2Sram __TA_ti_sysbios_family_c66_vayu_Power_CpuRam__L2Sram;
struct ti_sysbios_family_c66_vayu_Power_CpuRam {
    __TA_ti_sysbios_family_c66_vayu_Power_CpuRam__L1PSram L1PSram;
    __TA_ti_sysbios_family_c66_vayu_Power_CpuRam__L1DSram L1DSram;
    __TA_ti_sysbios_family_c66_vayu_Power_CpuRam__L2Sram L2Sram;
};

/* SubsystemContext */
struct ti_sysbios_family_c66_vayu_Power_SubsystemContext {
    ti_sysbios_family_c66_vayu_Power_CpuSysRegs cpuSysRegs;
    ti_sysbios_family_c66_vayu_Power_IntcConfig configINTC;
    ti_sysbios_family_c66_vayu_Power_SystemConfig configSystem;
    ti_sysbios_family_c66_vayu_Power_EdmaConfig configEDMA;
    ti_sysbios_family_c66_vayu_Power_CpuRam cpuRam;
    xdc_UInt32 taskKey;
    xdc_UInt32 swiKey;
    xdc_UInt32 hwiKey;
    xdc_UInt32 sizeOfL1PSram;
    xdc_UInt32 sizeOfL1DSram;
    xdc_UInt32 sizeOfL2Sram;
    xdc_Bool tscRunning;
};


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled__CR
#define ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled (ti_sysbios_family_c66_vayu_Power_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded__CR
#define ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded (ti_sysbios_family_c66_vayu_Power_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_c66_vayu_Power_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__diagsMask ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__diagsMask__CR
#define ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__diagsMask (ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_c66_vayu_Power_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__gateObj ti_sysbios_family_c66_vayu_Power_Module__gateObj__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__gateObj__CR
#define ti_sysbios_family_c66_vayu_Power_Module__gateObj__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__gateObj (ti_sysbios_family_c66_vayu_Power_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_c66_vayu_Power_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__gatePrms ti_sysbios_family_c66_vayu_Power_Module__gatePrms__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__gatePrms__CR
#define ti_sysbios_family_c66_vayu_Power_Module__gatePrms__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__gatePrms (ti_sysbios_family_c66_vayu_Power_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_c66_vayu_Power_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__id ti_sysbios_family_c66_vayu_Power_Module__id__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__id__CR
#define ti_sysbios_family_c66_vayu_Power_Module__id__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__id*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__id__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__id (ti_sysbios_family_c66_vayu_Power_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_c66_vayu_Power_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__loggerDefined ti_sysbios_family_c66_vayu_Power_Module__loggerDefined__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__loggerDefined__CR
#define ti_sysbios_family_c66_vayu_Power_Module__loggerDefined__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__loggerDefined (ti_sysbios_family_c66_vayu_Power_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_c66_vayu_Power_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__loggerObj ti_sysbios_family_c66_vayu_Power_Module__loggerObj__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__loggerObj__CR
#define ti_sysbios_family_c66_vayu_Power_Module__loggerObj__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__loggerObj (ti_sysbios_family_c66_vayu_Power_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0 ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0__CR
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0 (ti_sysbios_family_c66_vayu_Power_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1 ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1__CR
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1 (ti_sysbios_family_c66_vayu_Power_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2 ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2__CR
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2 (ti_sysbios_family_c66_vayu_Power_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4 ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4__CR
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4 (ti_sysbios_family_c66_vayu_Power_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8 ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8__CR
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8__C (*((CT__ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8 (ti_sysbios_family_c66_vayu_Power_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_c66_vayu_Power_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Object__count ti_sysbios_family_c66_vayu_Power_Object__count__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Object__count__CR
#define ti_sysbios_family_c66_vayu_Power_Object__count__C (*((CT__ti_sysbios_family_c66_vayu_Power_Object__count*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Object__count__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Object__count (ti_sysbios_family_c66_vayu_Power_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_c66_vayu_Power_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Object__heap ti_sysbios_family_c66_vayu_Power_Object__heap__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Object__heap__CR
#define ti_sysbios_family_c66_vayu_Power_Object__heap__C (*((CT__ti_sysbios_family_c66_vayu_Power_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Object__heap__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Object__heap (ti_sysbios_family_c66_vayu_Power_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_c66_vayu_Power_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Object__sizeof ti_sysbios_family_c66_vayu_Power_Object__sizeof__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Object__sizeof__CR
#define ti_sysbios_family_c66_vayu_Power_Object__sizeof__C (*((CT__ti_sysbios_family_c66_vayu_Power_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Object__sizeof (ti_sysbios_family_c66_vayu_Power_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_c66_vayu_Power_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_Object__table ti_sysbios_family_c66_vayu_Power_Object__table__C;
#ifdef ti_sysbios_family_c66_vayu_Power_Object__table__CR
#define ti_sysbios_family_c66_vayu_Power_Object__table__C (*((CT__ti_sysbios_family_c66_vayu_Power_Object__table*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_Object__table__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_Object__table (ti_sysbios_family_c66_vayu_Power_Object__table__C)
#endif

/* tpccRegs */
typedef xdc_Ptr CT__ti_sysbios_family_c66_vayu_Power_tpccRegs;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_tpccRegs ti_sysbios_family_c66_vayu_Power_tpccRegs__C;
#ifdef ti_sysbios_family_c66_vayu_Power_tpccRegs__CR
#define ti_sysbios_family_c66_vayu_Power_tpccRegs (*((CT__ti_sysbios_family_c66_vayu_Power_tpccRegs*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_tpccRegs__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_tpccRegs (ti_sysbios_family_c66_vayu_Power_tpccRegs__C)
#endif

/* systemRegs */
typedef xdc_Ptr CT__ti_sysbios_family_c66_vayu_Power_systemRegs;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_systemRegs ti_sysbios_family_c66_vayu_Power_systemRegs__C;
#ifdef ti_sysbios_family_c66_vayu_Power_systemRegs__CR
#define ti_sysbios_family_c66_vayu_Power_systemRegs (*((CT__ti_sysbios_family_c66_vayu_Power_systemRegs*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_systemRegs__C_offset)))
#else
#define ti_sysbios_family_c66_vayu_Power_systemRegs (ti_sysbios_family_c66_vayu_Power_systemRegs__C)
#endif

/* useStandbyTestFxn */
typedef xdc_Bool CT__ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn;
__extern __FAR__ const CT__ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn__C;
#ifdef ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn__CR
#define ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn (*((CT__ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn*)(xdcRomConstPtr + ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn__C_offset)))
#else
#ifdef ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn__D
#define ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn (ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn__D)
#else
#define ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn (ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn__C)
#endif
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_c66_vayu_Power_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_c66_vayu_Power_Module__startupDone__S, "ti_sysbios_family_c66_vayu_Power_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_c66_vayu_Power_Module__startupDone__S( void );

/* suspend__E */
#define ti_sysbios_family_c66_vayu_Power_suspend ti_sysbios_family_c66_vayu_Power_suspend__E
xdc__CODESECT(ti_sysbios_family_c66_vayu_Power_suspend__E, "ti_sysbios_family_c66_vayu_Power_suspend")
__extern xdc_UInt ti_sysbios_family_c66_vayu_Power_suspend__E( ti_sysbios_family_c66_vayu_Power_Suspend level );

/* resetFxn__I */
#define ti_sysbios_family_c66_vayu_Power_resetFxn ti_sysbios_family_c66_vayu_Power_resetFxn__I
xdc__CODESECT(ti_sysbios_family_c66_vayu_Power_resetFxn__I, "ti_sysbios_family_c66_vayu_Power_resetFxn")
__extern xdc_Void ti_sysbios_family_c66_vayu_Power_resetFxn__I( void );

/* standby__I */
#define ti_sysbios_family_c66_vayu_Power_standby ti_sysbios_family_c66_vayu_Power_standby__I
xdc__CODESECT(ti_sysbios_family_c66_vayu_Power_standby__I, "ti_sysbios_family_c66_vayu_Power_standby")
__extern xdc_UInt ti_sysbios_family_c66_vayu_Power_standby__I( xdc_UInt32 *cpuRegs );

/* standbyTest__I */
#define ti_sysbios_family_c66_vayu_Power_standbyTest ti_sysbios_family_c66_vayu_Power_standbyTest__I
xdc__CODESECT(ti_sysbios_family_c66_vayu_Power_standbyTest__I, "ti_sysbios_family_c66_vayu_Power_standbyTest")
__extern xdc_UInt ti_sysbios_family_c66_vayu_Power_standbyTest__I( xdc_UInt32 *cpuRegs );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_c66_vayu_Power_Module_startupDone() ti_sysbios_family_c66_vayu_Power_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_c66_vayu_Power_Object_heap() ti_sysbios_family_c66_vayu_Power_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_c66_vayu_Power_Module_heap() ti_sysbios_family_c66_vayu_Power_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_c66_vayu_Power_Module__id ti_sysbios_family_c66_vayu_Power_Module_id(void);
static inline CT__ti_sysbios_family_c66_vayu_Power_Module__id ti_sysbios_family_c66_vayu_Power_Module_id( void ) 
{
    return ti_sysbios_family_c66_vayu_Power_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_c66_vayu_Power_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_c66_vayu_Power_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_c66_vayu_Power_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_c66_vayu_Power_Module_getMask( void ) 
{
    return ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C != NULL ? *ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_c66_vayu_Power_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_c66_vayu_Power_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_c66_vayu_Power_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_c66_vayu_Power__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_c66_vayu_Power__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_c66_vayu_Power__internalaccess))

#ifndef ti_sysbios_family_c66_vayu_Power__include_state
#define ti_sysbios_family_c66_vayu_Power__include_state


#endif /* ti_sysbios_family_c66_vayu_Power__include_state */

#endif

/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_c66_vayu_Power__nolocalnames)

#ifndef ti_sysbios_family_c66_vayu_Power__localnames__done
#define ti_sysbios_family_c66_vayu_Power__localnames__done

/* module prefix */
#define Power_Suspend ti_sysbios_family_c66_vayu_Power_Suspend
#define Power_CpuSysRegs ti_sysbios_family_c66_vayu_Power_CpuSysRegs
#define Power_IntcConfig ti_sysbios_family_c66_vayu_Power_IntcConfig
#define Power_SystemConfig ti_sysbios_family_c66_vayu_Power_SystemConfig
#define Power_EdmaConfig ti_sysbios_family_c66_vayu_Power_EdmaConfig
#define Power_CpuRam ti_sysbios_family_c66_vayu_Power_CpuRam
#define Power_SubsystemContext ti_sysbios_family_c66_vayu_Power_SubsystemContext
#define Power_Suspend_HIBERNATE ti_sysbios_family_c66_vayu_Power_Suspend_HIBERNATE
#define Power_tpccRegs ti_sysbios_family_c66_vayu_Power_tpccRegs
#define Power_systemRegs ti_sysbios_family_c66_vayu_Power_systemRegs
#define Power_useStandbyTestFxn ti_sysbios_family_c66_vayu_Power_useStandbyTestFxn
#define Power_suspend ti_sysbios_family_c66_vayu_Power_suspend
#define Power_Module_name ti_sysbios_family_c66_vayu_Power_Module_name
#define Power_Module_id ti_sysbios_family_c66_vayu_Power_Module_id
#define Power_Module_startup ti_sysbios_family_c66_vayu_Power_Module_startup
#define Power_Module_startupDone ti_sysbios_family_c66_vayu_Power_Module_startupDone
#define Power_Module_hasMask ti_sysbios_family_c66_vayu_Power_Module_hasMask
#define Power_Module_getMask ti_sysbios_family_c66_vayu_Power_Module_getMask
#define Power_Module_setMask ti_sysbios_family_c66_vayu_Power_Module_setMask
#define Power_Object_heap ti_sysbios_family_c66_vayu_Power_Object_heap
#define Power_Module_heap ti_sysbios_family_c66_vayu_Power_Module_heap

#endif /* ti_sysbios_family_c66_vayu_Power__localnames__done */
#endif
