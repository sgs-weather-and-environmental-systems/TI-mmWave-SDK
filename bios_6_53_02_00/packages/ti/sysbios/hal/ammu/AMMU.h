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

#ifndef ti_sysbios_hal_ammu_AMMU__include
#define ti_sysbios_hal_ammu_AMMU__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_hal_ammu_AMMU__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_hal_ammu_AMMU___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/hal/ammu/package/package.defs.h>

#include <xdc/runtime/IModule.h>
#include <xdc/runtime/Types.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* MMU */
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_ADDR;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_ADDR[8];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_ADDR[8];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_ADDR __TA_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_ADDR;
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_XLTE;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_XLTE[8];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_XLTE[8];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_XLTE __TA_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_XLTE;
typedef xdc_UInt32 __T1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_POLICY;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_POLICY[8];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_POLICY[8];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_POLICY __TA_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_POLICY;
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_ADDR;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_ADDR[16];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_ADDR[16];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_ADDR __TA_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_ADDR;
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_XLTE;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_XLTE[16];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_XLTE[16];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_XLTE __TA_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_XLTE;
typedef xdc_UInt32 __T1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_POLICY;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_POLICY[16];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_POLICY[16];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_POLICY __TA_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_POLICY;
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_ADDR;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_ADDR[32];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_ADDR[32];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_ADDR __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_ADDR;
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_XLTE;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_XLTE[32];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_XLTE[32];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_XLTE __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_XLTE;
typedef xdc_UInt32 __T1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_POLICY;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_POLICY[32];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_POLICY[32];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_POLICY __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_POLICY;
typedef xdc_UInt32 __T1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_MAINT;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_MAINT[32];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_MAINT[32];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_MAINT __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_MAINT;
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_ADDR;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_ADDR[32];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_ADDR[32];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_ADDR __TA_ti_sysbios_hal_ammu_AMMU_MMU__LINE_ADDR;
typedef xdc_Char *__T1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_XLTE;
typedef xdc_Char *__ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_XLTE[32];
typedef xdc_Char *__CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_XLTE[32];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_XLTE __TA_ti_sysbios_hal_ammu_AMMU_MMU__LINE_XLTE;
typedef xdc_UInt32 __T1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_POLICY;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_POLICY[32];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_POLICY[32];
typedef __CARRAY1_ti_sysbios_hal_ammu_AMMU_MMU__LINE_POLICY __TA_ti_sysbios_hal_ammu_AMMU_MMU__LINE_POLICY;
struct ti_sysbios_hal_ammu_AMMU_MMU {
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_ADDR LARGE_ADDR;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_XLTE LARGE_XLTE;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__LARGE_POLICY LARGE_POLICY;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_ADDR MEDIUM_ADDR;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_XLTE MEDIUM_XLTE;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__MEDIUM_POLICY MEDIUM_POLICY;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_ADDR SMALL_ADDR;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_XLTE SMALL_XLTE;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_POLICY SMALL_POLICY;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__SMALL_MAINT SMALL_MAINT;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__LINE_ADDR LINE_ADDR;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__LINE_XLTE LINE_XLTE;
    __TA_ti_sysbios_hal_ammu_AMMU_MMU__LINE_POLICY LINE_POLICY;
    xdc_Char *DEBUG_XLTE;
    xdc_UInt32 DEBUG_POLICY;
    xdc_UInt32 MAINT;
    xdc_Char *MSTART;
    xdc_Char *MEND;
    xdc_UInt32 MSTAT;
};

/* mmu */
__extern volatile ti_sysbios_hal_ammu_AMMU_MMU ti_sysbios_hal_ammu_AMMU_mmu;


