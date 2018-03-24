/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D21
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

#ifndef xdc_runtime_Startup__include
#define xdc_runtime_Startup__include

#ifndef __nested__
#define __nested__
#define xdc_runtime_Startup__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_runtime_Startup___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/package/package.defs.h>

#include <xdc/runtime/IModule.h>
#include <xdc/runtime/Types.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* DONE */
#define xdc_runtime_Startup_DONE (-1)

/* NOTDONE */
#define xdc_runtime_Startup_NOTDONE (0)

/* InitFxn */
typedef xdc_Void (*xdc_runtime_Startup_InitFxn)(void);


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* execImplFxn */
#define xdc_runtime_Startup_execImplFxn xdc_runtime_Startup_exec__I
__extern xdc_Void xdc_runtime_Startup_exec__I(void);

/* SFxn */
typedef xdc_Int (*xdc_runtime_Startup_SFxn)(xdc_Int __arg1);

/* IdMap */
struct xdc_runtime_Startup_IdMap {
    xdc_UInt ind;
    xdc_runtime_Types_ModuleId modId;
};


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_runtime_Startup_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__diagsEnabled xdc_runtime_Startup_Module__diagsEnabled__C;
#ifdef xdc_runtime_Startup_Module__diagsEnabled__CR
#define xdc_runtime_Startup_Module__diagsEnabled__C (*((CT__xdc_runtime_Startup_Module__diagsEnabled*)(xdcRomConstPtr + xdc_runtime_Startup_Module__diagsEnabled__C_offset)))
#else
#define xdc_runtime_Startup_Module__diagsEnabled (xdc_runtime_Startup_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_runtime_Startup_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__diagsIncluded xdc_runtime_Startup_Module__diagsIncluded__C;
#ifdef xdc_runtime_Startup_Module__diagsIncluded__CR
#define xdc_runtime_Startup_Module__diagsIncluded__C (*((CT__xdc_runtime_Startup_Module__diagsIncluded*)(xdcRomConstPtr + xdc_runtime_Startup_Module__diagsIncluded__C_offset)))
#else
#define xdc_runtime_Startup_Module__diagsIncluded (xdc_runtime_Startup_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_runtime_Startup_Module__diagsMask;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__diagsMask xdc_runtime_Startup_Module__diagsMask__C;
#ifdef xdc_runtime_Startup_Module__diagsMask__CR
#define xdc_runtime_Startup_Module__diagsMask__C (*((CT__xdc_runtime_Startup_Module__diagsMask*)(xdcRomConstPtr + xdc_runtime_Startup_Module__diagsMask__C_offset)))
#else
#define xdc_runtime_Startup_Module__diagsMask (xdc_runtime_Startup_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_runtime_Startup_Module__gateObj;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__gateObj xdc_runtime_Startup_Module__gateObj__C;
#ifdef xdc_runtime_Startup_Module__gateObj__CR
#define xdc_runtime_Startup_Module__gateObj__C (*((CT__xdc_runtime_Startup_Module__gateObj*)(xdcRomConstPtr + xdc_runtime_Startup_Module__gateObj__C_offset)))
#else
#define xdc_runtime_Startup_Module__gateObj (xdc_runtime_Startup_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_runtime_Startup_Module__gatePrms;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__gatePrms xdc_runtime_Startup_Module__gatePrms__C;
#ifdef xdc_runtime_Startup_Module__gatePrms__CR
#define xdc_runtime_Startup_Module__gatePrms__C (*((CT__xdc_runtime_Startup_Module__gatePrms*)(xdcRomConstPtr + xdc_runtime_Startup_Module__gatePrms__C_offset)))
#else
#define xdc_runtime_Startup_Module__gatePrms (xdc_runtime_Startup_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_Startup_Module__id;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__id xdc_runtime_Startup_Module__id__C;
#ifdef xdc_runtime_Startup_Module__id__CR
#define xdc_runtime_Startup_Module__id__C (*((CT__xdc_runtime_Startup_Module__id*)(xdcRomConstPtr + xdc_runtime_Startup_Module__id__C_offset)))
#else
#define xdc_runtime_Startup_Module__id (xdc_runtime_Startup_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_runtime_Startup_Module__loggerDefined;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__loggerDefined xdc_runtime_Startup_Module__loggerDefined__C;
#ifdef xdc_runtime_Startup_Module__loggerDefined__CR
#define xdc_runtime_Startup_Module__loggerDefined__C (*((CT__xdc_runtime_Startup_Module__loggerDefined*)(xdcRomConstPtr + xdc_runtime_Startup_Module__loggerDefined__C_offset)))
#else
#define xdc_runtime_Startup_Module__loggerDefined (xdc_runtime_Startup_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_runtime_Startup_Module__loggerObj;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__loggerObj xdc_runtime_Startup_Module__loggerObj__C;
#ifdef xdc_runtime_Startup_Module__loggerObj__CR
#define xdc_runtime_Startup_Module__loggerObj__C (*((CT__xdc_runtime_Startup_Module__loggerObj*)(xdcRomConstPtr + xdc_runtime_Startup_Module__loggerObj__C_offset)))
#else
#define xdc_runtime_Startup_Module__loggerObj (xdc_runtime_Startup_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_Startup_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__loggerFxn0 xdc_runtime_Startup_Module__loggerFxn0__C;
#ifdef xdc_runtime_Startup_Module__loggerFxn0__CR
#define xdc_runtime_Startup_Module__loggerFxn0__C (*((CT__xdc_runtime_Startup_Module__loggerFxn0*)(xdcRomConstPtr + xdc_runtime_Startup_Module__loggerFxn0__C_offset)))
#else
#define xdc_runtime_Startup_Module__loggerFxn0 (xdc_runtime_Startup_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_Startup_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__loggerFxn1 xdc_runtime_Startup_Module__loggerFxn1__C;
#ifdef xdc_runtime_Startup_Module__loggerFxn1__CR
#define xdc_runtime_Startup_Module__loggerFxn1__C (*((CT__xdc_runtime_Startup_Module__loggerFxn1*)(xdcRomConstPtr + xdc_runtime_Startup_Module__loggerFxn1__C_offset)))
#else
#define xdc_runtime_Startup_Module__loggerFxn1 (xdc_runtime_Startup_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_Startup_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__loggerFxn2 xdc_runtime_Startup_Module__loggerFxn2__C;
#ifdef xdc_runtime_Startup_Module__loggerFxn2__CR
#define xdc_runtime_Startup_Module__loggerFxn2__C (*((CT__xdc_runtime_Startup_Module__loggerFxn2*)(xdcRomConstPtr + xdc_runtime_Startup_Module__loggerFxn2__C_offset)))
#else
#define xdc_runtime_Startup_Module__loggerFxn2 (xdc_runtime_Startup_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_Startup_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__loggerFxn4 xdc_runtime_Startup_Module__loggerFxn4__C;
#ifdef xdc_runtime_Startup_Module__loggerFxn4__CR
#define xdc_runtime_Startup_Module__loggerFxn4__C (*((CT__xdc_runtime_Startup_Module__loggerFxn4*)(xdcRomConstPtr + xdc_runtime_Startup_Module__loggerFxn4__C_offset)))
#else
#define xdc_runtime_Startup_Module__loggerFxn4 (xdc_runtime_Startup_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_Startup_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_runtime_Startup_Module__loggerFxn8 xdc_runtime_Startup_Module__loggerFxn8__C;
#ifdef xdc_runtime_Startup_Module__loggerFxn8__CR
#define xdc_runtime_Startup_Module__loggerFxn8__C (*((CT__xdc_runtime_Startup_Module__loggerFxn8*)(xdcRomConstPtr + xdc_runtime_Startup_Module__loggerFxn8__C_offset)))
#else
#define xdc_runtime_Startup_Module__loggerFxn8 (xdc_runtime_Startup_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_runtime_Startup_Object__count;
__extern __FAR__ const CT__xdc_runtime_Startup_Object__count xdc_runtime_Startup_Object__count__C;
#ifdef xdc_runtime_Startup_Object__count__CR
#define xdc_runtime_Startup_Object__count__C (*((CT__xdc_runtime_Startup_Object__count*)(xdcRomConstPtr + xdc_runtime_Startup_Object__count__C_offset)))
#else
#define xdc_runtime_Startup_Object__count (xdc_runtime_Startup_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_Startup_Object__heap;
__extern __FAR__ const CT__xdc_runtime_Startup_Object__heap xdc_runtime_Startup_Object__heap__C;
#ifdef xdc_runtime_Startup_Object__heap__CR
#define xdc_runtime_Startup_Object__heap__C (*((CT__xdc_runtime_Startup_Object__heap*)(xdcRomConstPtr + xdc_runtime_Startup_Object__heap__C_offset)))
#else
#define xdc_runtime_Startup_Object__heap (xdc_runtime_Startup_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_runtime_Startup_Object__sizeof;
__extern __FAR__ const CT__xdc_runtime_Startup_Object__sizeof xdc_runtime_Startup_Object__sizeof__C;
#ifdef xdc_runtime_Startup_Object__sizeof__CR
#define xdc_runtime_Startup_Object__sizeof__C (*((CT__xdc_runtime_Startup_Object__sizeof*)(xdcRomConstPtr + xdc_runtime_Startup_Object__sizeof__C_offset)))
#else
#define xdc_runtime_Startup_Object__sizeof (xdc_runtime_Startup_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_runtime_Startup_Object__table;
__extern __FAR__ const CT__xdc_runtime_Startup_Object__table xdc_runtime_Startup_Object__table__C;
#ifdef xdc_runtime_Startup_Object__table__CR
#define xdc_runtime_Startup_Object__table__C (*((CT__xdc_runtime_Startup_Object__table*)(xdcRomConstPtr + xdc_runtime_Startup_Object__table__C_offset)))
#else
#define xdc_runtime_Startup_Object__table (xdc_runtime_Startup_Object__table__C)
#endif

