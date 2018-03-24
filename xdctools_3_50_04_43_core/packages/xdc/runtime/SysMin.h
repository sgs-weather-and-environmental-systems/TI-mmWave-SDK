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

#ifndef xdc_runtime_SysMin__include
#define xdc_runtime_SysMin__include

#ifndef __nested__
#define __nested__
#define xdc_runtime_SysMin__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_runtime_SysMin___VERS 200


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

/* OutputFxn */
typedef xdc_Void (*xdc_runtime_SysMin_OutputFxn)(xdc_Char* __arg1, xdc_UInt __arg2);


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* Module_State */
typedef xdc_Char __T1_xdc_runtime_SysMin_Module_State__outbuf;
typedef xdc_Char *__ARRAY1_xdc_runtime_SysMin_Module_State__outbuf;
typedef const xdc_Char *__CARRAY1_xdc_runtime_SysMin_Module_State__outbuf;
typedef __ARRAY1_xdc_runtime_SysMin_Module_State__outbuf __TA_xdc_runtime_SysMin_Module_State__outbuf;


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_runtime_SysMin_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__diagsEnabled xdc_runtime_SysMin_Module__diagsEnabled__C;
#ifdef xdc_runtime_SysMin_Module__diagsEnabled__CR
#define xdc_runtime_SysMin_Module__diagsEnabled__C (*((CT__xdc_runtime_SysMin_Module__diagsEnabled*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__diagsEnabled__C_offset)))
#else
#define xdc_runtime_SysMin_Module__diagsEnabled (xdc_runtime_SysMin_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_runtime_SysMin_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__diagsIncluded xdc_runtime_SysMin_Module__diagsIncluded__C;
#ifdef xdc_runtime_SysMin_Module__diagsIncluded__CR
#define xdc_runtime_SysMin_Module__diagsIncluded__C (*((CT__xdc_runtime_SysMin_Module__diagsIncluded*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__diagsIncluded__C_offset)))
#else
#define xdc_runtime_SysMin_Module__diagsIncluded (xdc_runtime_SysMin_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_runtime_SysMin_Module__diagsMask;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__diagsMask xdc_runtime_SysMin_Module__diagsMask__C;
#ifdef xdc_runtime_SysMin_Module__diagsMask__CR
#define xdc_runtime_SysMin_Module__diagsMask__C (*((CT__xdc_runtime_SysMin_Module__diagsMask*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__diagsMask__C_offset)))
#else
#define xdc_runtime_SysMin_Module__diagsMask (xdc_runtime_SysMin_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_runtime_SysMin_Module__gateObj;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__gateObj xdc_runtime_SysMin_Module__gateObj__C;
#ifdef xdc_runtime_SysMin_Module__gateObj__CR
#define xdc_runtime_SysMin_Module__gateObj__C (*((CT__xdc_runtime_SysMin_Module__gateObj*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__gateObj__C_offset)))
#else
#define xdc_runtime_SysMin_Module__gateObj (xdc_runtime_SysMin_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_runtime_SysMin_Module__gatePrms;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__gatePrms xdc_runtime_SysMin_Module__gatePrms__C;
#ifdef xdc_runtime_SysMin_Module__gatePrms__CR
#define xdc_runtime_SysMin_Module__gatePrms__C (*((CT__xdc_runtime_SysMin_Module__gatePrms*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__gatePrms__C_offset)))
#else
#define xdc_runtime_SysMin_Module__gatePrms (xdc_runtime_SysMin_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_runtime_SysMin_Module__id;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__id xdc_runtime_SysMin_Module__id__C;
#ifdef xdc_runtime_SysMin_Module__id__CR
#define xdc_runtime_SysMin_Module__id__C (*((CT__xdc_runtime_SysMin_Module__id*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__id__C_offset)))
#else
#define xdc_runtime_SysMin_Module__id (xdc_runtime_SysMin_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_runtime_SysMin_Module__loggerDefined;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__loggerDefined xdc_runtime_SysMin_Module__loggerDefined__C;
#ifdef xdc_runtime_SysMin_Module__loggerDefined__CR
#define xdc_runtime_SysMin_Module__loggerDefined__C (*((CT__xdc_runtime_SysMin_Module__loggerDefined*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__loggerDefined__C_offset)))
#else
#define xdc_runtime_SysMin_Module__loggerDefined (xdc_runtime_SysMin_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_runtime_SysMin_Module__loggerObj;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__loggerObj xdc_runtime_SysMin_Module__loggerObj__C;
#ifdef xdc_runtime_SysMin_Module__loggerObj__CR
#define xdc_runtime_SysMin_Module__loggerObj__C (*((CT__xdc_runtime_SysMin_Module__loggerObj*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__loggerObj__C_offset)))
#else
#define xdc_runtime_SysMin_Module__loggerObj (xdc_runtime_SysMin_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_runtime_SysMin_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__loggerFxn0 xdc_runtime_SysMin_Module__loggerFxn0__C;
#ifdef xdc_runtime_SysMin_Module__loggerFxn0__CR
#define xdc_runtime_SysMin_Module__loggerFxn0__C (*((CT__xdc_runtime_SysMin_Module__loggerFxn0*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__loggerFxn0__C_offset)))
#else
#define xdc_runtime_SysMin_Module__loggerFxn0 (xdc_runtime_SysMin_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_runtime_SysMin_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__loggerFxn1 xdc_runtime_SysMin_Module__loggerFxn1__C;
#ifdef xdc_runtime_SysMin_Module__loggerFxn1__CR
#define xdc_runtime_SysMin_Module__loggerFxn1__C (*((CT__xdc_runtime_SysMin_Module__loggerFxn1*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__loggerFxn1__C_offset)))
#else
#define xdc_runtime_SysMin_Module__loggerFxn1 (xdc_runtime_SysMin_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_runtime_SysMin_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__loggerFxn2 xdc_runtime_SysMin_Module__loggerFxn2__C;
#ifdef xdc_runtime_SysMin_Module__loggerFxn2__CR
#define xdc_runtime_SysMin_Module__loggerFxn2__C (*((CT__xdc_runtime_SysMin_Module__loggerFxn2*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__loggerFxn2__C_offset)))
#else
#define xdc_runtime_SysMin_Module__loggerFxn2 (xdc_runtime_SysMin_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_runtime_SysMin_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__loggerFxn4 xdc_runtime_SysMin_Module__loggerFxn4__C;
#ifdef xdc_runtime_SysMin_Module__loggerFxn4__CR
#define xdc_runtime_SysMin_Module__loggerFxn4__C (*((CT__xdc_runtime_SysMin_Module__loggerFxn4*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__loggerFxn4__C_offset)))
#else
#define xdc_runtime_SysMin_Module__loggerFxn4 (xdc_runtime_SysMin_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_runtime_SysMin_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_runtime_SysMin_Module__loggerFxn8 xdc_runtime_SysMin_Module__loggerFxn8__C;
#ifdef xdc_runtime_SysMin_Module__loggerFxn8__CR
#define xdc_runtime_SysMin_Module__loggerFxn8__C (*((CT__xdc_runtime_SysMin_Module__loggerFxn8*)(xdcRomConstPtr + xdc_runtime_SysMin_Module__loggerFxn8__C_offset)))
#else
#define xdc_runtime_SysMin_Module__loggerFxn8 (xdc_runtime_SysMin_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_runtime_SysMin_Object__count;
__extern __FAR__ const CT__xdc_runtime_SysMin_Object__count xdc_runtime_SysMin_Object__count__C;
#ifdef xdc_runtime_SysMin_Object__count__CR
#define xdc_runtime_SysMin_Object__count__C (*((CT__xdc_runtime_SysMin_Object__count*)(xdcRomConstPtr + xdc_runtime_SysMin_Object__count__C_offset)))
#else
#define xdc_runtime_SysMin_Object__count (xdc_runtime_SysMin_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_runtime_SysMin_Object__heap;
__extern __FAR__ const CT__xdc_runtime_SysMin_Object__heap xdc_runtime_SysMin_Object__heap__C;
#ifdef xdc_runtime_SysMin_Object__heap__CR
#define xdc_runtime_SysMin_Object__heap__C (*((CT__xdc_runtime_SysMin_Object__heap*)(xdcRomConstPtr + xdc_runtime_SysMin_Object__heap__C_offset)))
#else
#define xdc_runtime_SysMin_Object__heap (xdc_runtime_SysMin_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_runtime_SysMin_Object__sizeof;
__extern __FAR__ const CT__xdc_runtime_SysMin_Object__sizeof xdc_runtime_SysMin_Object__sizeof__C;
#ifdef xdc_runtime_SysMin_Object__sizeof__CR
#define xdc_runtime_SysMin_Object__sizeof__C (*((CT__xdc_runtime_SysMin_Object__sizeof*)(xdcRomConstPtr + xdc_runtime_SysMin_Object__sizeof__C_offset)))
#else
#define xdc_runtime_SysMin_Object__sizeof (xdc_runtime_SysMin_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_runtime_SysMin_Object__table;
__extern __FAR__ const CT__xdc_runtime_SysMin_Object__table xdc_runtime_SysMin_Object__table__C;
#ifdef xdc_runtime_SysMin_Object__table__CR
#define xdc_runtime_SysMin_Object__table__C (*((CT__xdc_runtime_SysMin_Object__table*)(xdcRomConstPtr + xdc_runtime_SysMin_Object__table__C_offset)))
#else
#define xdc_runtime_SysMin_Object__table (xdc_runtime_SysMin_Object__table__C)
#endif

