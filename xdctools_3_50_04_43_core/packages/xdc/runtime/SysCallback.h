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

#ifndef xdc_runtime_SysCallback__include
#define xdc_runtime_SysCallback__include

#ifndef __nested__
#define __nested__
#define xdc_runtime_SysCallback__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_runtime_SysCallback___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/package/package.defs.h>

#include <xdc/runtime/ISystemSupport.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* AbortFxn */
typedef xdc_Void (*xdc_runtime_SysCallback_AbortFxn)(xdc_CString __arg1);

/* defaultAbort */
__extern xdc_Void xdc_runtime_SysCallback_defaultAbort(xdc_CString __arg1);

/* ExitFxn */
typedef xdc_Void (*xdc_runtime_SysCallback_ExitFxn)(xdc_Int __arg1);

/* defaultExit */
__extern xdc_Void xdc_runtime_SysCallback_defaultExit(xdc_Int __arg1);

/* FlushFxn */
typedef xdc_Void (*xdc_runtime_SysCallback_FlushFxn)(void);

/* defaultFlush */
__extern xdc_Void xdc_runtime_SysCallback_defaultFlush(void);

/* PutchFxn */
typedef xdc_Void (*xdc_runtime_SysCallback_PutchFxn)(xdc_Char __arg1);

/* defaultPutch */
__extern xdc_Void xdc_runtime_SysCallback_defaultPutch(xdc_Char __arg1);

/* ReadyFxn */
typedef xdc_Bool (*xdc_runtime_SysCallback_ReadyFxn)(void);

/* defaultReady */
__extern xdc_Bool xdc_runtime_SysCallback_defaultReady(void);