/*
 * ======== INTERNAL DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled__CR
#define ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled (ti_sysbios_hal_ammu_AMMU_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded__CR
#define ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded (ti_sysbios_hal_ammu_AMMU_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_hal_ammu_AMMU_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__diagsMask ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__diagsMask__CR
#define ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__diagsMask (ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_hal_ammu_AMMU_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__gateObj ti_sysbios_hal_ammu_AMMU_Module__gateObj__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__gateObj__CR
#define ti_sysbios_hal_ammu_AMMU_Module__gateObj__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__gateObj__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__gateObj (ti_sysbios_hal_ammu_AMMU_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_hal_ammu_AMMU_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__gatePrms ti_sysbios_hal_ammu_AMMU_Module__gatePrms__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__gatePrms__CR
#define ti_sysbios_hal_ammu_AMMU_Module__gatePrms__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__gatePrms (ti_sysbios_hal_ammu_AMMU_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_hal_ammu_AMMU_Module__id;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__id ti_sysbios_hal_ammu_AMMU_Module__id__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__id__CR
#define ti_sysbios_hal_ammu_AMMU_Module__id__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__id*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__id__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__id (ti_sysbios_hal_ammu_AMMU_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_hal_ammu_AMMU_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__loggerDefined ti_sysbios_hal_ammu_AMMU_Module__loggerDefined__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__loggerDefined__CR
#define ti_sysbios_hal_ammu_AMMU_Module__loggerDefined__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__loggerDefined (ti_sysbios_hal_ammu_AMMU_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_hal_ammu_AMMU_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__loggerObj ti_sysbios_hal_ammu_AMMU_Module__loggerObj__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__loggerObj__CR
#define ti_sysbios_hal_ammu_AMMU_Module__loggerObj__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__loggerObj (ti_sysbios_hal_ammu_AMMU_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0 ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0__CR
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0 (ti_sysbios_hal_ammu_AMMU_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1 ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1__CR
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1 (ti_sysbios_hal_ammu_AMMU_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2 ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2__CR
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2 (ti_sysbios_hal_ammu_AMMU_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4 ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4__CR
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4 (ti_sysbios_hal_ammu_AMMU_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8 ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8__CR
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8__C (*((CT__ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8 (ti_sysbios_hal_ammu_AMMU_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_hal_ammu_AMMU_Object__count;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Object__count ti_sysbios_hal_ammu_AMMU_Object__count__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Object__count__CR
#define ti_sysbios_hal_ammu_AMMU_Object__count__C (*((CT__ti_sysbios_hal_ammu_AMMU_Object__count*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Object__count__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Object__count (ti_sysbios_hal_ammu_AMMU_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_hal_ammu_AMMU_Object__heap;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Object__heap ti_sysbios_hal_ammu_AMMU_Object__heap__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Object__heap__CR
#define ti_sysbios_hal_ammu_AMMU_Object__heap__C (*((CT__ti_sysbios_hal_ammu_AMMU_Object__heap*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Object__heap__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Object__heap (ti_sysbios_hal_ammu_AMMU_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_hal_ammu_AMMU_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Object__sizeof ti_sysbios_hal_ammu_AMMU_Object__sizeof__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Object__sizeof__CR
#define ti_sysbios_hal_ammu_AMMU_Object__sizeof__C (*((CT__ti_sysbios_hal_ammu_AMMU_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Object__sizeof__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Object__sizeof (ti_sysbios_hal_ammu_AMMU_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_hal_ammu_AMMU_Object__table;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_Object__table ti_sysbios_hal_ammu_AMMU_Object__table__C;
#ifdef ti_sysbios_hal_ammu_AMMU_Object__table__CR
#define ti_sysbios_hal_ammu_AMMU_Object__table__C (*((CT__ti_sysbios_hal_ammu_AMMU_Object__table*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_Object__table__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_Object__table (ti_sysbios_hal_ammu_AMMU_Object__table__C)
#endif

/* configureAmmu */
typedef xdc_Bool CT__ti_sysbios_hal_ammu_AMMU_configureAmmu;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_configureAmmu ti_sysbios_hal_ammu_AMMU_configureAmmu__C;
#ifdef ti_sysbios_hal_ammu_AMMU_configureAmmu__CR
#define ti_sysbios_hal_ammu_AMMU_configureAmmu (*((CT__ti_sysbios_hal_ammu_AMMU_configureAmmu*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_configureAmmu__C_offset)))
#else
#ifdef ti_sysbios_hal_ammu_AMMU_configureAmmu__D
#define ti_sysbios_hal_ammu_AMMU_configureAmmu (ti_sysbios_hal_ammu_AMMU_configureAmmu__D)
#else
#define ti_sysbios_hal_ammu_AMMU_configureAmmu (ti_sysbios_hal_ammu_AMMU_configureAmmu__C)
#endif
#endif

/* numLargePages */
typedef xdc_UInt CT__ti_sysbios_hal_ammu_AMMU_numLargePages;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_numLargePages ti_sysbios_hal_ammu_AMMU_numLargePages__C;
#ifdef ti_sysbios_hal_ammu_AMMU_numLargePages__CR
#define ti_sysbios_hal_ammu_AMMU_numLargePages (*((CT__ti_sysbios_hal_ammu_AMMU_numLargePages*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_numLargePages__C_offset)))
#else
#ifdef ti_sysbios_hal_ammu_AMMU_numLargePages__D
#define ti_sysbios_hal_ammu_AMMU_numLargePages (ti_sysbios_hal_ammu_AMMU_numLargePages__D)
#else
#define ti_sysbios_hal_ammu_AMMU_numLargePages (ti_sysbios_hal_ammu_AMMU_numLargePages__C)
#endif
#endif