/* bufSize */
typedef xdc_SizeT CT__xdc_runtime_SysMin_bufSize;
__extern __FAR__ const CT__xdc_runtime_SysMin_bufSize xdc_runtime_SysMin_bufSize__C;
#ifdef xdc_runtime_SysMin_bufSize__CR
#define xdc_runtime_SysMin_bufSize (*((CT__xdc_runtime_SysMin_bufSize*)(xdcRomConstPtr + xdc_runtime_SysMin_bufSize__C_offset)))
#else
#ifdef xdc_runtime_SysMin_bufSize__D
#define xdc_runtime_SysMin_bufSize (xdc_runtime_SysMin_bufSize__D)
#else
#define xdc_runtime_SysMin_bufSize (xdc_runtime_SysMin_bufSize__C)
#endif
#endif

/* flushAtExit */
typedef xdc_Bool CT__xdc_runtime_SysMin_flushAtExit;
__extern __FAR__ const CT__xdc_runtime_SysMin_flushAtExit xdc_runtime_SysMin_flushAtExit__C;
#ifdef xdc_runtime_SysMin_flushAtExit__CR
#define xdc_runtime_SysMin_flushAtExit (*((CT__xdc_runtime_SysMin_flushAtExit*)(xdcRomConstPtr + xdc_runtime_SysMin_flushAtExit__C_offset)))
#else
#ifdef xdc_runtime_SysMin_flushAtExit__D
#define xdc_runtime_SysMin_flushAtExit (xdc_runtime_SysMin_flushAtExit__D)
#else
#define xdc_runtime_SysMin_flushAtExit (xdc_runtime_SysMin_flushAtExit__C)
#endif
#endif

