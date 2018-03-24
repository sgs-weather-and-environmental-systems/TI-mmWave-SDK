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

#ifndef ti_sysbios_family_arm_v8a_Mmu__include
#define ti_sysbios_family_arm_v8a_Mmu__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_arm_v8a_Mmu__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_arm_v8a_Mmu___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/arm/v8a/package/package.defs.h>

#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* NUM_LEVEL1_ENTRIES */
#define ti_sysbios_family_arm_v8a_Mmu_NUM_LEVEL1_ENTRIES (512)

/* DescriptorType */
enum ti_sysbios_family_arm_v8a_Mmu_DescriptorType {
    ti_sysbios_family_arm_v8a_Mmu_DescriptorType_INVALID0 = 0,
    ti_sysbios_family_arm_v8a_Mmu_DescriptorType_BLOCK = 1,
    ti_sysbios_family_arm_v8a_Mmu_DescriptorType_INVALID1 = 2,
    ti_sysbios_family_arm_v8a_Mmu_DescriptorType_TABLE = 3
};
typedef enum ti_sysbios_family_arm_v8a_Mmu_DescriptorType ti_sysbios_family_arm_v8a_Mmu_DescriptorType;

/* DescriptorAttrs */
struct ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs {
    ti_sysbios_family_arm_v8a_Mmu_DescriptorType type;
    xdc_Bool nsTable;
    xdc_UInt8 apTable;
    xdc_Bool xnTable;
    xdc_Bool pxnTable;
    xdc_Bool noExecute;
    xdc_Bool privNoExecute;
    xdc_Bool contiguous;
    xdc_Bool notGlobal;
    xdc_Bool accessFlag;
    xdc_UInt8 shareable;
    xdc_UInt8 accPerm;
    xdc_Bool nonSecure;
    xdc_UInt8 attrIndx;
    xdc_UInt8 reserved;
};


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* Module_State */
typedef xdc_UInt64 __T1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level1Table;
typedef xdc_UInt64 *__ARRAY1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level1Table;
typedef const xdc_UInt64 *__CARRAY1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level1Table;
typedef __ARRAY1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level1Table __TA_ti_sysbios_family_arm_v8a_Mmu_Module_State__level1Table;
typedef xdc_UInt64 __T1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level2Table;
typedef xdc_UInt64 *__ARRAY1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level2Table;
typedef const xdc_UInt64 *__CARRAY1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level2Table;
typedef __ARRAY1_ti_sysbios_family_arm_v8a_Mmu_Module_State__level2Table __TA_ti_sysbios_family_arm_v8a_Mmu_Module_State__level2Table;


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled (ti_sysbios_family_arm_v8a_Mmu_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded (ti_sysbios_family_arm_v8a_Mmu_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask (ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v8a_Mmu_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__gateObj ti_sysbios_family_arm_v8a_Mmu_Module__gateObj__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__gateObj__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__gateObj__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__gateObj (ti_sysbios_family_arm_v8a_Mmu_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms (ti_sysbios_family_arm_v8a_Mmu_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_arm_v8a_Mmu_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__id ti_sysbios_family_arm_v8a_Mmu_Module__id__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__id__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__id__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__id*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__id__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__id (ti_sysbios_family_arm_v8a_Mmu_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined (ti_sysbios_family_arm_v8a_Mmu_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj (ti_sysbios_family_arm_v8a_Mmu_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0 ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0 (ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1 ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1 (ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2 ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2 (ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4 ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4 (ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8 ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8__CR
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8 (ti_sysbios_family_arm_v8a_Mmu_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_arm_v8a_Mmu_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Object__count ti_sysbios_family_arm_v8a_Mmu_Object__count__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Object__count__CR
#define ti_sysbios_family_arm_v8a_Mmu_Object__count__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Object__count*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Object__count__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Object__count (ti_sysbios_family_arm_v8a_Mmu_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_arm_v8a_Mmu_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Object__heap ti_sysbios_family_arm_v8a_Mmu_Object__heap__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Object__heap__CR
#define ti_sysbios_family_arm_v8a_Mmu_Object__heap__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Object__heap__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Object__heap (ti_sysbios_family_arm_v8a_Mmu_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_arm_v8a_Mmu_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Object__sizeof ti_sysbios_family_arm_v8a_Mmu_Object__sizeof__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Object__sizeof__CR
#define ti_sysbios_family_arm_v8a_Mmu_Object__sizeof__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Object__sizeof (ti_sysbios_family_arm_v8a_Mmu_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_arm_v8a_Mmu_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_Object__table ti_sysbios_family_arm_v8a_Mmu_Object__table__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_Object__table__CR
#define ti_sysbios_family_arm_v8a_Mmu_Object__table__C (*((CT__ti_sysbios_family_arm_v8a_Mmu_Object__table*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_Object__table__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_Object__table (ti_sysbios_family_arm_v8a_Mmu_Object__table__C)
#endif

/* defaultAttrs */
typedef ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs CT__ti_sysbios_family_arm_v8a_Mmu_defaultAttrs;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_defaultAttrs ti_sysbios_family_arm_v8a_Mmu_defaultAttrs__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_defaultAttrs__CR
#define ti_sysbios_family_arm_v8a_Mmu_defaultAttrs (*((CT__ti_sysbios_family_arm_v8a_Mmu_defaultAttrs*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_defaultAttrs__C_offset)))
#else
#define ti_sysbios_family_arm_v8a_Mmu_defaultAttrs (ti_sysbios_family_arm_v8a_Mmu_defaultAttrs__C)
#endif

/* enableMMU */
typedef xdc_Bool CT__ti_sysbios_family_arm_v8a_Mmu_enableMMU;
__extern __FAR__ const CT__ti_sysbios_family_arm_v8a_Mmu_enableMMU ti_sysbios_family_arm_v8a_Mmu_enableMMU__C;
#ifdef ti_sysbios_family_arm_v8a_Mmu_enableMMU__CR
#define ti_sysbios_family_arm_v8a_Mmu_enableMMU (*((CT__ti_sysbios_family_arm_v8a_Mmu_enableMMU*)(xdcRomConstPtr + ti_sysbios_family_arm_v8a_Mmu_enableMMU__C_offset)))
#else
#ifdef ti_sysbios_family_arm_v8a_Mmu_enableMMU__D
#define ti_sysbios_family_arm_v8a_Mmu_enableMMU (ti_sysbios_family_arm_v8a_Mmu_enableMMU__D)
#else
#define ti_sysbios_family_arm_v8a_Mmu_enableMMU (ti_sysbios_family_arm_v8a_Mmu_enableMMU__C)
#endif
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_arm_v8a_Mmu_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_Module__startupDone__S, "ti_sysbios_family_arm_v8a_Mmu_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_arm_v8a_Mmu_Module__startupDone__S( void );

/* enable__E */
#define ti_sysbios_family_arm_v8a_Mmu_enable ti_sysbios_family_arm_v8a_Mmu_enable__E
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_enable__E, "ti_sysbios_family_arm_v8a_Mmu_enable")
__extern xdc_Void ti_sysbios_family_arm_v8a_Mmu_enable__E( void );

/* initDescAttrs__E */
#define ti_sysbios_family_arm_v8a_Mmu_initDescAttrs ti_sysbios_family_arm_v8a_Mmu_initDescAttrs__E
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_initDescAttrs__E, "ti_sysbios_family_arm_v8a_Mmu_initDescAttrs")
__extern xdc_Void ti_sysbios_family_arm_v8a_Mmu_initDescAttrs__E( ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs *descAttrs );

/* setMAIR__E */
#define ti_sysbios_family_arm_v8a_Mmu_setMAIR ti_sysbios_family_arm_v8a_Mmu_setMAIR__E
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_setMAIR__E, "ti_sysbios_family_arm_v8a_Mmu_setMAIR")
__extern xdc_Void ti_sysbios_family_arm_v8a_Mmu_setMAIR__E( xdc_UInt8 idx, xdc_UInt16 val );

/* startup__E */
#define ti_sysbios_family_arm_v8a_Mmu_startup ti_sysbios_family_arm_v8a_Mmu_startup__E
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_startup__E, "ti_sysbios_family_arm_v8a_Mmu_startup")
__extern xdc_Void ti_sysbios_family_arm_v8a_Mmu_startup__E( void );

/* init__I */
#define ti_sysbios_family_arm_v8a_Mmu_init ti_sysbios_family_arm_v8a_Mmu_init__I
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_init__I, "ti_sysbios_family_arm_v8a_Mmu_init")
__extern xdc_Void ti_sysbios_family_arm_v8a_Mmu_init__I( xdc_Ptr tableAddr );

/* initLevel1Desc__I */
#define ti_sysbios_family_arm_v8a_Mmu_initLevel1Desc ti_sysbios_family_arm_v8a_Mmu_initLevel1Desc__I
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_initLevel1Desc__I, "ti_sysbios_family_arm_v8a_Mmu_initLevel1Desc")
__extern xdc_UInt64 ti_sysbios_family_arm_v8a_Mmu_initLevel1Desc__I( xdc_UInt64 phyAddr, ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs *attrs );

/* initLevel2Desc__I */
#define ti_sysbios_family_arm_v8a_Mmu_initLevel2Desc ti_sysbios_family_arm_v8a_Mmu_initLevel2Desc__I
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_initLevel2Desc__I, "ti_sysbios_family_arm_v8a_Mmu_initLevel2Desc")
__extern xdc_UInt64 ti_sysbios_family_arm_v8a_Mmu_initLevel2Desc__I( xdc_UInt64 phyAddr, ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs *attrs );

/* setTCR__I */
#define ti_sysbios_family_arm_v8a_Mmu_setTCR ti_sysbios_family_arm_v8a_Mmu_setTCR__I
xdc__CODESECT(ti_sysbios_family_arm_v8a_Mmu_setTCR__I, "ti_sysbios_family_arm_v8a_Mmu_setTCR")
__extern xdc_Void ti_sysbios_family_arm_v8a_Mmu_setTCR__I( xdc_UInt64 regVal );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_arm_v8a_Mmu_Module_startupDone() ti_sysbios_family_arm_v8a_Mmu_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_arm_v8a_Mmu_Object_heap() ti_sysbios_family_arm_v8a_Mmu_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_arm_v8a_Mmu_Module_heap() ti_sysbios_family_arm_v8a_Mmu_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_arm_v8a_Mmu_Module__id ti_sysbios_family_arm_v8a_Mmu_Module_id(void);
static inline CT__ti_sysbios_family_arm_v8a_Mmu_Module__id ti_sysbios_family_arm_v8a_Mmu_Module_id( void ) 
{
    return ti_sysbios_family_arm_v8a_Mmu_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_arm_v8a_Mmu_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_arm_v8a_Mmu_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_arm_v8a_Mmu_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_arm_v8a_Mmu_Module_getMask( void ) 
{
    return ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C != NULL ? *ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_arm_v8a_Mmu_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_arm_v8a_Mmu_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_arm_v8a_Mmu_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_arm_v8a_Mmu__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_arm_v8a_Mmu__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_arm_v8a_Mmu__internalaccess))

#ifndef ti_sysbios_family_arm_v8a_Mmu__include_state
#define ti_sysbios_family_arm_v8a_Mmu__include_state

/* Module_State */
struct ti_sysbios_family_arm_v8a_Mmu_Module_State {
    __TA_ti_sysbios_family_arm_v8a_Mmu_Module_State__level1Table level1Table;
    __TA_ti_sysbios_family_arm_v8a_Mmu_Module_State__level2Table level2Table;
};

/* Module__state__V */
#ifndef ti_sysbios_family_arm_v8a_Mmu_Module__state__VR
extern struct ti_sysbios_family_arm_v8a_Mmu_Module_State__ ti_sysbios_family_arm_v8a_Mmu_Module__state__V;
#else
#define ti_sysbios_family_arm_v8a_Mmu_Module__state__V (*((struct ti_sysbios_family_arm_v8a_Mmu_Module_State__*)(xdcRomStatePtr + ti_sysbios_family_arm_v8a_Mmu_Module__state__V_offset)))
#endif

#endif /* ti_sysbios_family_arm_v8a_Mmu__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_arm_v8a_Mmu__nolocalnames)

#ifndef ti_sysbios_family_arm_v8a_Mmu__localnames__done
#define ti_sysbios_family_arm_v8a_Mmu__localnames__done

/* module prefix */
#define Mmu_NUM_LEVEL1_ENTRIES ti_sysbios_family_arm_v8a_Mmu_NUM_LEVEL1_ENTRIES
#define Mmu_DescriptorType ti_sysbios_family_arm_v8a_Mmu_DescriptorType
#define Mmu_DescriptorAttrs ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs
#define Mmu_Module_State ti_sysbios_family_arm_v8a_Mmu_Module_State
#define Mmu_DescriptorType_INVALID0 ti_sysbios_family_arm_v8a_Mmu_DescriptorType_INVALID0
#define Mmu_DescriptorType_BLOCK ti_sysbios_family_arm_v8a_Mmu_DescriptorType_BLOCK
#define Mmu_DescriptorType_INVALID1 ti_sysbios_family_arm_v8a_Mmu_DescriptorType_INVALID1
#define Mmu_DescriptorType_TABLE ti_sysbios_family_arm_v8a_Mmu_DescriptorType_TABLE
#define Mmu_defaultAttrs ti_sysbios_family_arm_v8a_Mmu_defaultAttrs
#define Mmu_enableMMU ti_sysbios_family_arm_v8a_Mmu_enableMMU
#define Mmu_enable ti_sysbios_family_arm_v8a_Mmu_enable
#define Mmu_initDescAttrs ti_sysbios_family_arm_v8a_Mmu_initDescAttrs
#define Mmu_setMAIR ti_sysbios_family_arm_v8a_Mmu_setMAIR
#define Mmu_startup ti_sysbios_family_arm_v8a_Mmu_startup
#define Mmu_Module_name ti_sysbios_family_arm_v8a_Mmu_Module_name
#define Mmu_Module_id ti_sysbios_family_arm_v8a_Mmu_Module_id
#define Mmu_Module_startup ti_sysbios_family_arm_v8a_Mmu_Module_startup
#define Mmu_Module_startupDone ti_sysbios_family_arm_v8a_Mmu_Module_startupDone
#define Mmu_Module_hasMask ti_sysbios_family_arm_v8a_Mmu_Module_hasMask
#define Mmu_Module_getMask ti_sysbios_family_arm_v8a_Mmu_Module_getMask
#define Mmu_Module_setMask ti_sysbios_family_arm_v8a_Mmu_Module_setMask
#define Mmu_Object_heap ti_sysbios_family_arm_v8a_Mmu_Object_heap
#define Mmu_Module_heap ti_sysbios_family_arm_v8a_Mmu_Module_heap

#endif /* ti_sysbios_family_arm_v8a_Mmu__localnames__done */
#endif