/*
 * ======== INTERNAL DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_runtime_SysCallback_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__diagsEnabled xdc_runtime_SysCallback_Module__diagsEnabled__C;
#ifdef xdc_runtime_SysCallback_Module__diagsEnabled__CR
#define xdc_runtime_SysCallback_Module__diagsEnabled__C (*((CT__xdc_runtime_SysCallback_Module__diagsEnabled*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__diagsEnabled__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__diagsEnabled (xdc_runtime_SysCallback_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_runtime_SysCallback_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__diagsIncluded xdc_runtime_SysCallback_Module__diagsIncluded__C;
#ifdef xdc_runtime_SysCallback_Module__diagsIncluded__CR
#define xdc_runtime_SysCallback_Module__diagsIncluded__C (*((CT__xdc_runtime_SysCallback_Module__diagsIncluded*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__diagsIncluded__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__diagsIncluded (xdc_runtime_SysCallback_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_runtime_SysCallback_Module__diagsMask;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__diagsMask xdc_runtime_SysCallback_Module__diagsMask__C;
#ifdef xdc_runtime_SysCallback_Module__diagsMask__CR
#define xdc_runtime_SysCallback_Module__diagsMask__C (*((CT__xdc_runtime_SysCallback_Module__diagsMask*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__diagsMask__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__diagsMask (xdc_runtime_SysCallback_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_runtime_SysCallback_Module__gateObj;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__gateObj xdc_runtime_SysCallback_Module__gateObj__C;
#ifdef xdc_runtime_SysCallback_Module__gateObj__CR
#define xdc_runtime_SysCallback_Module__gateObj__C (*((CT__xdc_runtime_SysCallback_Module__gateObj*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__gateObj__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__gateObj (xdc_runtime_SysCallback_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_runtime_SysCallback_Module__gatePrms;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__gatePrms xdc_runtime_SysCallback_Module__gatePrms__C;
#ifdef xdc_runtime_SysCallback_Module__gatePrms__CR
#define xdc_runtime_SysCallback_Module__gatePrms__C (*((CT__xdc_runtime_SysCallback_Module__gatePrms*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__gatePrms__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__gatePrms (xdc_runtime_SysCallback_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_SysCallback_Module__id;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__id xdc_runtime_SysCallback_Module__id__C;
#ifdef xdc_runtime_SysCallback_Module__id__CR
#define xdc_runtime_SysCallback_Module__id__C (*((CT__xdc_runtime_SysCallback_Module__id*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__id__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__id (xdc_runtime_SysCallback_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_runtime_SysCallback_Module__loggerDefined;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__loggerDefined xdc_runtime_SysCallback_Module__loggerDefined__C;
#ifdef xdc_runtime_SysCallback_Module__loggerDefined__CR
#define xdc_runtime_SysCallback_Module__loggerDefined__C (*((CT__xdc_runtime_SysCallback_Module__loggerDefined*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__loggerDefined__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__loggerDefined (xdc_runtime_SysCallback_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_runtime_SysCallback_Module__loggerObj;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__loggerObj xdc_runtime_SysCallback_Module__loggerObj__C;
#ifdef xdc_runtime_SysCallback_Module__loggerObj__CR
#define xdc_runtime_SysCallback_Module__loggerObj__C (*((CT__xdc_runtime_SysCallback_Module__loggerObj*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__loggerObj__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__loggerObj (xdc_runtime_SysCallback_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_SysCallback_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__loggerFxn0 xdc_runtime_SysCallback_Module__loggerFxn0__C;
#ifdef xdc_runtime_SysCallback_Module__loggerFxn0__CR
#define xdc_runtime_SysCallback_Module__loggerFxn0__C (*((CT__xdc_runtime_SysCallback_Module__loggerFxn0*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__loggerFxn0__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__loggerFxn0 (xdc_runtime_SysCallback_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_SysCallback_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__loggerFxn1 xdc_runtime_SysCallback_Module__loggerFxn1__C;
#ifdef xdc_runtime_SysCallback_Module__loggerFxn1__CR
#define xdc_runtime_SysCallback_Module__loggerFxn1__C (*((CT__xdc_runtime_SysCallback_Module__loggerFxn1*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__loggerFxn1__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__loggerFxn1 (xdc_runtime_SysCallback_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_SysCallback_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__loggerFxn2 xdc_runtime_SysCallback_Module__loggerFxn2__C;
#ifdef xdc_runtime_SysCallback_Module__loggerFxn2__CR
#define xdc_runtime_SysCallback_Module__loggerFxn2__C (*((CT__xdc_runtime_SysCallback_Module__loggerFxn2*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__loggerFxn2__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__loggerFxn2 (xdc_runtime_SysCallback_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_SysCallback_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__loggerFxn4 xdc_runtime_SysCallback_Module__loggerFxn4__C;
#ifdef xdc_runtime_SysCallback_Module__loggerFxn4__CR
#define xdc_runtime_SysCallback_Module__loggerFxn4__C (*((CT__xdc_runtime_SysCallback_Module__loggerFxn4*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__loggerFxn4__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__loggerFxn4 (xdc_runtime_SysCallback_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_SysCallback_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Module__loggerFxn8 xdc_runtime_SysCallback_Module__loggerFxn8__C;
#ifdef xdc_runtime_SysCallback_Module__loggerFxn8__CR
#define xdc_runtime_SysCallback_Module__loggerFxn8__C (*((CT__xdc_runtime_SysCallback_Module__loggerFxn8*)(xdcRomConstPtr + xdc_runtime_SysCallback_Module__loggerFxn8__C_offset)))
#else
#define xdc_runtime_SysCallback_Module__loggerFxn8 (xdc_runtime_SysCallback_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_runtime_SysCallback_Object__count;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Object__count xdc_runtime_SysCallback_Object__count__C;
#ifdef xdc_runtime_SysCallback_Object__count__CR
#define xdc_runtime_SysCallback_Object__count__C (*((CT__xdc_runtime_SysCallback_Object__count*)(xdcRomConstPtr + xdc_runtime_SysCallback_Object__count__C_offset)))
#else
#define xdc_runtime_SysCallback_Object__count (xdc_runtime_SysCallback_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_SysCallback_Object__heap;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Object__heap xdc_runtime_SysCallback_Object__heap__C;
#ifdef xdc_runtime_SysCallback_Object__heap__CR
#define xdc_runtime_SysCallback_Object__heap__C (*((CT__xdc_runtime_SysCallback_Object__heap*)(xdcRomConstPtr + xdc_runtime_SysCallback_Object__heap__C_offset)))
#else
#define xdc_runtime_SysCallback_Object__heap (xdc_runtime_SysCallback_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_runtime_SysCallback_Object__sizeof;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Object__sizeof xdc_runtime_SysCallback_Object__sizeof__C;
#ifdef xdc_runtime_SysCallback_Object__sizeof__CR
#define xdc_runtime_SysCallback_Object__sizeof__C (*((CT__xdc_runtime_SysCallback_Object__sizeof*)(xdcRomConstPtr + xdc_runtime_SysCallback_Object__sizeof__C_offset)))
#else
#define xdc_runtime_SysCallback_Object__sizeof (xdc_runtime_SysCallback_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_runtime_SysCallback_Object__table;
__extern __FAR__ const CT__xdc_runtime_SysCallback_Object__table xdc_runtime_SysCallback_Object__table__C;
#ifdef xdc_runtime_SysCallback_Object__table__CR
#define xdc_runtime_SysCallback_Object__table__C (*((CT__xdc_runtime_SysCallback_Object__table*)(xdcRomConstPtr + xdc_runtime_SysCallback_Object__table__C_offset)))
#else
#define xdc_runtime_SysCallback_Object__table (xdc_runtime_SysCallback_Object__table__C)
#endif

/* abortFxn */
typedef xdc_runtime_SysCallback_AbortFxn CT__xdc_runtime_SysCallback_abortFxn;
__extern __FAR__ const CT__xdc_runtime_SysCallback_abortFxn xdc_runtime_SysCallback_abortFxn__C;
#ifdef xdc_runtime_SysCallback_abortFxn__CR
#define xdc_runtime_SysCallback_abortFxn (*((CT__xdc_runtime_SysCallback_abortFxn*)(xdcRomConstPtr + xdc_runtime_SysCallback_abortFxn__C_offset)))
#else
#define xdc_runtime_SysCallback_abortFxn (xdc_runtime_SysCallback_abortFxn__C)
#endif

