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

#ifndef ti_sysbios_family_c64p_Cache__include
#define ti_sysbios_family_c64p_Cache__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_c64p_Cache__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_c64p_Cache___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/c64p/package/package.defs.h>

#include <xdc/runtime/Error.h>
#include <ti/sysbios/interfaces/ICache.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* Type */
typedef ti_sysbios_interfaces_ICache_Type ti_sysbios_family_c64p_Cache_Type;

/* Mode */
enum ti_sysbios_family_c64p_Cache_Mode {
    ti_sysbios_family_c64p_Cache_Mode_FREEZE,
    ti_sysbios_family_c64p_Cache_Mode_BYPASS,
    ti_sysbios_family_c64p_Cache_Mode_NORMAL
};
typedef enum ti_sysbios_family_c64p_Cache_Mode ti_sysbios_family_c64p_Cache_Mode;

/* L1Size */
enum ti_sysbios_family_c64p_Cache_L1Size {
    ti_sysbios_family_c64p_Cache_L1Size_0K = 0,
    ti_sysbios_family_c64p_Cache_L1Size_4K = 1,
    ti_sysbios_family_c64p_Cache_L1Size_8K = 2,
    ti_sysbios_family_c64p_Cache_L1Size_16K = 3,
    ti_sysbios_family_c64p_Cache_L1Size_32K = 4
};
typedef enum ti_sysbios_family_c64p_Cache_L1Size ti_sysbios_family_c64p_Cache_L1Size;

/* L2Size */
enum ti_sysbios_family_c64p_Cache_L2Size {
    ti_sysbios_family_c64p_Cache_L2Size_0K = 0,
    ti_sysbios_family_c64p_Cache_L2Size_32K = 1,
    ti_sysbios_family_c64p_Cache_L2Size_64K = 2,
    ti_sysbios_family_c64p_Cache_L2Size_128K = 3,
    ti_sysbios_family_c64p_Cache_L2Size_256K = 4,
    ti_sysbios_family_c64p_Cache_L2Size_512K = 5,
    ti_sysbios_family_c64p_Cache_L2Size_1024K = 6
};
typedef enum ti_sysbios_family_c64p_Cache_L2Size ti_sysbios_family_c64p_Cache_L2Size;

/* Mar */
enum ti_sysbios_family_c64p_Cache_Mar {
    ti_sysbios_family_c64p_Cache_Mar_DISABLE = 0,
    ti_sysbios_family_c64p_Cache_Mar_ENABLE = 1
};
typedef enum ti_sysbios_family_c64p_Cache_Mar ti_sysbios_family_c64p_Cache_Mar;

/* Size */
struct ti_sysbios_family_c64p_Cache_Size {
    ti_sysbios_family_c64p_Cache_L1Size l1pSize;
    ti_sysbios_family_c64p_Cache_L1Size l1dSize;
    ti_sysbios_family_c64p_Cache_L2Size l2Size;
};

/* Type_L1P */
#define ti_sysbios_family_c64p_Cache_Type_L1P ti_sysbios_interfaces_ICache_Type_L1P

/* Type_L1D */
#define ti_sysbios_family_c64p_Cache_Type_L1D ti_sysbios_interfaces_ICache_Type_L1D

/* Type_L1 */
#define ti_sysbios_family_c64p_Cache_Type_L1 ti_sysbios_interfaces_ICache_Type_L1

/* Type_L2P */
#define ti_sysbios_family_c64p_Cache_Type_L2P ti_sysbios_interfaces_ICache_Type_L2P

/* Type_L2D */
#define ti_sysbios_family_c64p_Cache_Type_L2D ti_sysbios_interfaces_ICache_Type_L2D

/* Type_L2 */
#define ti_sysbios_family_c64p_Cache_Type_L2 ti_sysbios_interfaces_ICache_Type_L2

/* Type_ALLP */
#define ti_sysbios_family_c64p_Cache_Type_ALLP ti_sysbios_interfaces_ICache_Type_ALLP

/* Type_ALLD */
#define ti_sysbios_family_c64p_Cache_Type_ALLD ti_sysbios_interfaces_ICache_Type_ALLD

/* Type_ALL */
#define ti_sysbios_family_c64p_Cache_Type_ALL ti_sysbios_interfaces_ICache_Type_ALL


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* L2CFG */
#define ti_sysbios_family_c64p_Cache_L2CFG (0x01840000)

/* L1PCFG */
#define ti_sysbios_family_c64p_Cache_L1PCFG (0x01840020)

/* L1PCC */
#define ti_sysbios_family_c64p_Cache_L1PCC (0x01840024)

/* L1DCFG */
#define ti_sysbios_family_c64p_Cache_L1DCFG (0x01840040)

/* L1DCC */
#define ti_sysbios_family_c64p_Cache_L1DCC (0x01840044)

