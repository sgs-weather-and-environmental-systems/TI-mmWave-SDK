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

#ifndef ti_sysbios_family_arp32_CTM__include
#define ti_sysbios_family_arp32_CTM__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_family_arp32_CTM__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_family_arp32_CTM___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/family/arp32/package/package.defs.h>

#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* CTM */
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__RES_04;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_04[7];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_04[7];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_04 __TA_ti_sysbios_family_arp32_CTM_CTM__RES_04;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__RES_34;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_34[3];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_34[3];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_34 __TA_ti_sysbios_family_arp32_CTM_CTM__RES_34;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__TINTVLR;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__TINTVLR[8];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__TINTVLR[8];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__TINTVLR __TA_ti_sysbios_family_arp32_CTM_CTM__TINTVLR;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__RES_60;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_60[7];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_60[7];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_60 __TA_ti_sysbios_family_arp32_CTM_CTM__RES_60;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__CTDBGSGL;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTDBGSGL[8];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTDBGSGL[8];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTDBGSGL __TA_ti_sysbios_family_arp32_CTM_CTM__CTDBGSGL;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__RES_A0;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_A0[20];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_A0[20];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__RES_A0 __TA_ti_sysbios_family_arp32_CTM_CTM__RES_A0;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__CTGNBL;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTGNBL[2];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTGNBL[2];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTGNBL __TA_ti_sysbios_family_arp32_CTM_CTM__CTGNBL;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__CTGRST;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTGRST[2];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTGRST[2];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTGRST __TA_ti_sysbios_family_arp32_CTM_CTM__CTGRST;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__CTCR;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTCR[32];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTCR[32];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTCR __TA_ti_sysbios_family_arp32_CTM_CTM__CTCR;
typedef xdc_UInt32 __T1_ti_sysbios_family_arp32_CTM_CTM__CTCNTR;
typedef xdc_UInt32 __ARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTCNTR[32];
typedef xdc_UInt32 __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTCNTR[32];
typedef __CARRAY1_ti_sysbios_family_arp32_CTM_CTM__CTCNTR __TA_ti_sysbios_family_arp32_CTM_CTM__CTCNTR;
struct ti_sysbios_family_arp32_CTM_CTM {
    xdc_UInt32 CTCNTL;
    __TA_ti_sysbios_family_arp32_CTM_CTM__RES_04 RES_04;
    xdc_UInt32 CTSTMCNTL;
    xdc_UInt32 CTSTMMSTID;
    xdc_UInt32 CTSTMINTVL;
    xdc_UInt32 CTSTMSEL0;
    xdc_UInt32 CTSTMSEL1;
    __TA_ti_sysbios_family_arp32_CTM_CTM__RES_34 RES_34;
    __TA_ti_sysbios_family_arp32_CTM_CTM__TINTVLR TINTVLR;
    __TA_ti_sysbios_family_arp32_CTM_CTM__RES_60 RES_60;
    xdc_UInt32 CTNUMDBG;
    __TA_ti_sysbios_family_arp32_CTM_CTM__CTDBGSGL CTDBGSGL;
    __TA_ti_sysbios_family_arp32_CTM_CTM__RES_A0 RES_A0;
    __TA_ti_sysbios_family_arp32_CTM_CTM__CTGNBL CTGNBL;
    __TA_ti_sysbios_family_arp32_CTM_CTM__CTGRST CTGRST;
    __TA_ti_sysbios_family_arp32_CTM_CTM__CTCR CTCR;
    __TA_ti_sysbios_family_arp32_CTM_CTM__CTCNTR CTCNTR;
};

/* ctm */
__extern volatile ti_sysbios_family_arp32_CTM_CTM ti_sysbios_family_arp32_CTM_ctm;