/* exitFxn */
typedef xdc_runtime_SysCallback_ExitFxn CT__xdc_runtime_SysCallback_exitFxn;
__extern __FAR__ const CT__xdc_runtime_SysCallback_exitFxn xdc_runtime_SysCallback_exitFxn__C;
#ifdef xdc_runtime_SysCallback_exitFxn__CR
#define xdc_runtime_SysCallback_exitFxn (*((CT__xdc_runtime_SysCallback_exitFxn*)(xdcRomConstPtr + xdc_runtime_SysCallback_exitFxn__C_offset)))
#else
#define xdc_runtime_SysCallback_exitFxn (xdc_runtime_SysCallback_exitFxn__C)
#endif

/* flushFxn */
typedef xdc_runtime_SysCallback_FlushFxn CT__xdc_runtime_SysCallback_flushFxn;
__extern __FAR__ const CT__xdc_runtime_SysCallback_flushFxn xdc_runtime_SysCallback_flushFxn__C;
#ifdef xdc_runtime_SysCallback_flushFxn__CR
#define xdc_runtime_SysCallback_flushFxn (*((CT__xdc_runtime_SysCallback_flushFxn*)(xdcRomConstPtr + xdc_runtime_SysCallback_flushFxn__C_offset)))
#else
#define xdc_runtime_SysCallback_flushFxn (xdc_runtime_SysCallback_flushFxn__C)
#endif

/* putchFxn */
typedef xdc_runtime_SysCallback_PutchFxn CT__xdc_runtime_SysCallback_putchFxn;
__extern __FAR__ const CT__xdc_runtime_SysCallback_putchFxn xdc_runtime_SysCallback_putchFxn__C;
#ifdef xdc_runtime_SysCallback_putchFxn__CR
#define xdc_runtime_SysCallback_putchFxn (*((CT__xdc_runtime_SysCallback_putchFxn*)(xdcRomConstPtr + xdc_runtime_SysCallback_putchFxn__C_offset)))
#else
#define xdc_runtime_SysCallback_putchFxn (xdc_runtime_SysCallback_putchFxn__C)
#endif

/* readyFxn */
typedef xdc_runtime_SysCallback_ReadyFxn CT__xdc_runtime_SysCallback_readyFxn;
__extern __FAR__ const CT__xdc_runtime_SysCallback_readyFxn xdc_runtime_SysCallback_readyFxn__C;
#ifdef xdc_runtime_SysCallback_readyFxn__CR
#define xdc_runtime_SysCallback_readyFxn (*((CT__xdc_runtime_SysCallback_readyFxn*)(xdcRomConstPtr + xdc_runtime_SysCallback_readyFxn__C_offset)))
#else
#define xdc_runtime_SysCallback_readyFxn (xdc_runtime_SysCallback_readyFxn__C)
#endif