/* numMediumPages */
typedef xdc_UInt CT__ti_sysbios_hal_ammu_AMMU_numMediumPages;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_numMediumPages ti_sysbios_hal_ammu_AMMU_numMediumPages__C;
#ifdef ti_sysbios_hal_ammu_AMMU_numMediumPages__CR
#define ti_sysbios_hal_ammu_AMMU_numMediumPages (*((CT__ti_sysbios_hal_ammu_AMMU_numMediumPages*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_numMediumPages__C_offset)))
#else
#ifdef ti_sysbios_hal_ammu_AMMU_numMediumPages__D
#define ti_sysbios_hal_ammu_AMMU_numMediumPages (ti_sysbios_hal_ammu_AMMU_numMediumPages__D)
#else
#define ti_sysbios_hal_ammu_AMMU_numMediumPages (ti_sysbios_hal_ammu_AMMU_numMediumPages__C)
#endif
#endif

/* numSmallPages */
typedef xdc_UInt CT__ti_sysbios_hal_ammu_AMMU_numSmallPages;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_numSmallPages ti_sysbios_hal_ammu_AMMU_numSmallPages__C;
#ifdef ti_sysbios_hal_ammu_AMMU_numSmallPages__CR
#define ti_sysbios_hal_ammu_AMMU_numSmallPages (*((CT__ti_sysbios_hal_ammu_AMMU_numSmallPages*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_numSmallPages__C_offset)))
#else
#ifdef ti_sysbios_hal_ammu_AMMU_numSmallPages__D
#define ti_sysbios_hal_ammu_AMMU_numSmallPages (ti_sysbios_hal_ammu_AMMU_numSmallPages__D)
#else
#define ti_sysbios_hal_ammu_AMMU_numSmallPages (ti_sysbios_hal_ammu_AMMU_numSmallPages__C)
#endif
#endif

/* numLinePages */
typedef xdc_UInt CT__ti_sysbios_hal_ammu_AMMU_numLinePages;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_numLinePages ti_sysbios_hal_ammu_AMMU_numLinePages__C;
#ifdef ti_sysbios_hal_ammu_AMMU_numLinePages__CR
#define ti_sysbios_hal_ammu_AMMU_numLinePages (*((CT__ti_sysbios_hal_ammu_AMMU_numLinePages*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_numLinePages__C_offset)))
#else
#ifdef ti_sysbios_hal_ammu_AMMU_numLinePages__D
#define ti_sysbios_hal_ammu_AMMU_numLinePages (ti_sysbios_hal_ammu_AMMU_numLinePages__D)
#else
#define ti_sysbios_hal_ammu_AMMU_numLinePages (ti_sysbios_hal_ammu_AMMU_numLinePages__C)
#endif
#endif

/* mmuInitConfig */
typedef ti_sysbios_hal_ammu_AMMU_MMU CT__ti_sysbios_hal_ammu_AMMU_mmuInitConfig;
__extern __FAR__ const CT__ti_sysbios_hal_ammu_AMMU_mmuInitConfig ti_sysbios_hal_ammu_AMMU_mmuInitConfig__C;
#ifdef ti_sysbios_hal_ammu_AMMU_mmuInitConfig__CR
#define ti_sysbios_hal_ammu_AMMU_mmuInitConfig (*((CT__ti_sysbios_hal_ammu_AMMU_mmuInitConfig*)(xdcRomConstPtr + ti_sysbios_hal_ammu_AMMU_mmuInitConfig__C_offset)))
#else
#define ti_sysbios_hal_ammu_AMMU_mmuInitConfig (ti_sysbios_hal_ammu_AMMU_mmuInitConfig__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_hal_ammu_AMMU_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_hal_ammu_AMMU_Module__startupDone__S, "ti_sysbios_hal_ammu_AMMU_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_hal_ammu_AMMU_Module__startupDone__S( void );

/* invAll__E */
#define ti_sysbios_hal_ammu_AMMU_invAll ti_sysbios_hal_ammu_AMMU_invAll__E
xdc__CODESECT(ti_sysbios_hal_ammu_AMMU_invAll__E, "ti_sysbios_hal_ammu_AMMU_invAll")
__extern xdc_Void ti_sysbios_hal_ammu_AMMU_invAll__E( void );