/* outputFxn */
typedef xdc_runtime_SysMin_OutputFxn CT__xdc_runtime_SysMin_outputFxn;
__extern __FAR__ const CT__xdc_runtime_SysMin_outputFxn xdc_runtime_SysMin_outputFxn__C;
#ifdef xdc_runtime_SysMin_outputFxn__CR
#define xdc_runtime_SysMin_outputFxn (*((CT__xdc_runtime_SysMin_outputFxn*)(xdcRomConstPtr + xdc_runtime_SysMin_outputFxn__C_offset)))
#else
#define xdc_runtime_SysMin_outputFxn (xdc_runtime_SysMin_outputFxn__C)
#endif

/* outputFunc */
typedef xdc_runtime_SysMin_OutputFxn CT__xdc_runtime_SysMin_outputFunc;
__extern __FAR__ const CT__xdc_runtime_SysMin_outputFunc xdc_runtime_SysMin_outputFunc__C;
#ifdef xdc_runtime_SysMin_outputFunc__CR
#define xdc_runtime_SysMin_outputFunc (*((CT__xdc_runtime_SysMin_outputFunc*)(xdcRomConstPtr + xdc_runtime_SysMin_outputFunc__C_offset)))
#else
#define xdc_runtime_SysMin_outputFunc (xdc_runtime_SysMin_outputFunc__C)
#endif


/*
 * ======== VIRTUAL FUNCTIONS ========
 */