/*
 * ======== VIRTUAL FUNCTIONS ========
 */

/* Fxns__ */
struct xdc_runtime_SysCallback_Fxns__ {
    const xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2* __sysp;
    xdc_Void (*abort)(xdc_CString str);
    xdc_Void (*exit)(xdc_Int stat);
    xdc_Void (*flush)(void);
    xdc_Void (*putch)(xdc_Char ch);
    xdc_Bool (*ready)(void);
    xdc_runtime_Types_SysFxns2 __sfxns;
};
#ifndef xdc_runtime_SysCallback_Module__FXNS__CR

/* Module__FXNS__C */
__extern const xdc_runtime_SysCallback_Fxns__ xdc_runtime_SysCallback_Module__FXNS__C;
#else
#define xdc_runtime_SysCallback_Module__FXNS__C (*(xdcRomConstPtr + xdc_runtime_SysCallback_Module__FXNS__C_offset))
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_runtime_SysCallback_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(xdc_runtime_SysCallback_Module__startupDone__S, "xdc_runtime_SysCallback_Module__startupDone__S")
__extern xdc_Bool xdc_runtime_SysCallback_Module__startupDone__S( void );

/* abort__E */
#define xdc_runtime_SysCallback_abort xdc_runtime_SysCallback_abort__E
xdc__CODESECT(xdc_runtime_SysCallback_abort__E, "xdc_runtime_SysCallback_abort")
__extern xdc_Void xdc_runtime_SysCallback_abort__E( xdc_CString str );

/* exit__E */
#define xdc_runtime_SysCallback_exit xdc_runtime_SysCallback_exit__E
xdc__CODESECT(xdc_runtime_SysCallback_exit__E, "xdc_runtime_SysCallback_exit")
__extern xdc_Void xdc_runtime_SysCallback_exit__E( xdc_Int stat );

/* flush__E */
#define xdc_runtime_SysCallback_flush xdc_runtime_SysCallback_flush__E
xdc__CODESECT(xdc_runtime_SysCallback_flush__E, "xdc_runtime_SysCallback_flush")
__extern xdc_Void xdc_runtime_SysCallback_flush__E( void );

/* putch__E */
#define xdc_runtime_SysCallback_putch xdc_runtime_SysCallback_putch__E
xdc__CODESECT(xdc_runtime_SysCallback_putch__E, "xdc_runtime_SysCallback_putch")
__extern xdc_Void xdc_runtime_SysCallback_putch__E( xdc_Char ch );

/* ready__E */
#define xdc_runtime_SysCallback_ready xdc_runtime_SysCallback_ready__E
xdc__CODESECT(xdc_runtime_SysCallback_ready__E, "xdc_runtime_SysCallback_ready")
__extern xdc_Bool xdc_runtime_SysCallback_ready__E( void );


/*
 * ======== CONVERTORS ========
 */

/* Module_upCast */
static inline xdc_runtime_ISystemSupport_Module xdc_runtime_SysCallback_Module_upCast(void);
static inline xdc_runtime_ISystemSupport_Module xdc_runtime_SysCallback_Module_upCast(void)
{
    return (xdc_runtime_ISystemSupport_Module)&xdc_runtime_SysCallback_Module__FXNS__C;
}

/* Module_to_xdc_runtime_ISystemSupport */
#define xdc_runtime_SysCallback_Module_to_xdc_runtime_ISystemSupport xdc_runtime_SysCallback_Module_upCast


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_runtime_SysCallback_Module_startupDone() xdc_runtime_SysCallback_Module__startupDone__S()

/* Object_heap */
#define xdc_runtime_SysCallback_Object_heap() xdc_runtime_SysCallback_Object__heap__C

/* Module_heap */
#define xdc_runtime_SysCallback_Module_heap() xdc_runtime_SysCallback_Object__heap__C