/* maxPasses */
typedef xdc_Int CT__xdc_runtime_Startup_maxPasses;
__extern __FAR__ const CT__xdc_runtime_Startup_maxPasses xdc_runtime_Startup_maxPasses__C;
#ifdef xdc_runtime_Startup_maxPasses__CR
#define xdc_runtime_Startup_maxPasses (*((CT__xdc_runtime_Startup_maxPasses*)(xdcRomConstPtr + xdc_runtime_Startup_maxPasses__C_offset)))
#else
#ifdef xdc_runtime_Startup_maxPasses__D
#define xdc_runtime_Startup_maxPasses (xdc_runtime_Startup_maxPasses__D)
#else
#define xdc_runtime_Startup_maxPasses (xdc_runtime_Startup_maxPasses__C)
#endif
#endif

/* firstFxns */
typedef xdc_runtime_Startup_InitFxn __T1_xdc_runtime_Startup_firstFxns;
typedef struct { int length; xdc_runtime_Startup_InitFxn *elem; } __ARRAY1_xdc_runtime_Startup_firstFxns;
typedef struct { int length; xdc_runtime_Startup_InitFxn const *elem; } __CARRAY1_xdc_runtime_Startup_firstFxns;
typedef __CARRAY1_xdc_runtime_Startup_firstFxns __TA_xdc_runtime_Startup_firstFxns;
typedef __CARRAY1_xdc_runtime_Startup_firstFxns CT__xdc_runtime_Startup_firstFxns;
__extern __FAR__ const CT__xdc_runtime_Startup_firstFxns xdc_runtime_Startup_firstFxns__C;
#ifdef xdc_runtime_Startup_firstFxns__CR
#define xdc_runtime_Startup_firstFxns (*((CT__xdc_runtime_Startup_firstFxns*)(xdcRomConstPtr + xdc_runtime_Startup_firstFxns__C_offset)))
#else
#define xdc_runtime_Startup_firstFxns (xdc_runtime_Startup_firstFxns__C)
#endif