/* MAR */
#define ti_sysbios_family_c64p_Cache_MAR (0x01848000)


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_c64p_Cache_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__diagsEnabled ti_sysbios_family_c64p_Cache_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__diagsEnabled__CR
#define ti_sysbios_family_c64p_Cache_Module__diagsEnabled__C (*((CT__ti_sysbios_family_c64p_Cache_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__diagsEnabled (ti_sysbios_family_c64p_Cache_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_c64p_Cache_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__diagsIncluded ti_sysbios_family_c64p_Cache_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__diagsIncluded__CR
#define ti_sysbios_family_c64p_Cache_Module__diagsIncluded__C (*((CT__ti_sysbios_family_c64p_Cache_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__diagsIncluded (ti_sysbios_family_c64p_Cache_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_c64p_Cache_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__diagsMask ti_sysbios_family_c64p_Cache_Module__diagsMask__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__diagsMask__CR
#define ti_sysbios_family_c64p_Cache_Module__diagsMask__C (*((CT__ti_sysbios_family_c64p_Cache_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__diagsMask (ti_sysbios_family_c64p_Cache_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_Cache_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__gateObj ti_sysbios_family_c64p_Cache_Module__gateObj__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__gateObj__CR
#define ti_sysbios_family_c64p_Cache_Module__gateObj__C (*((CT__ti_sysbios_family_c64p_Cache_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__gateObj (ti_sysbios_family_c64p_Cache_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_Cache_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__gatePrms ti_sysbios_family_c64p_Cache_Module__gatePrms__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__gatePrms__CR
#define ti_sysbios_family_c64p_Cache_Module__gatePrms__C (*((CT__ti_sysbios_family_c64p_Cache_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__gatePrms (ti_sysbios_family_c64p_Cache_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_c64p_Cache_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__id ti_sysbios_family_c64p_Cache_Module__id__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__id__CR
#define ti_sysbios_family_c64p_Cache_Module__id__C (*((CT__ti_sysbios_family_c64p_Cache_Module__id*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__id__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__id (ti_sysbios_family_c64p_Cache_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_c64p_Cache_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__loggerDefined ti_sysbios_family_c64p_Cache_Module__loggerDefined__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__loggerDefined__CR
#define ti_sysbios_family_c64p_Cache_Module__loggerDefined__C (*((CT__ti_sysbios_family_c64p_Cache_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__loggerDefined (ti_sysbios_family_c64p_Cache_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_Cache_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__loggerObj ti_sysbios_family_c64p_Cache_Module__loggerObj__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__loggerObj__CR
#define ti_sysbios_family_c64p_Cache_Module__loggerObj__C (*((CT__ti_sysbios_family_c64p_Cache_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__loggerObj (ti_sysbios_family_c64p_Cache_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn0 ti_sysbios_family_c64p_Cache_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__loggerFxn0__CR
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn0__C (*((CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn0 (ti_sysbios_family_c64p_Cache_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn1 ti_sysbios_family_c64p_Cache_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__loggerFxn1__CR
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn1__C (*((CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn1 (ti_sysbios_family_c64p_Cache_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn2 ti_sysbios_family_c64p_Cache_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__loggerFxn2__CR
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn2__C (*((CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn2 (ti_sysbios_family_c64p_Cache_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn4 ti_sysbios_family_c64p_Cache_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__loggerFxn4__CR
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn4__C (*((CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn4 (ti_sysbios_family_c64p_Cache_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn8 ti_sysbios_family_c64p_Cache_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_c64p_Cache_Module__loggerFxn8__CR
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn8__C (*((CT__ti_sysbios_family_c64p_Cache_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Module__loggerFxn8 (ti_sysbios_family_c64p_Cache_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_c64p_Cache_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Object__count ti_sysbios_family_c64p_Cache_Object__count__C;
#ifdef ti_sysbios_family_c64p_Cache_Object__count__CR
#define ti_sysbios_family_c64p_Cache_Object__count__C (*((CT__ti_sysbios_family_c64p_Cache_Object__count*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Object__count__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Object__count (ti_sysbios_family_c64p_Cache_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_c64p_Cache_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Object__heap ti_sysbios_family_c64p_Cache_Object__heap__C;
#ifdef ti_sysbios_family_c64p_Cache_Object__heap__CR
#define ti_sysbios_family_c64p_Cache_Object__heap__C (*((CT__ti_sysbios_family_c64p_Cache_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Object__heap__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Object__heap (ti_sysbios_family_c64p_Cache_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_c64p_Cache_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Object__sizeof ti_sysbios_family_c64p_Cache_Object__sizeof__C;
#ifdef ti_sysbios_family_c64p_Cache_Object__sizeof__CR
#define ti_sysbios_family_c64p_Cache_Object__sizeof__C (*((CT__ti_sysbios_family_c64p_Cache_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Object__sizeof (ti_sysbios_family_c64p_Cache_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_c64p_Cache_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_Object__table ti_sysbios_family_c64p_Cache_Object__table__C;
#ifdef ti_sysbios_family_c64p_Cache_Object__table__CR
#define ti_sysbios_family_c64p_Cache_Object__table__C (*((CT__ti_sysbios_family_c64p_Cache_Object__table*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Object__table__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_Object__table (ti_sysbios_family_c64p_Cache_Object__table__C)
#endif

/* initSize */
typedef ti_sysbios_family_c64p_Cache_Size CT__ti_sysbios_family_c64p_Cache_initSize;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_initSize ti_sysbios_family_c64p_Cache_initSize__C;
#ifdef ti_sysbios_family_c64p_Cache_initSize__CR
#define ti_sysbios_family_c64p_Cache_initSize (*((CT__ti_sysbios_family_c64p_Cache_initSize*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_initSize__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_initSize (ti_sysbios_family_c64p_Cache_initSize__C)
#endif

/* EMIFA_CFG */
typedef xdc_UInt *CT__ti_sysbios_family_c64p_Cache_EMIFA_CFG;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFA_CFG ti_sysbios_family_c64p_Cache_EMIFA_CFG__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFA_CFG__CR
#define ti_sysbios_family_c64p_Cache_EMIFA_CFG (*((CT__ti_sysbios_family_c64p_Cache_EMIFA_CFG*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFA_CFG__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_EMIFA_CFG (ti_sysbios_family_c64p_Cache_EMIFA_CFG__C)
#endif

/* EMIFA_BASE */
typedef xdc_UInt CT__ti_sysbios_family_c64p_Cache_EMIFA_BASE;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFA_BASE ti_sysbios_family_c64p_Cache_EMIFA_BASE__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFA_BASE__CR
#define ti_sysbios_family_c64p_Cache_EMIFA_BASE (*((CT__ti_sysbios_family_c64p_Cache_EMIFA_BASE*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFA_BASE__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_EMIFA_BASE__D
#define ti_sysbios_family_c64p_Cache_EMIFA_BASE (ti_sysbios_family_c64p_Cache_EMIFA_BASE__D)
#else
#define ti_sysbios_family_c64p_Cache_EMIFA_BASE (ti_sysbios_family_c64p_Cache_EMIFA_BASE__C)
#endif
#endif

/* EMIFA_LENGTH */
typedef xdc_UInt CT__ti_sysbios_family_c64p_Cache_EMIFA_LENGTH;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFA_LENGTH ti_sysbios_family_c64p_Cache_EMIFA_LENGTH__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFA_LENGTH__CR
#define ti_sysbios_family_c64p_Cache_EMIFA_LENGTH (*((CT__ti_sysbios_family_c64p_Cache_EMIFA_LENGTH*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFA_LENGTH__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_EMIFA_LENGTH__D
#define ti_sysbios_family_c64p_Cache_EMIFA_LENGTH (ti_sysbios_family_c64p_Cache_EMIFA_LENGTH__D)
#else
#define ti_sysbios_family_c64p_Cache_EMIFA_LENGTH (ti_sysbios_family_c64p_Cache_EMIFA_LENGTH__C)
#endif
#endif

/* EMIFB_CFG */
typedef xdc_UInt *CT__ti_sysbios_family_c64p_Cache_EMIFB_CFG;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFB_CFG ti_sysbios_family_c64p_Cache_EMIFB_CFG__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFB_CFG__CR
#define ti_sysbios_family_c64p_Cache_EMIFB_CFG (*((CT__ti_sysbios_family_c64p_Cache_EMIFB_CFG*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFB_CFG__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_EMIFB_CFG (ti_sysbios_family_c64p_Cache_EMIFB_CFG__C)
#endif

/* EMIFB_BASE */
typedef xdc_UInt CT__ti_sysbios_family_c64p_Cache_EMIFB_BASE;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFB_BASE ti_sysbios_family_c64p_Cache_EMIFB_BASE__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFB_BASE__CR
#define ti_sysbios_family_c64p_Cache_EMIFB_BASE (*((CT__ti_sysbios_family_c64p_Cache_EMIFB_BASE*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFB_BASE__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_EMIFB_BASE__D
#define ti_sysbios_family_c64p_Cache_EMIFB_BASE (ti_sysbios_family_c64p_Cache_EMIFB_BASE__D)
#else
#define ti_sysbios_family_c64p_Cache_EMIFB_BASE (ti_sysbios_family_c64p_Cache_EMIFB_BASE__C)
#endif
#endif

/* EMIFB_LENGTH */
typedef xdc_UInt CT__ti_sysbios_family_c64p_Cache_EMIFB_LENGTH;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFB_LENGTH ti_sysbios_family_c64p_Cache_EMIFB_LENGTH__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFB_LENGTH__CR
#define ti_sysbios_family_c64p_Cache_EMIFB_LENGTH (*((CT__ti_sysbios_family_c64p_Cache_EMIFB_LENGTH*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFB_LENGTH__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_EMIFB_LENGTH__D
#define ti_sysbios_family_c64p_Cache_EMIFB_LENGTH (ti_sysbios_family_c64p_Cache_EMIFB_LENGTH__D)
#else
#define ti_sysbios_family_c64p_Cache_EMIFB_LENGTH (ti_sysbios_family_c64p_Cache_EMIFB_LENGTH__C)
#endif
#endif

/* EMIFC_CFG */
typedef xdc_UInt *CT__ti_sysbios_family_c64p_Cache_EMIFC_CFG;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFC_CFG ti_sysbios_family_c64p_Cache_EMIFC_CFG__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFC_CFG__CR
#define ti_sysbios_family_c64p_Cache_EMIFC_CFG (*((CT__ti_sysbios_family_c64p_Cache_EMIFC_CFG*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFC_CFG__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_EMIFC_CFG (ti_sysbios_family_c64p_Cache_EMIFC_CFG__C)
#endif

/* EMIFC_BASE */
typedef xdc_UInt CT__ti_sysbios_family_c64p_Cache_EMIFC_BASE;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFC_BASE ti_sysbios_family_c64p_Cache_EMIFC_BASE__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFC_BASE__CR
#define ti_sysbios_family_c64p_Cache_EMIFC_BASE (*((CT__ti_sysbios_family_c64p_Cache_EMIFC_BASE*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFC_BASE__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_EMIFC_BASE__D
#define ti_sysbios_family_c64p_Cache_EMIFC_BASE (ti_sysbios_family_c64p_Cache_EMIFC_BASE__D)
#else
#define ti_sysbios_family_c64p_Cache_EMIFC_BASE (ti_sysbios_family_c64p_Cache_EMIFC_BASE__C)
#endif
#endif

/* EMIFC_LENGTH */
typedef xdc_UInt CT__ti_sysbios_family_c64p_Cache_EMIFC_LENGTH;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_EMIFC_LENGTH ti_sysbios_family_c64p_Cache_EMIFC_LENGTH__C;
#ifdef ti_sysbios_family_c64p_Cache_EMIFC_LENGTH__CR
#define ti_sysbios_family_c64p_Cache_EMIFC_LENGTH (*((CT__ti_sysbios_family_c64p_Cache_EMIFC_LENGTH*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_EMIFC_LENGTH__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_EMIFC_LENGTH__D
#define ti_sysbios_family_c64p_Cache_EMIFC_LENGTH (ti_sysbios_family_c64p_Cache_EMIFC_LENGTH__D)
#else
#define ti_sysbios_family_c64p_Cache_EMIFC_LENGTH (ti_sysbios_family_c64p_Cache_EMIFC_LENGTH__C)
#endif
#endif

/* MAR0_31 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR0_31;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR0_31 ti_sysbios_family_c64p_Cache_MAR0_31__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR0_31__CR
#define ti_sysbios_family_c64p_Cache_MAR0_31 (*((CT__ti_sysbios_family_c64p_Cache_MAR0_31*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR0_31__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR0_31__D
#define ti_sysbios_family_c64p_Cache_MAR0_31 (ti_sysbios_family_c64p_Cache_MAR0_31__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR0_31 (ti_sysbios_family_c64p_Cache_MAR0_31__C)
#endif
#endif

/* MAR32_63 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR32_63;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR32_63 ti_sysbios_family_c64p_Cache_MAR32_63__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR32_63__CR
#define ti_sysbios_family_c64p_Cache_MAR32_63 (*((CT__ti_sysbios_family_c64p_Cache_MAR32_63*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR32_63__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR32_63__D
#define ti_sysbios_family_c64p_Cache_MAR32_63 (ti_sysbios_family_c64p_Cache_MAR32_63__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR32_63 (ti_sysbios_family_c64p_Cache_MAR32_63__C)
#endif
#endif

/* MAR64_95 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR64_95;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR64_95 ti_sysbios_family_c64p_Cache_MAR64_95__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR64_95__CR
#define ti_sysbios_family_c64p_Cache_MAR64_95 (*((CT__ti_sysbios_family_c64p_Cache_MAR64_95*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR64_95__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR64_95__D
#define ti_sysbios_family_c64p_Cache_MAR64_95 (ti_sysbios_family_c64p_Cache_MAR64_95__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR64_95 (ti_sysbios_family_c64p_Cache_MAR64_95__C)
#endif
#endif

/* MAR96_127 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR96_127;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR96_127 ti_sysbios_family_c64p_Cache_MAR96_127__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR96_127__CR
#define ti_sysbios_family_c64p_Cache_MAR96_127 (*((CT__ti_sysbios_family_c64p_Cache_MAR96_127*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR96_127__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR96_127__D
#define ti_sysbios_family_c64p_Cache_MAR96_127 (ti_sysbios_family_c64p_Cache_MAR96_127__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR96_127 (ti_sysbios_family_c64p_Cache_MAR96_127__C)
#endif
#endif

/* MAR128_159 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR128_159;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR128_159 ti_sysbios_family_c64p_Cache_MAR128_159__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR128_159__CR
#define ti_sysbios_family_c64p_Cache_MAR128_159 (*((CT__ti_sysbios_family_c64p_Cache_MAR128_159*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR128_159__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR128_159__D
#define ti_sysbios_family_c64p_Cache_MAR128_159 (ti_sysbios_family_c64p_Cache_MAR128_159__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR128_159 (ti_sysbios_family_c64p_Cache_MAR128_159__C)
#endif
#endif

/* MAR160_191 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR160_191;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR160_191 ti_sysbios_family_c64p_Cache_MAR160_191__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR160_191__CR
#define ti_sysbios_family_c64p_Cache_MAR160_191 (*((CT__ti_sysbios_family_c64p_Cache_MAR160_191*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR160_191__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR160_191__D
#define ti_sysbios_family_c64p_Cache_MAR160_191 (ti_sysbios_family_c64p_Cache_MAR160_191__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR160_191 (ti_sysbios_family_c64p_Cache_MAR160_191__C)
#endif
#endif

/* MAR192_223 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR192_223;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR192_223 ti_sysbios_family_c64p_Cache_MAR192_223__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR192_223__CR
#define ti_sysbios_family_c64p_Cache_MAR192_223 (*((CT__ti_sysbios_family_c64p_Cache_MAR192_223*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR192_223__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR192_223__D
#define ti_sysbios_family_c64p_Cache_MAR192_223 (ti_sysbios_family_c64p_Cache_MAR192_223__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR192_223 (ti_sysbios_family_c64p_Cache_MAR192_223__C)
#endif
#endif

/* MAR224_255 */
typedef xdc_UInt32 CT__ti_sysbios_family_c64p_Cache_MAR224_255;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_MAR224_255 ti_sysbios_family_c64p_Cache_MAR224_255__C;
#ifdef ti_sysbios_family_c64p_Cache_MAR224_255__CR
#define ti_sysbios_family_c64p_Cache_MAR224_255 (*((CT__ti_sysbios_family_c64p_Cache_MAR224_255*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_MAR224_255__C_offset)))
#else
#ifdef ti_sysbios_family_c64p_Cache_MAR224_255__D
#define ti_sysbios_family_c64p_Cache_MAR224_255 (ti_sysbios_family_c64p_Cache_MAR224_255__D)
#else
#define ti_sysbios_family_c64p_Cache_MAR224_255 (ti_sysbios_family_c64p_Cache_MAR224_255__C)
#endif
#endif

/* E_invalidL1CacheSize */
typedef xdc_runtime_Error_Id CT__ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize__C;
#ifdef ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize__CR
#define ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize (*((CT__ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize (ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize__C)
#endif

/* E_invalidL2CacheSize */
typedef xdc_runtime_Error_Id CT__ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize;
__extern __FAR__ const CT__ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize__C;
#ifdef ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize__CR
#define ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize (*((CT__ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize*)(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize__C_offset)))
#else
#define ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize (ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize__C)
#endif


/*
 * ======== VIRTUAL FUNCTIONS ========
 */

/* Fxns__ */
struct ti_sysbios_family_c64p_Cache_Fxns__ {
    const xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2* __sysp;
    xdc_Void (*enable)(xdc_Bits16 type);
    xdc_Void (*disable)(xdc_Bits16 type);
    xdc_Void (*inv)(xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bits16 type, xdc_Bool wait);
    xdc_Void (*wb)(xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bits16 type, xdc_Bool wait);
    xdc_Void (*wbInv)(xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bits16 type, xdc_Bool wait);
    xdc_Void (*wbAll)(void);
    xdc_Void (*wbInvAll)(void);
    xdc_Void (*wait)(void);
    xdc_runtime_Types_SysFxns2 __sfxns;
};
#ifndef ti_sysbios_family_c64p_Cache_Module__FXNS__CR

/* Module__FXNS__C */
__extern const ti_sysbios_family_c64p_Cache_Fxns__ ti_sysbios_family_c64p_Cache_Module__FXNS__C;
#else
#define ti_sysbios_family_c64p_Cache_Module__FXNS__C (*(xdcRomConstPtr + ti_sysbios_family_c64p_Cache_Module__FXNS__C_offset))
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_c64p_Cache_Module_startup ti_sysbios_family_c64p_Cache_Module_startup__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_Module_startup__E, "ti_sysbios_family_c64p_Cache_Module_startup")
__extern xdc_Int ti_sysbios_family_c64p_Cache_Module_startup__E( xdc_Int state );
xdc__CODESECT(ti_sysbios_family_c64p_Cache_Module_startup__F, "ti_sysbios_family_c64p_Cache_Module_startup")
__extern xdc_Int ti_sysbios_family_c64p_Cache_Module_startup__F( xdc_Int state );

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_c64p_Cache_Module__startupDone__S, "ti_sysbios_family_c64p_Cache_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_c64p_Cache_Module__startupDone__S( void );

/* enable__E */
#define ti_sysbios_family_c64p_Cache_enable ti_sysbios_family_c64p_Cache_enable__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_enable__E, "ti_sysbios_family_c64p_Cache_enable")
__extern xdc_Void ti_sysbios_family_c64p_Cache_enable__E( xdc_Bits16 type );

/* wait__E */
#define ti_sysbios_family_c64p_Cache_wait ti_sysbios_family_c64p_Cache_wait__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_wait__E, "ti_sysbios_family_c64p_Cache_wait")
__extern xdc_Void ti_sysbios_family_c64p_Cache_wait__E( void );

/* disable__E */
#define ti_sysbios_family_c64p_Cache_disable ti_sysbios_family_c64p_Cache_disable__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_disable__E, "ti_sysbios_family_c64p_Cache_disable")
__extern xdc_Void ti_sysbios_family_c64p_Cache_disable__E( xdc_Bits16 type );

/* setMode__E */
#define ti_sysbios_family_c64p_Cache_setMode ti_sysbios_family_c64p_Cache_setMode__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_setMode__E, "ti_sysbios_family_c64p_Cache_setMode")
__extern ti_sysbios_family_c64p_Cache_Mode ti_sysbios_family_c64p_Cache_setMode__E( xdc_Bits16 type, ti_sysbios_family_c64p_Cache_Mode mode );

/* getMode__E */
#define ti_sysbios_family_c64p_Cache_getMode ti_sysbios_family_c64p_Cache_getMode__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_getMode__E, "ti_sysbios_family_c64p_Cache_getMode")
__extern ti_sysbios_family_c64p_Cache_Mode ti_sysbios_family_c64p_Cache_getMode__E( xdc_Bits16 type );

/* setSize__E */
#define ti_sysbios_family_c64p_Cache_setSize ti_sysbios_family_c64p_Cache_setSize__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_setSize__E, "ti_sysbios_family_c64p_Cache_setSize")
__extern xdc_Void ti_sysbios_family_c64p_Cache_setSize__E( ti_sysbios_family_c64p_Cache_Size *size );

/* getSize__E */
#define ti_sysbios_family_c64p_Cache_getSize ti_sysbios_family_c64p_Cache_getSize__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_getSize__E, "ti_sysbios_family_c64p_Cache_getSize")
__extern xdc_Void ti_sysbios_family_c64p_Cache_getSize__E( ti_sysbios_family_c64p_Cache_Size *size );

/* getMar__E */
#define ti_sysbios_family_c64p_Cache_getMar ti_sysbios_family_c64p_Cache_getMar__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_getMar__E, "ti_sysbios_family_c64p_Cache_getMar")
__extern ti_sysbios_family_c64p_Cache_Mar ti_sysbios_family_c64p_Cache_getMar__E( xdc_Ptr baseAddr );

/* setMar__E */
#define ti_sysbios_family_c64p_Cache_setMar ti_sysbios_family_c64p_Cache_setMar__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_setMar__E, "ti_sysbios_family_c64p_Cache_setMar")
__extern xdc_Void ti_sysbios_family_c64p_Cache_setMar__E( xdc_Ptr baseAddr, xdc_SizeT byteSize, ti_sysbios_family_c64p_Cache_Mar value );

/* inv__E */
#define ti_sysbios_family_c64p_Cache_inv ti_sysbios_family_c64p_Cache_inv__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_inv__E, "ti_sysbios_family_c64p_Cache_inv")
__extern xdc_Void ti_sysbios_family_c64p_Cache_inv__E( xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bits16 type, xdc_Bool wait );

/* wb__E */
#define ti_sysbios_family_c64p_Cache_wb ti_sysbios_family_c64p_Cache_wb__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_wb__E, "ti_sysbios_family_c64p_Cache_wb")
__extern xdc_Void ti_sysbios_family_c64p_Cache_wb__E( xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bits16 type, xdc_Bool wait );

/* wbInv__E */
#define ti_sysbios_family_c64p_Cache_wbInv ti_sysbios_family_c64p_Cache_wbInv__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_wbInv__E, "ti_sysbios_family_c64p_Cache_wbInv")
__extern xdc_Void ti_sysbios_family_c64p_Cache_wbInv__E( xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bits16 type, xdc_Bool wait );

/* invL1pAll__E */
#define ti_sysbios_family_c64p_Cache_invL1pAll ti_sysbios_family_c64p_Cache_invL1pAll__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_invL1pAll__E, "ti_sysbios_family_c64p_Cache_invL1pAll")
__extern xdc_Void ti_sysbios_family_c64p_Cache_invL1pAll__E( void );

/* wbAll__E */
#define ti_sysbios_family_c64p_Cache_wbAll ti_sysbios_family_c64p_Cache_wbAll__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_wbAll__E, "ti_sysbios_family_c64p_Cache_wbAll")
__extern xdc_Void ti_sysbios_family_c64p_Cache_wbAll__E( void );

/* wbL1dAll__E */
#define ti_sysbios_family_c64p_Cache_wbL1dAll ti_sysbios_family_c64p_Cache_wbL1dAll__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_wbL1dAll__E, "ti_sysbios_family_c64p_Cache_wbL1dAll")
__extern xdc_Void ti_sysbios_family_c64p_Cache_wbL1dAll__E( void );

/* wbInvAll__E */
#define ti_sysbios_family_c64p_Cache_wbInvAll ti_sysbios_family_c64p_Cache_wbInvAll__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_wbInvAll__E, "ti_sysbios_family_c64p_Cache_wbInvAll")
__extern xdc_Void ti_sysbios_family_c64p_Cache_wbInvAll__E( void );

/* wbInvL1dAll__E */
#define ti_sysbios_family_c64p_Cache_wbInvL1dAll ti_sysbios_family_c64p_Cache_wbInvL1dAll__E
xdc__CODESECT(ti_sysbios_family_c64p_Cache_wbInvL1dAll__E, "ti_sysbios_family_c64p_Cache_wbInvL1dAll")
__extern xdc_Void ti_sysbios_family_c64p_Cache_wbInvL1dAll__E( void );

/* all__I */
#define ti_sysbios_family_c64p_Cache_all ti_sysbios_family_c64p_Cache_all__I
xdc__CODESECT(ti_sysbios_family_c64p_Cache_all__I, "ti_sysbios_family_c64p_Cache_all")
__extern xdc_Void ti_sysbios_family_c64p_Cache_all__I( volatile xdc_UInt32 *cacheReg );

/* block__I */
#define ti_sysbios_family_c64p_Cache_block ti_sysbios_family_c64p_Cache_block__I
xdc__CODESECT(ti_sysbios_family_c64p_Cache_block__I, "ti_sysbios_family_c64p_Cache_block")
__extern xdc_Void ti_sysbios_family_c64p_Cache_block__I( xdc_Ptr blockPtr, xdc_SizeT byteCnt, xdc_Bool wait, volatile xdc_UInt32 *barReg );

/* getL1DInitSize__I */
#define ti_sysbios_family_c64p_Cache_getL1DInitSize ti_sysbios_family_c64p_Cache_getL1DInitSize__I
xdc__CODESECT(ti_sysbios_family_c64p_Cache_getL1DInitSize__I, "ti_sysbios_family_c64p_Cache_getL1DInitSize")
__extern xdc_Void ti_sysbios_family_c64p_Cache_getL1DInitSize__I( ti_sysbios_family_c64p_Cache_Size *size );

/* getL1PInitSize__I */
#define ti_sysbios_family_c64p_Cache_getL1PInitSize ti_sysbios_family_c64p_Cache_getL1PInitSize__I
xdc__CODESECT(ti_sysbios_family_c64p_Cache_getL1PInitSize__I, "ti_sysbios_family_c64p_Cache_getL1PInitSize")
__extern xdc_Void ti_sysbios_family_c64p_Cache_getL1PInitSize__I( ti_sysbios_family_c64p_Cache_Size *size );

/* getL2InitSize__I */
#define ti_sysbios_family_c64p_Cache_getL2InitSize ti_sysbios_family_c64p_Cache_getL2InitSize__I
xdc__CODESECT(ti_sysbios_family_c64p_Cache_getL2InitSize__I, "ti_sysbios_family_c64p_Cache_getL2InitSize")
__extern xdc_Void ti_sysbios_family_c64p_Cache_getL2InitSize__I( ti_sysbios_family_c64p_Cache_Size *size );

/* marInit__I */
#define ti_sysbios_family_c64p_Cache_marInit ti_sysbios_family_c64p_Cache_marInit__I
xdc__CODESECT(ti_sysbios_family_c64p_Cache_marInit__I, "ti_sysbios_family_c64p_Cache_marInit")
__extern xdc_Void ti_sysbios_family_c64p_Cache_marInit__I( xdc_UInt32 mask, xdc_UInt32 index );


/*
 * ======== CONVERTORS ========
 */

/* Module_upCast */
static inline ti_sysbios_interfaces_ICache_Module ti_sysbios_family_c64p_Cache_Module_upCast(void);
static inline ti_sysbios_interfaces_ICache_Module ti_sysbios_family_c64p_Cache_Module_upCast(void)
{
    return (ti_sysbios_interfaces_ICache_Module)&ti_sysbios_family_c64p_Cache_Module__FXNS__C;
}

/* Module_to_ti_sysbios_interfaces_ICache */
#define ti_sysbios_family_c64p_Cache_Module_to_ti_sysbios_interfaces_ICache ti_sysbios_family_c64p_Cache_Module_upCast


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_c64p_Cache_Module_startupDone() ti_sysbios_family_c64p_Cache_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_c64p_Cache_Object_heap() ti_sysbios_family_c64p_Cache_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_c64p_Cache_Module_heap() ti_sysbios_family_c64p_Cache_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_c64p_Cache_Module__id ti_sysbios_family_c64p_Cache_Module_id(void);
static inline CT__ti_sysbios_family_c64p_Cache_Module__id ti_sysbios_family_c64p_Cache_Module_id( void ) 
{
    return ti_sysbios_family_c64p_Cache_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_c64p_Cache_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_c64p_Cache_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_c64p_Cache_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_c64p_Cache_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_c64p_Cache_Module_getMask( void ) 
{
    return ti_sysbios_family_c64p_Cache_Module__diagsMask__C != NULL ? *ti_sysbios_family_c64p_Cache_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_c64p_Cache_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_c64p_Cache_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_c64p_Cache_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_c64p_Cache_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_c64p_Cache__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_c64p_Cache__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_c64p_Cache__internalaccess))

#ifndef ti_sysbios_family_c64p_Cache__include_state
#define ti_sysbios_family_c64p_Cache__include_state

/* Module_State */
struct ti_sysbios_family_c64p_Cache_Module_State {
    volatile xdc_UInt32 *emifAddr;
};

/* Module__state__V */
#ifndef ti_sysbios_family_c64p_Cache_Module__state__VR
extern struct ti_sysbios_family_c64p_Cache_Module_State__ ti_sysbios_family_c64p_Cache_Module__state__V;
#else
#define ti_sysbios_family_c64p_Cache_Module__state__V (*((struct ti_sysbios_family_c64p_Cache_Module_State__*)(xdcRomStatePtr + ti_sysbios_family_c64p_Cache_Module__state__V_offset)))
#endif

#endif /* ti_sysbios_family_c64p_Cache__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_c64p_Cache__nolocalnames)

#ifndef ti_sysbios_family_c64p_Cache__localnames__done
#define ti_sysbios_family_c64p_Cache__localnames__done

/* module prefix */
#define Cache_Type ti_sysbios_family_c64p_Cache_Type
#define Cache_Mode ti_sysbios_family_c64p_Cache_Mode
#define Cache_L1Size ti_sysbios_family_c64p_Cache_L1Size
#define Cache_L2Size ti_sysbios_family_c64p_Cache_L2Size
#define Cache_Mar ti_sysbios_family_c64p_Cache_Mar
#define Cache_Size ti_sysbios_family_c64p_Cache_Size
#define Cache_L2CFG ti_sysbios_family_c64p_Cache_L2CFG
#define Cache_L1PCFG ti_sysbios_family_c64p_Cache_L1PCFG
#define Cache_L1PCC ti_sysbios_family_c64p_Cache_L1PCC
#define Cache_L1DCFG ti_sysbios_family_c64p_Cache_L1DCFG
#define Cache_L1DCC ti_sysbios_family_c64p_Cache_L1DCC
#define Cache_MAR ti_sysbios_family_c64p_Cache_MAR
#define Cache_Module_State ti_sysbios_family_c64p_Cache_Module_State
#define Cache_Type_L1P ti_sysbios_family_c64p_Cache_Type_L1P
#define Cache_Type_L1D ti_sysbios_family_c64p_Cache_Type_L1D
#define Cache_Type_L1 ti_sysbios_family_c64p_Cache_Type_L1
#define Cache_Type_L2P ti_sysbios_family_c64p_Cache_Type_L2P
#define Cache_Type_L2D ti_sysbios_family_c64p_Cache_Type_L2D
#define Cache_Type_L2 ti_sysbios_family_c64p_Cache_Type_L2
#define Cache_Type_ALLP ti_sysbios_family_c64p_Cache_Type_ALLP
#define Cache_Type_ALLD ti_sysbios_family_c64p_Cache_Type_ALLD
#define Cache_Type_ALL ti_sysbios_family_c64p_Cache_Type_ALL
#define Cache_Mode_FREEZE ti_sysbios_family_c64p_Cache_Mode_FREEZE
#define Cache_Mode_BYPASS ti_sysbios_family_c64p_Cache_Mode_BYPASS
#define Cache_Mode_NORMAL ti_sysbios_family_c64p_Cache_Mode_NORMAL
#define Cache_L1Size_0K ti_sysbios_family_c64p_Cache_L1Size_0K
#define Cache_L1Size_4K ti_sysbios_family_c64p_Cache_L1Size_4K
#define Cache_L1Size_8K ti_sysbios_family_c64p_Cache_L1Size_8K
#define Cache_L1Size_16K ti_sysbios_family_c64p_Cache_L1Size_16K
#define Cache_L1Size_32K ti_sysbios_family_c64p_Cache_L1Size_32K
#define Cache_L2Size_0K ti_sysbios_family_c64p_Cache_L2Size_0K
#define Cache_L2Size_32K ti_sysbios_family_c64p_Cache_L2Size_32K
#define Cache_L2Size_64K ti_sysbios_family_c64p_Cache_L2Size_64K
#define Cache_L2Size_128K ti_sysbios_family_c64p_Cache_L2Size_128K
#define Cache_L2Size_256K ti_sysbios_family_c64p_Cache_L2Size_256K
#define Cache_L2Size_512K ti_sysbios_family_c64p_Cache_L2Size_512K
#define Cache_L2Size_1024K ti_sysbios_family_c64p_Cache_L2Size_1024K
#define Cache_Mar_DISABLE ti_sysbios_family_c64p_Cache_Mar_DISABLE
#define Cache_Mar_ENABLE ti_sysbios_family_c64p_Cache_Mar_ENABLE
#define Cache_initSize ti_sysbios_family_c64p_Cache_initSize
#define Cache_EMIFA_CFG ti_sysbios_family_c64p_Cache_EMIFA_CFG
#define Cache_EMIFA_BASE ti_sysbios_family_c64p_Cache_EMIFA_BASE
#define Cache_EMIFA_LENGTH ti_sysbios_family_c64p_Cache_EMIFA_LENGTH
#define Cache_EMIFB_CFG ti_sysbios_family_c64p_Cache_EMIFB_CFG
#define Cache_EMIFB_BASE ti_sysbios_family_c64p_Cache_EMIFB_BASE
#define Cache_EMIFB_LENGTH ti_sysbios_family_c64p_Cache_EMIFB_LENGTH
#define Cache_EMIFC_CFG ti_sysbios_family_c64p_Cache_EMIFC_CFG
#define Cache_EMIFC_BASE ti_sysbios_family_c64p_Cache_EMIFC_BASE
#define Cache_EMIFC_LENGTH ti_sysbios_family_c64p_Cache_EMIFC_LENGTH
#define Cache_MAR0_31 ti_sysbios_family_c64p_Cache_MAR0_31
#define Cache_MAR32_63 ti_sysbios_family_c64p_Cache_MAR32_63
#define Cache_MAR64_95 ti_sysbios_family_c64p_Cache_MAR64_95
#define Cache_MAR96_127 ti_sysbios_family_c64p_Cache_MAR96_127
#define Cache_MAR128_159 ti_sysbios_family_c64p_Cache_MAR128_159
#define Cache_MAR160_191 ti_sysbios_family_c64p_Cache_MAR160_191
#define Cache_MAR192_223 ti_sysbios_family_c64p_Cache_MAR192_223
#define Cache_MAR224_255 ti_sysbios_family_c64p_Cache_MAR224_255
#define Cache_E_invalidL1CacheSize ti_sysbios_family_c64p_Cache_E_invalidL1CacheSize
#define Cache_E_invalidL2CacheSize ti_sysbios_family_c64p_Cache_E_invalidL2CacheSize
#define Cache_enable ti_sysbios_family_c64p_Cache_enable
#define Cache_wait ti_sysbios_family_c64p_Cache_wait
#define Cache_disable ti_sysbios_family_c64p_Cache_disable
#define Cache_setMode ti_sysbios_family_c64p_Cache_setMode
#define Cache_getMode ti_sysbios_family_c64p_Cache_getMode
#define Cache_setSize ti_sysbios_family_c64p_Cache_setSize
#define Cache_getSize ti_sysbios_family_c64p_Cache_getSize
#define Cache_getMar ti_sysbios_family_c64p_Cache_getMar
#define Cache_setMar ti_sysbios_family_c64p_Cache_setMar
#define Cache_inv ti_sysbios_family_c64p_Cache_inv
#define Cache_wb ti_sysbios_family_c64p_Cache_wb
#define Cache_wbInv ti_sysbios_family_c64p_Cache_wbInv
#define Cache_invL1pAll ti_sysbios_family_c64p_Cache_invL1pAll
#define Cache_wbAll ti_sysbios_family_c64p_Cache_wbAll
#define Cache_wbL1dAll ti_sysbios_family_c64p_Cache_wbL1dAll
#define Cache_wbInvAll ti_sysbios_family_c64p_Cache_wbInvAll
#define Cache_wbInvL1dAll ti_sysbios_family_c64p_Cache_wbInvL1dAll
#define Cache_Module_name ti_sysbios_family_c64p_Cache_Module_name
#define Cache_Module_id ti_sysbios_family_c64p_Cache_Module_id
#define Cache_Module_startup ti_sysbios_family_c64p_Cache_Module_startup
#define Cache_Module_startupDone ti_sysbios_family_c64p_Cache_Module_startupDone
#define Cache_Module_hasMask ti_sysbios_family_c64p_Cache_Module_hasMask
#define Cache_Module_getMask ti_sysbios_family_c64p_Cache_Module_getMask
#define Cache_Module_setMask ti_sysbios_family_c64p_Cache_Module_setMask
#define Cache_Object_heap ti_sysbios_family_c64p_Cache_Object_heap
#define Cache_Module_heap ti_sysbios_family_c64p_Cache_Module_heap
#define Cache_Module_upCast ti_sysbios_family_c64p_Cache_Module_upCast
#define Cache_Module_to_ti_sysbios_interfaces_ICache ti_sysbios_family_c64p_Cache_Module_to_ti_sysbios_interfaces_ICache

#endif /* ti_sysbios_family_c64p_Cache__localnames__done */
#endif