/* Fxns__ */
struct xdc_runtime_SysMin_Fxns__ {
    const xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2* __sysp;
    xdc_Void (*abort)(xdc_CString str);
    xdc_Void (*exit)(xdc_Int stat);
    xdc_Void (*flush)(void);
    xdc_Void (*putch)(xdc_Char ch);
    xdc_Bool (*ready)(void);
    xdc_runtime_Types_SysFxns2 __sfxns;
};
#ifndef xdc_runtime_SysMin_Module__FXNS__CR

/* Module__FXNS__C */
__extern const xdc_runtime_SysMin_Fxns__ xdc_runtime_SysMin_Module__FXNS__C;
#else
#define xdc_runtime_SysMin_Module__FXNS__C (*(xdcRomConstPtr + xdc_runtime_SysMin_Module__FXNS__C_offset))
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_runtime_SysMin_Module_startup xdc_runtime_SysMin_Module_startup__E
xdc__CODESECT(xdc_runtime_SysMin_Module_startup__E, "xdc_runtime_SysMin_Module_startup")
__extern xdc_Int xdc_runtime_SysMin_Module_startup__E( xdc_Int state );
xdc__CODESECT(xdc_runtime_SysMin_Module_startup__F, "xdc_runtime_SysMin_Module_startup")
__extern xdc_Int xdc_runtime_SysMin_Module_startup__F( xdc_Int state );

/* Module__startupDone__S */
xdc__CODESECT(xdc_runtime_SysMin_Module__startupDone__S, "xdc_runtime_SysMin_Module__startupDone__S")
__extern xdc_Bool xdc_runtime_SysMin_Module__startupDone__S( void );

/* abort__E */
#define xdc_runtime_SysMin_abort xdc_runtime_SysMin_abort__E
xdc__CODESECT(xdc_runtime_SysMin_abort__E, "xdc_runtime_SysMin_abort")
__extern xdc_Void xdc_runtime_SysMin_abort__E( xdc_CString str );

/* exit__E */
#define xdc_runtime_SysMin_exit xdc_runtime_SysMin_exit__E
xdc__CODESECT(xdc_runtime_SysMin_exit__E, "xdc_runtime_SysMin_exit")
__extern xdc_Void xdc_runtime_SysMin_exit__E( xdc_Int stat );

/* flush__E */
#define xdc_runtime_SysMin_flush xdc_runtime_SysMin_flush__E
xdc__CODESECT(xdc_runtime_SysMin_flush__E, "xdc_runtime_SysMin_flush")
__extern xdc_Void xdc_runtime_SysMin_flush__E( void );

/* putch__E */
#define xdc_runtime_SysMin_putch xdc_runtime_SysMin_putch__E
xdc__CODESECT(xdc_runtime_SysMin_putch__E, "xdc_runtime_SysMin_putch")
__extern xdc_Void xdc_runtime_SysMin_putch__E( xdc_Char ch );

/* ready__E */
#define xdc_runtime_SysMin_ready xdc_runtime_SysMin_ready__E
xdc__CODESECT(xdc_runtime_SysMin_ready__E, "xdc_runtime_SysMin_ready")
__extern xdc_Bool xdc_runtime_SysMin_ready__E( void );

/* output__I */
#define xdc_runtime_SysMin_output xdc_runtime_SysMin_output__I
xdc__CODESECT(xdc_runtime_SysMin_output__I, "xdc_runtime_SysMin_output")
__extern xdc_Void xdc_runtime_SysMin_output__I( xdc_Char *buf, xdc_UInt size );


/*
 * ======== CONVERTORS ========
 */

/* Module_upCast */
static inline xdc_runtime_ISystemSupport_Module xdc_runtime_SysMin_Module_upCast(void);
static inline xdc_runtime_ISystemSupport_Module xdc_runtime_SysMin_Module_upCast(void)
{
    return (xdc_runtime_ISystemSupport_Module)&xdc_runtime_SysMin_Module__FXNS__C;
}

/* Module_to_xdc_runtime_ISystemSupport */
#define xdc_runtime_SysMin_Module_to_xdc_runtime_ISystemSupport xdc_runtime_SysMin_Module_upCast


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_runtime_SysMin_Module_startupDone() xdc_runtime_SysMin_Module__startupDone__S()