/* lastFxns */
typedef xdc_runtime_Startup_InitFxn __T1_xdc_runtime_Startup_lastFxns;
typedef struct { int length; xdc_runtime_Startup_InitFxn *elem; } __ARRAY1_xdc_runtime_Startup_lastFxns;
typedef struct { int length; xdc_runtime_Startup_InitFxn const *elem; } __CARRAY1_xdc_runtime_Startup_lastFxns;
typedef __CARRAY1_xdc_runtime_Startup_lastFxns __TA_xdc_runtime_Startup_lastFxns;
typedef __CARRAY1_xdc_runtime_Startup_lastFxns CT__xdc_runtime_Startup_lastFxns;
__extern __FAR__ const CT__xdc_runtime_Startup_lastFxns xdc_runtime_Startup_lastFxns__C;
#ifdef xdc_runtime_Startup_lastFxns__CR
#define xdc_runtime_Startup_lastFxns (*((CT__xdc_runtime_Startup_lastFxns*)(xdcRomConstPtr + xdc_runtime_Startup_lastFxns__C_offset)))
#else
#define xdc_runtime_Startup_lastFxns (xdc_runtime_Startup_lastFxns__C)
#endif

/* startModsFxn */
typedef xdc_Void (*CT__xdc_runtime_Startup_startModsFxn)(xdc_Int __arg1[], xdc_Int __arg2);
__extern __FAR__ const CT__xdc_runtime_Startup_startModsFxn xdc_runtime_Startup_startModsFxn__C;
#ifdef xdc_runtime_Startup_startModsFxn__CR
#define xdc_runtime_Startup_startModsFxn (*((CT__xdc_runtime_Startup_startModsFxn*)(xdcRomConstPtr + xdc_runtime_Startup_startModsFxn__C_offset)))
#else
#define xdc_runtime_Startup_startModsFxn (xdc_runtime_Startup_startModsFxn__C)
#endif