/*
 * ======== INTERNAL DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_family_arp32_CTM_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__diagsEnabled ti_sysbios_family_arp32_CTM_Module__diagsEnabled__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__diagsEnabled__CR
#define ti_sysbios_family_arp32_CTM_Module__diagsEnabled__C (*((CT__ti_sysbios_family_arp32_CTM_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__diagsEnabled (ti_sysbios_family_arp32_CTM_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_family_arp32_CTM_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__diagsIncluded ti_sysbios_family_arp32_CTM_Module__diagsIncluded__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__diagsIncluded__CR
#define ti_sysbios_family_arp32_CTM_Module__diagsIncluded__C (*((CT__ti_sysbios_family_arp32_CTM_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__diagsIncluded (ti_sysbios_family_arp32_CTM_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_family_arp32_CTM_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__diagsMask ti_sysbios_family_arp32_CTM_Module__diagsMask__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__diagsMask__CR
#define ti_sysbios_family_arp32_CTM_Module__diagsMask__C (*((CT__ti_sysbios_family_arp32_CTM_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__diagsMask (ti_sysbios_family_arp32_CTM_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_family_arp32_CTM_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__gateObj ti_sysbios_family_arp32_CTM_Module__gateObj__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__gateObj__CR
#define ti_sysbios_family_arp32_CTM_Module__gateObj__C (*((CT__ti_sysbios_family_arp32_CTM_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__gateObj__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__gateObj (ti_sysbios_family_arp32_CTM_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_family_arp32_CTM_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__gatePrms ti_sysbios_family_arp32_CTM_Module__gatePrms__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__gatePrms__CR
#define ti_sysbios_family_arp32_CTM_Module__gatePrms__C (*((CT__ti_sysbios_family_arp32_CTM_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__gatePrms (ti_sysbios_family_arp32_CTM_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_family_arp32_CTM_Module__id;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__id ti_sysbios_family_arp32_CTM_Module__id__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__id__CR
#define ti_sysbios_family_arp32_CTM_Module__id__C (*((CT__ti_sysbios_family_arp32_CTM_Module__id*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__id__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__id (ti_sysbios_family_arp32_CTM_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_family_arp32_CTM_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__loggerDefined ti_sysbios_family_arp32_CTM_Module__loggerDefined__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__loggerDefined__CR
#define ti_sysbios_family_arp32_CTM_Module__loggerDefined__C (*((CT__ti_sysbios_family_arp32_CTM_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__loggerDefined (ti_sysbios_family_arp32_CTM_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_family_arp32_CTM_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__loggerObj ti_sysbios_family_arp32_CTM_Module__loggerObj__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__loggerObj__CR
#define ti_sysbios_family_arp32_CTM_Module__loggerObj__C (*((CT__ti_sysbios_family_arp32_CTM_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__loggerObj (ti_sysbios_family_arp32_CTM_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn0 ti_sysbios_family_arp32_CTM_Module__loggerFxn0__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__loggerFxn0__CR
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn0__C (*((CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn0 (ti_sysbios_family_arp32_CTM_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn1 ti_sysbios_family_arp32_CTM_Module__loggerFxn1__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__loggerFxn1__CR
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn1__C (*((CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn1 (ti_sysbios_family_arp32_CTM_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn2 ti_sysbios_family_arp32_CTM_Module__loggerFxn2__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__loggerFxn2__CR
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn2__C (*((CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn2 (ti_sysbios_family_arp32_CTM_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn4 ti_sysbios_family_arp32_CTM_Module__loggerFxn4__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__loggerFxn4__CR
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn4__C (*((CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn4 (ti_sysbios_family_arp32_CTM_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn8 ti_sysbios_family_arp32_CTM_Module__loggerFxn8__C;
#ifdef ti_sysbios_family_arp32_CTM_Module__loggerFxn8__CR
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn8__C (*((CT__ti_sysbios_family_arp32_CTM_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Module__loggerFxn8 (ti_sysbios_family_arp32_CTM_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_family_arp32_CTM_Object__count;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Object__count ti_sysbios_family_arp32_CTM_Object__count__C;
#ifdef ti_sysbios_family_arp32_CTM_Object__count__CR
#define ti_sysbios_family_arp32_CTM_Object__count__C (*((CT__ti_sysbios_family_arp32_CTM_Object__count*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Object__count__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Object__count (ti_sysbios_family_arp32_CTM_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_family_arp32_CTM_Object__heap;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Object__heap ti_sysbios_family_arp32_CTM_Object__heap__C;
#ifdef ti_sysbios_family_arp32_CTM_Object__heap__CR
#define ti_sysbios_family_arp32_CTM_Object__heap__C (*((CT__ti_sysbios_family_arp32_CTM_Object__heap*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Object__heap__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Object__heap (ti_sysbios_family_arp32_CTM_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_family_arp32_CTM_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Object__sizeof ti_sysbios_family_arp32_CTM_Object__sizeof__C;
#ifdef ti_sysbios_family_arp32_CTM_Object__sizeof__CR
#define ti_sysbios_family_arp32_CTM_Object__sizeof__C (*((CT__ti_sysbios_family_arp32_CTM_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Object__sizeof__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Object__sizeof (ti_sysbios_family_arp32_CTM_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_family_arp32_CTM_Object__table;
__extern __FAR__ const CT__ti_sysbios_family_arp32_CTM_Object__table ti_sysbios_family_arp32_CTM_Object__table__C;
#ifdef ti_sysbios_family_arp32_CTM_Object__table__CR
#define ti_sysbios_family_arp32_CTM_Object__table__C (*((CT__ti_sysbios_family_arp32_CTM_Object__table*)(xdcRomConstPtr + ti_sysbios_family_arp32_CTM_Object__table__C_offset)))
#else
#define ti_sysbios_family_arp32_CTM_Object__table (ti_sysbios_family_arp32_CTM_Object__table__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_family_arp32_CTM_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_family_arp32_CTM_Module__startupDone__S, "ti_sysbios_family_arp32_CTM_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_family_arp32_CTM_Module__startupDone__S( void );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_family_arp32_CTM_Module_startupDone() ti_sysbios_family_arp32_CTM_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_family_arp32_CTM_Object_heap() ti_sysbios_family_arp32_CTM_Object__heap__C

/* Module_heap */
#define ti_sysbios_family_arp32_CTM_Module_heap() ti_sysbios_family_arp32_CTM_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_family_arp32_CTM_Module__id ti_sysbios_family_arp32_CTM_Module_id(void);
static inline CT__ti_sysbios_family_arp32_CTM_Module__id ti_sysbios_family_arp32_CTM_Module_id( void ) 
{
    return ti_sysbios_family_arp32_CTM_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_family_arp32_CTM_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_family_arp32_CTM_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_family_arp32_CTM_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_family_arp32_CTM_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_family_arp32_CTM_Module_getMask( void ) 
{
    return ti_sysbios_family_arp32_CTM_Module__diagsMask__C != NULL ? *ti_sysbios_family_arp32_CTM_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_family_arp32_CTM_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_family_arp32_CTM_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_family_arp32_CTM_Module__diagsMask__C != NULL) {
        *ti_sysbios_family_arp32_CTM_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_family_arp32_CTM__top__
#undef __nested__
#endif

#endif /* ti_sysbios_family_arp32_CTM__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_family_arp32_CTM__internalaccess))

#ifndef ti_sysbios_family_arp32_CTM__include_state
#define ti_sysbios_family_arp32_CTM__include_state


#endif /* ti_sysbios_family_arp32_CTM__include_state */

#endif

/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_family_arp32_CTM__nolocalnames)

#ifndef ti_sysbios_family_arp32_CTM__localnames__done
#define ti_sysbios_family_arp32_CTM__localnames__done

/* module prefix */
#define CTM_CTM ti_sysbios_family_arp32_CTM_CTM
#define CTM_ctm ti_sysbios_family_arp32_CTM_ctm
#define CTM_Module_name ti_sysbios_family_arp32_CTM_Module_name
#define CTM_Module_id ti_sysbios_family_arp32_CTM_Module_id
#define CTM_Module_startup ti_sysbios_family_arp32_CTM_Module_startup
#define CTM_Module_startupDone ti_sysbios_family_arp32_CTM_Module_startupDone
#define CTM_Module_hasMask ti_sysbios_family_arp32_CTM_Module_hasMask
#define CTM_Module_getMask ti_sysbios_family_arp32_CTM_Module_getMask
#define CTM_Module_setMask ti_sysbios_family_arp32_CTM_Module_setMask
#define CTM_Object_heap ti_sysbios_family_arp32_CTM_Object_heap
#define CTM_Module_heap ti_sysbios_family_arp32_CTM_Module_heap

#endif /* ti_sysbios_family_arp32_CTM__localnames__done */
#endif