/* Object_heap */
#define xdc_runtime_SysMin_Object_heap() xdc_runtime_SysMin_Object__heap__C

/* Module_heap */
#define xdc_runtime_SysMin_Module_heap() xdc_runtime_SysMin_Object__heap__C

/* Module_id */
static inline CT__xdc_runtime_SysMin_Module__id xdc_runtime_SysMin_Module_id(void);
static inline CT__xdc_runtime_SysMin_Module__id xdc_runtime_SysMin_Module_id( void ) 
{
    return xdc_runtime_SysMin_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool xdc_runtime_SysMin_Module_hasMask(void);
static inline xdc_Bool xdc_runtime_SysMin_Module_hasMask(void) 
{
    return (xdc_Bool)(xdc_runtime_SysMin_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 xdc_runtime_SysMin_Module_getMask(void);
static inline xdc_Bits16 xdc_runtime_SysMin_Module_getMask( void ) 
{
    return xdc_runtime_SysMin_Module__diagsMask__C != NULL ? *xdc_runtime_SysMin_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void xdc_runtime_SysMin_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void xdc_runtime_SysMin_Module_setMask(xdc_Bits16 mask)
{
    if (xdc_runtime_SysMin_Module__diagsMask__C != NULL) {
        *xdc_runtime_SysMin_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef xdc_runtime_SysMin__top__
#undef __nested__
#endif

#endif /* xdc_runtime_SysMin__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(xdc_runtime_SysMin__internalaccess))

#ifndef xdc_runtime_SysMin__include_state
#define xdc_runtime_SysMin__include_state

/* Module_State */
struct xdc_runtime_SysMin_Module_State {
    __TA_xdc_runtime_SysMin_Module_State__outbuf outbuf;
    xdc_UInt outidx;
    xdc_Bool wrapped;
};

/* Module__state__V */
#ifndef xdc_runtime_SysMin_Module__state__VR
extern struct xdc_runtime_SysMin_Module_State__ xdc_runtime_SysMin_Module__state__V;
#else
#define xdc_runtime_SysMin_Module__state__V (*((struct xdc_runtime_SysMin_Module_State__*)(xdcRomStatePtr + xdc_runtime_SysMin_Module__state__V_offset)))
#endif

#endif /* xdc_runtime_SysMin__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_runtime_SysMin__nolocalnames)

#ifndef xdc_runtime_SysMin__localnames__done
#define xdc_runtime_SysMin__localnames__done

/* module prefix */
#define SysMin_OutputFxn xdc_runtime_SysMin_OutputFxn
#define SysMin_Module_State xdc_runtime_SysMin_Module_State
#define SysMin_bufSize xdc_runtime_SysMin_bufSize
#define SysMin_flushAtExit xdc_runtime_SysMin_flushAtExit
#define SysMin_outputFxn xdc_runtime_SysMin_outputFxn
#define SysMin_outputFunc xdc_runtime_SysMin_outputFunc
#define SysMin_abort xdc_runtime_SysMin_abort
#define SysMin_exit xdc_runtime_SysMin_exit
#define SysMin_flush xdc_runtime_SysMin_flush
#define SysMin_putch xdc_runtime_SysMin_putch
#define SysMin_ready xdc_runtime_SysMin_ready
#define SysMin_Module_name xdc_runtime_SysMin_Module_name
#define SysMin_Module_id xdc_runtime_SysMin_Module_id
#define SysMin_Module_startup xdc_runtime_SysMin_Module_startup
#define SysMin_Module_startupDone xdc_runtime_SysMin_Module_startupDone
#define SysMin_Module_hasMask xdc_runtime_SysMin_Module_hasMask
#define SysMin_Module_getMask xdc_runtime_SysMin_Module_getMask
#define SysMin_Module_setMask xdc_runtime_SysMin_Module_setMask
#define SysMin_Object_heap xdc_runtime_SysMin_Object_heap
#define SysMin_Module_heap xdc_runtime_SysMin_Module_heap
#define SysMin_Module_upCast xdc_runtime_SysMin_Module_upCast
#define SysMin_Module_to_xdc_runtime_ISystemSupport xdc_runtime_SysMin_Module_to_xdc_runtime_ISystemSupport

#endif /* xdc_runtime_SysMin__localnames__done */
#endif
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