/* execImpl */
typedef xdc_Void (*CT__xdc_runtime_Startup_execImpl)(void);
__extern __FAR__ const CT__xdc_runtime_Startup_execImpl xdc_runtime_Startup_execImpl__C;
#ifdef xdc_runtime_Startup_execImpl__CR
#define xdc_runtime_Startup_execImpl (*((CT__xdc_runtime_Startup_execImpl*)(xdcRomConstPtr + xdc_runtime_Startup_execImpl__C_offset)))
#else
#define xdc_runtime_Startup_execImpl (xdc_runtime_Startup_execImpl__C)
#endif

/* sfxnTab */
typedef xdc_runtime_Startup_SFxn __T1_xdc_runtime_Startup_sfxnTab;
typedef xdc_runtime_Startup_SFxn *__ARRAY1_xdc_runtime_Startup_sfxnTab;
typedef const xdc_runtime_Startup_SFxn *__CARRAY1_xdc_runtime_Startup_sfxnTab;
typedef __CARRAY1_xdc_runtime_Startup_sfxnTab __TA_xdc_runtime_Startup_sfxnTab;
typedef __CARRAY1_xdc_runtime_Startup_sfxnTab CT__xdc_runtime_Startup_sfxnTab;
__extern __FAR__ const CT__xdc_runtime_Startup_sfxnTab xdc_runtime_Startup_sfxnTab__C;
#ifdef xdc_runtime_Startup_sfxnTab__CR
#define xdc_runtime_Startup_sfxnTab (*((CT__xdc_runtime_Startup_sfxnTab*)(xdcRomConstPtr + xdc_runtime_Startup_sfxnTab__C_offset)))
#else
#define xdc_runtime_Startup_sfxnTab (xdc_runtime_Startup_sfxnTab__C)
#endif

/* sfxnRts */
typedef xdc_Bool __T1_xdc_runtime_Startup_sfxnRts;
typedef xdc_Bool *__ARRAY1_xdc_runtime_Startup_sfxnRts;
typedef const xdc_Bool *__CARRAY1_xdc_runtime_Startup_sfxnRts;
typedef __CARRAY1_xdc_runtime_Startup_sfxnRts __TA_xdc_runtime_Startup_sfxnRts;
typedef __CARRAY1_xdc_runtime_Startup_sfxnRts CT__xdc_runtime_Startup_sfxnRts;
__extern __FAR__ const CT__xdc_runtime_Startup_sfxnRts xdc_runtime_Startup_sfxnRts__C;
#ifdef xdc_runtime_Startup_sfxnRts__CR
#define xdc_runtime_Startup_sfxnRts (*((CT__xdc_runtime_Startup_sfxnRts*)(xdcRomConstPtr + xdc_runtime_Startup_sfxnRts__C_offset)))
#else
#define xdc_runtime_Startup_sfxnRts (xdc_runtime_Startup_sfxnRts__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_runtime_Startup_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(xdc_runtime_Startup_Module__startupDone__S, "xdc_runtime_Startup_Module__startupDone__S")
__extern xdc_Bool xdc_runtime_Startup_Module__startupDone__S( void );

/* exec__E */
#define xdc_runtime_Startup_exec xdc_runtime_Startup_exec__E
xdc__CODESECT(xdc_runtime_Startup_exec__E, "xdc_runtime_Startup_exec")
__extern xdc_Void xdc_runtime_Startup_exec__E( void );

/* rtsDone__E */
#define xdc_runtime_Startup_rtsDone xdc_runtime_Startup_rtsDone__E
xdc__CODESECT(xdc_runtime_Startup_rtsDone__E, "xdc_runtime_Startup_rtsDone")
__extern xdc_Bool xdc_runtime_Startup_rtsDone__E( void );

/* reset__I */
#define xdc_runtime_Startup_reset xdc_runtime_Startup_reset__I
xdc__CODESECT(xdc_runtime_Startup_reset__I, "xdc_runtime_Startup_reset")
__extern xdc_Void xdc_runtime_Startup_reset__I( void );

/* startMods__I */
#define xdc_runtime_Startup_startMods xdc_runtime_Startup_startMods__I
xdc__CODESECT(xdc_runtime_Startup_startMods__I, "xdc_runtime_Startup_startMods")
__extern xdc_Void xdc_runtime_Startup_startMods__I( xdc_Int state[], xdc_Int len );