/* Module_id */
static inline CT__xdc_runtime_SysCallback_Module__id xdc_runtime_SysCallback_Module_id(void);
static inline CT__xdc_runtime_SysCallback_Module__id xdc_runtime_SysCallback_Module_id( void ) 
{
    return xdc_runtime_SysCallback_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool xdc_runtime_SysCallback_Module_hasMask(void);
static inline xdc_Bool xdc_runtime_SysCallback_Module_hasMask(void) 
{
    return (xdc_Bool)(xdc_runtime_SysCallback_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 xdc_runtime_SysCallback_Module_getMask(void);
static inline xdc_Bits16 xdc_runtime_SysCallback_Module_getMask( void ) 
{
    return xdc_runtime_SysCallback_Module__diagsMask__C != NULL ? *xdc_runtime_SysCallback_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void xdc_runtime_SysCallback_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void xdc_runtime_SysCallback_Module_setMask(xdc_Bits16 mask)
{
    if (xdc_runtime_SysCallback_Module__diagsMask__C != NULL) {
        *xdc_runtime_SysCallback_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef xdc_runtime_SysCallback__top__
#undef __nested__
#endif

#endif /* xdc_runtime_SysCallback__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(xdc_runtime_SysCallback__internalaccess))

#ifndef xdc_runtime_SysCallback__include_state
#define xdc_runtime_SysCallback__include_state


#endif /* xdc_runtime_SysCallback__include_state */

#endif

/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_runtime_SysCallback__nolocalnames)

#ifndef xdc_runtime_SysCallback__localnames__done
#define xdc_runtime_SysCallback__localnames__done

/* module prefix */
#define SysCallback_AbortFxn xdc_runtime_SysCallback_AbortFxn
#define SysCallback_defaultAbort xdc_runtime_SysCallback_defaultAbort
#define SysCallback_ExitFxn xdc_runtime_SysCallback_ExitFxn
#define SysCallback_defaultExit xdc_runtime_SysCallback_defaultExit
#define SysCallback_FlushFxn xdc_runtime_SysCallback_FlushFxn
#define SysCallback_defaultFlush xdc_runtime_SysCallback_defaultFlush
#define SysCallback_PutchFxn xdc_runtime_SysCallback_PutchFxn
#define SysCallback_defaultPutch xdc_runtime_SysCallback_defaultPutch
#define SysCallback_ReadyFxn xdc_runtime_SysCallback_ReadyFxn
#define SysCallback_defaultReady xdc_runtime_SysCallback_defaultReady
#define SysCallback_abortFxn xdc_runtime_SysCallback_abortFxn
#define SysCallback_exitFxn xdc_runtime_SysCallback_exitFxn
#define SysCallback_flushFxn xdc_runtime_SysCallback_flushFxn
#define SysCallback_putchFxn xdc_runtime_SysCallback_putchFxn
#define SysCallback_readyFxn xdc_runtime_SysCallback_readyFxn
#define SysCallback_abort xdc_runtime_SysCallback_abort
#define SysCallback_exit xdc_runtime_SysCallback_exit
#define SysCallback_flush xdc_runtime_SysCallback_flush
#define SysCallback_putch xdc_runtime_SysCallback_putch
#define SysCallback_ready xdc_runtime_SysCallback_ready
#define SysCallback_Module_name xdc_runtime_SysCallback_Module_name
#define SysCallback_Module_id xdc_runtime_SysCallback_Module_id
#define SysCallback_Module_startup xdc_runtime_SysCallback_Module_startup
#define SysCallback_Module_startupDone xdc_runtime_SysCallback_Module_startupDone
#define SysCallback_Module_hasMask xdc_runtime_SysCallback_Module_hasMask
#define SysCallback_Module_getMask xdc_runtime_SysCallback_Module_getMask
#define SysCallback_Module_setMask xdc_runtime_SysCallback_Module_setMask
#define SysCallback_Object_heap xdc_runtime_SysCallback_Object_heap
#define SysCallback_Module_heap xdc_runtime_SysCallback_Module_heap
#define SysCallback_Module_upCast xdc_runtime_SysCallback_Module_upCast
#define SysCallback_Module_to_xdc_runtime_ISystemSupport xdc_runtime_SysCallback_Module_to_xdc_runtime_ISystemSupport

#endif /* xdc_runtime_SysCallback__localnames__done */
#endif
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