/* dumpAmmu__E */
#define ti_sysbios_hal_ammu_AMMU_dumpAmmu ti_sysbios_hal_ammu_AMMU_dumpAmmu__E
xdc__CODESECT(ti_sysbios_hal_ammu_AMMU_dumpAmmu__E, "ti_sysbios_hal_ammu_AMMU_dumpAmmu")
__extern xdc_Void ti_sysbios_hal_ammu_AMMU_dumpAmmu__E( void );

/* init__E */
#define ti_sysbios_hal_ammu_AMMU_init ti_sysbios_hal_ammu_AMMU_init__E
xdc__CODESECT(ti_sysbios_hal_ammu_AMMU_init__E, "ti_sysbios_hal_ammu_AMMU_init")
__extern xdc_Void ti_sysbios_hal_ammu_AMMU_init__E( void );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_hal_ammu_AMMU_Module_startupDone() ti_sysbios_hal_ammu_AMMU_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_hal_ammu_AMMU_Object_heap() ti_sysbios_hal_ammu_AMMU_Object__heap__C

/* Module_heap */
#define ti_sysbios_hal_ammu_AMMU_Module_heap() ti_sysbios_hal_ammu_AMMU_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_hal_ammu_AMMU_Module__id ti_sysbios_hal_ammu_AMMU_Module_id(void);
static inline CT__ti_sysbios_hal_ammu_AMMU_Module__id ti_sysbios_hal_ammu_AMMU_Module_id( void ) 
{
    return ti_sysbios_hal_ammu_AMMU_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_hal_ammu_AMMU_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_hal_ammu_AMMU_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_hal_ammu_AMMU_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_hal_ammu_AMMU_Module_getMask( void ) 
{
    return ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C != NULL ? *ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_hal_ammu_AMMU_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_hal_ammu_AMMU_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C != NULL) {
        *ti_sysbios_hal_ammu_AMMU_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_hal_ammu_AMMU__top__
#undef __nested__
#endif

#endif /* ti_sysbios_hal_ammu_AMMU__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_hal_ammu_AMMU__internalaccess))

#ifndef ti_sysbios_hal_ammu_AMMU__include_state
#define ti_sysbios_hal_ammu_AMMU__include_state


#endif /* ti_sysbios_hal_ammu_AMMU__include_state */

#endif

/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_hal_ammu_AMMU__nolocalnames)

#ifndef ti_sysbios_hal_ammu_AMMU__localnames__done
#define ti_sysbios_hal_ammu_AMMU__localnames__done

/* module prefix */
#define AMMU_MMU ti_sysbios_hal_ammu_AMMU_MMU
#define AMMU_mmu ti_sysbios_hal_ammu_AMMU_mmu
#define AMMU_configureAmmu ti_sysbios_hal_ammu_AMMU_configureAmmu
#define AMMU_numLargePages ti_sysbios_hal_ammu_AMMU_numLargePages
#define AMMU_numMediumPages ti_sysbios_hal_ammu_AMMU_numMediumPages
#define AMMU_numSmallPages ti_sysbios_hal_ammu_AMMU_numSmallPages
#define AMMU_numLinePages ti_sysbios_hal_ammu_AMMU_numLinePages
#define AMMU_mmuInitConfig ti_sysbios_hal_ammu_AMMU_mmuInitConfig
#define AMMU_invAll ti_sysbios_hal_ammu_AMMU_invAll
#define AMMU_dumpAmmu ti_sysbios_hal_ammu_AMMU_dumpAmmu
#define AMMU_init ti_sysbios_hal_ammu_AMMU_init
#define AMMU_Module_name ti_sysbios_hal_ammu_AMMU_Module_name
#define AMMU_Module_id ti_sysbios_hal_ammu_AMMU_Module_id
#define AMMU_Module_startup ti_sysbios_hal_ammu_AMMU_Module_startup
#define AMMU_Module_startupDone ti_sysbios_hal_ammu_AMMU_Module_startupDone
#define AMMU_Module_hasMask ti_sysbios_hal_ammu_AMMU_Module_hasMask
#define AMMU_Module_getMask ti_sysbios_hal_ammu_AMMU_Module_getMask
#define AMMU_Module_setMask ti_sysbios_hal_ammu_AMMU_Module_setMask
#define AMMU_Object_heap ti_sysbios_hal_ammu_AMMU_Object_heap
#define AMMU_Module_heap ti_sysbios_hal_ammu_AMMU_Module_heap

#endif /* ti_sysbios_hal_ammu_AMMU__localnames__done */
#endif