/* getState__I */
#define xdc_runtime_Startup_getState xdc_runtime_Startup_getState__I
xdc__CODESECT(xdc_runtime_Startup_getState__I, "xdc_runtime_Startup_getState")
__extern xdc_Int xdc_runtime_Startup_getState__I( xdc_runtime_Types_ModuleId id );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_runtime_Startup_Module_startupDone() xdc_runtime_Startup_Module__startupDone__S()

/* Object_heap */
#define xdc_runtime_Startup_Object_heap() xdc_runtime_Startup_Object__heap__C

/* Module_heap */
#define xdc_runtime_Startup_Module_heap() xdc_runtime_Startup_Object__heap__C

/* Module_id */
static inline CT__xdc_runtime_Startup_Module__id xdc_runtime_Startup_Module_id(void);
static inline CT__xdc_runtime_Startup_Module__id xdc_runtime_Startup_Module_id( void ) 
{
    return xdc_runtime_Startup_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool xdc_runtime_Startup_Module_hasMask(void);
static inline xdc_Bool xdc_runtime_Startup_Module_hasMask(void) 
{
    return (xdc_Bool)(xdc_runtime_Startup_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 xdc_runtime_Startup_Module_getMask(void);
static inline xdc_Bits16 xdc_runtime_Startup_Module_getMask( void ) 
{
    return xdc_runtime_Startup_Module__diagsMask__C != NULL ? *xdc_runtime_Startup_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void xdc_runtime_Startup_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void xdc_runtime_Startup_Module_setMask(xdc_Bits16 mask)
{
    if (xdc_runtime_Startup_Module__diagsMask__C != NULL) {
        *xdc_runtime_Startup_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef xdc_runtime_Startup__top__
#undef __nested__
#endif

#endif /* xdc_runtime_Startup__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(xdc_runtime_Startup__internalaccess))

#ifndef xdc_runtime_Startup__include_state
#define xdc_runtime_Startup__include_state

/* Module_State */
struct xdc_runtime_Startup_Module_State {
    xdc_Int *stateTab;
    xdc_Bool execFlag;
    xdc_Bool rtsDoneFlag;
};

/* Module__state__V */
#ifndef xdc_runtime_Startup_Module__state__VR
extern struct xdc_runtime_Startup_Module_State__ xdc_runtime_Startup_Module__state__V;
#else
#define xdc_runtime_Startup_Module__state__V (*((struct xdc_runtime_Startup_Module_State__*)(xdcRomStatePtr + xdc_runtime_Startup_Module__state__V_offset)))
#endif

#endif /* xdc_runtime_Startup__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_runtime_Startup__nolocalnames)

#ifndef xdc_runtime_Startup__localnames__done
#define xdc_runtime_Startup__localnames__done

/* module prefix */
#define Startup_DONE xdc_runtime_Startup_DONE
#define Startup_NOTDONE xdc_runtime_Startup_NOTDONE
#define Startup_InitFxn xdc_runtime_Startup_InitFxn
#define Startup_execImplFxn xdc_runtime_Startup_execImplFxn
#define Startup_SFxn xdc_runtime_Startup_SFxn
#define Startup_IdMap xdc_runtime_Startup_IdMap
#define Startup_Module_State xdc_runtime_Startup_Module_State
#define Startup_maxPasses xdc_runtime_Startup_maxPasses
#define Startup_firstFxns xdc_runtime_Startup_firstFxns
#define Startup_lastFxns xdc_runtime_Startup_lastFxns
#define Startup_startModsFxn xdc_runtime_Startup_startModsFxn
#define Startup_execImpl xdc_runtime_Startup_execImpl
#define Startup_sfxnTab xdc_runtime_Startup_sfxnTab
#define Startup_sfxnRts xdc_runtime_Startup_sfxnRts
#define Startup_exec xdc_runtime_Startup_exec
#define Startup_rtsDone xdc_runtime_Startup_rtsDone
#define Startup_Module_name xdc_runtime_Startup_Module_name
#define Startup_Module_id xdc_runtime_Startup_Module_id
#define Startup_Module_startup xdc_runtime_Startup_Module_startup
#define Startup_Module_startupDone xdc_runtime_Startup_Module_startupDone
#define Startup_Module_hasMask xdc_runtime_Startup_Module_hasMask
#define Startup_Module_getMask xdc_runtime_Startup_Module_getMask
#define Startup_Module_setMask xdc_runtime_Startup_Module_setMask
#define Startup_Object_heap xdc_runtime_Startup_Object_heap
#define Startup_Module_heap xdc_runtime_Startup_Module_heap

#endif /* xdc_runtime_Startup__localnames__done */
#endif
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

