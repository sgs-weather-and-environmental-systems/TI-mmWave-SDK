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

#ifndef ti_sysbios_smp_SysMin__include
#define ti_sysbios_smp_SysMin__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_smp_SysMin__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_smp_SysMin___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <ti/sysbios/smp/SysMin__prologue.h>
#include <ti/sysbios/smp/package/package.defs.h>

#include <xdc/runtime/ISystemSupport.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* OutputFxn */
typedef xdc_Void (*ti_sysbios_smp_SysMin_OutputFxn)(xdc_Char* __arg1, xdc_UInt __arg2);


/*
 * ======== INTERNAL DEFINITIONS ========
 */

/* LineBuffer */
typedef xdc_Char __T1_ti_sysbios_smp_SysMin_LineBuffer__outbuf;
typedef xdc_Char __ARRAY1_ti_sysbios_smp_SysMin_LineBuffer__outbuf[256];
typedef xdc_Char __CARRAY1_ti_sysbios_smp_SysMin_LineBuffer__outbuf[256];
typedef __CARRAY1_ti_sysbios_smp_SysMin_LineBuffer__outbuf __TA_ti_sysbios_smp_SysMin_LineBuffer__outbuf;
struct ti_sysbios_smp_SysMin_LineBuffer {
    xdc_UInt outidx;
    __TA_ti_sysbios_smp_SysMin_LineBuffer__outbuf outbuf;
};

/* Module_State */
typedef ti_sysbios_smp_SysMin_LineBuffer __T1_ti_sysbios_smp_SysMin_Module_State__lineBuffers;
typedef ti_sysbios_smp_SysMin_LineBuffer *__ARRAY1_ti_sysbios_smp_SysMin_Module_State__lineBuffers;
typedef const ti_sysbios_smp_SysMin_LineBuffer *__CARRAY1_ti_sysbios_smp_SysMin_Module_State__lineBuffers;
typedef __ARRAY1_ti_sysbios_smp_SysMin_Module_State__lineBuffers __TA_ti_sysbios_smp_SysMin_Module_State__lineBuffers;
typedef xdc_Char __T1_ti_sysbios_smp_SysMin_Module_State__outbuf;
typedef xdc_Char *__ARRAY1_ti_sysbios_smp_SysMin_Module_State__outbuf;
typedef const xdc_Char *__CARRAY1_ti_sysbios_smp_SysMin_Module_State__outbuf;
typedef __ARRAY1_ti_sysbios_smp_SysMin_Module_State__outbuf __TA_ti_sysbios_smp_SysMin_Module_State__outbuf;


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_smp_SysMin_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__diagsEnabled ti_sysbios_smp_SysMin_Module__diagsEnabled__C;
#ifdef ti_sysbios_smp_SysMin_Module__diagsEnabled__CR
#define ti_sysbios_smp_SysMin_Module__diagsEnabled__C (*((CT__ti_sysbios_smp_SysMin_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__diagsEnabled (ti_sysbios_smp_SysMin_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_smp_SysMin_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__diagsIncluded ti_sysbios_smp_SysMin_Module__diagsIncluded__C;
#ifdef ti_sysbios_smp_SysMin_Module__diagsIncluded__CR
#define ti_sysbios_smp_SysMin_Module__diagsIncluded__C (*((CT__ti_sysbios_smp_SysMin_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__diagsIncluded (ti_sysbios_smp_SysMin_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_smp_SysMin_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__diagsMask ti_sysbios_smp_SysMin_Module__diagsMask__C;
#ifdef ti_sysbios_smp_SysMin_Module__diagsMask__CR
#define ti_sysbios_smp_SysMin_Module__diagsMask__C (*((CT__ti_sysbios_smp_SysMin_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__diagsMask (ti_sysbios_smp_SysMin_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_smp_SysMin_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__gateObj ti_sysbios_smp_SysMin_Module__gateObj__C;
#ifdef ti_sysbios_smp_SysMin_Module__gateObj__CR
#define ti_sysbios_smp_SysMin_Module__gateObj__C (*((CT__ti_sysbios_smp_SysMin_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__gateObj__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__gateObj (ti_sysbios_smp_SysMin_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_smp_SysMin_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__gatePrms ti_sysbios_smp_SysMin_Module__gatePrms__C;
#ifdef ti_sysbios_smp_SysMin_Module__gatePrms__CR
#define ti_sysbios_smp_SysMin_Module__gatePrms__C (*((CT__ti_sysbios_smp_SysMin_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__gatePrms (ti_sysbios_smp_SysMin_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_smp_SysMin_Module__id;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__id ti_sysbios_smp_SysMin_Module__id__C;
#ifdef ti_sysbios_smp_SysMin_Module__id__CR
#define ti_sysbios_smp_SysMin_Module__id__C (*((CT__ti_sysbios_smp_SysMin_Module__id*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__id__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__id (ti_sysbios_smp_SysMin_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_smp_SysMin_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__loggerDefined ti_sysbios_smp_SysMin_Module__loggerDefined__C;
#ifdef ti_sysbios_smp_SysMin_Module__loggerDefined__CR
#define ti_sysbios_smp_SysMin_Module__loggerDefined__C (*((CT__ti_sysbios_smp_SysMin_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__loggerDefined (ti_sysbios_smp_SysMin_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_smp_SysMin_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__loggerObj ti_sysbios_smp_SysMin_Module__loggerObj__C;
#ifdef ti_sysbios_smp_SysMin_Module__loggerObj__CR
#define ti_sysbios_smp_SysMin_Module__loggerObj__C (*((CT__ti_sysbios_smp_SysMin_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__loggerObj (ti_sysbios_smp_SysMin_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_smp_SysMin_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__loggerFxn0 ti_sysbios_smp_SysMin_Module__loggerFxn0__C;
#ifdef ti_sysbios_smp_SysMin_Module__loggerFxn0__CR
#define ti_sysbios_smp_SysMin_Module__loggerFxn0__C (*((CT__ti_sysbios_smp_SysMin_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__loggerFxn0 (ti_sysbios_smp_SysMin_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_smp_SysMin_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__loggerFxn1 ti_sysbios_smp_SysMin_Module__loggerFxn1__C;
#ifdef ti_sysbios_smp_SysMin_Module__loggerFxn1__CR
#define ti_sysbios_smp_SysMin_Module__loggerFxn1__C (*((CT__ti_sysbios_smp_SysMin_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__loggerFxn1 (ti_sysbios_smp_SysMin_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_smp_SysMin_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__loggerFxn2 ti_sysbios_smp_SysMin_Module__loggerFxn2__C;
#ifdef ti_sysbios_smp_SysMin_Module__loggerFxn2__CR
#define ti_sysbios_smp_SysMin_Module__loggerFxn2__C (*((CT__ti_sysbios_smp_SysMin_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__loggerFxn2 (ti_sysbios_smp_SysMin_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_smp_SysMin_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__loggerFxn4 ti_sysbios_smp_SysMin_Module__loggerFxn4__C;
#ifdef ti_sysbios_smp_SysMin_Module__loggerFxn4__CR
#define ti_sysbios_smp_SysMin_Module__loggerFxn4__C (*((CT__ti_sysbios_smp_SysMin_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__loggerFxn4 (ti_sysbios_smp_SysMin_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_smp_SysMin_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Module__loggerFxn8 ti_sysbios_smp_SysMin_Module__loggerFxn8__C;
#ifdef ti_sysbios_smp_SysMin_Module__loggerFxn8__CR
#define ti_sysbios_smp_SysMin_Module__loggerFxn8__C (*((CT__ti_sysbios_smp_SysMin_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Module__loggerFxn8 (ti_sysbios_smp_SysMin_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_smp_SysMin_Object__count;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Object__count ti_sysbios_smp_SysMin_Object__count__C;
#ifdef ti_sysbios_smp_SysMin_Object__count__CR
#define ti_sysbios_smp_SysMin_Object__count__C (*((CT__ti_sysbios_smp_SysMin_Object__count*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Object__count__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Object__count (ti_sysbios_smp_SysMin_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_smp_SysMin_Object__heap;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Object__heap ti_sysbios_smp_SysMin_Object__heap__C;
#ifdef ti_sysbios_smp_SysMin_Object__heap__CR
#define ti_sysbios_smp_SysMin_Object__heap__C (*((CT__ti_sysbios_smp_SysMin_Object__heap*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Object__heap__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Object__heap (ti_sysbios_smp_SysMin_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_smp_SysMin_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Object__sizeof ti_sysbios_smp_SysMin_Object__sizeof__C;
#ifdef ti_sysbios_smp_SysMin_Object__sizeof__CR
#define ti_sysbios_smp_SysMin_Object__sizeof__C (*((CT__ti_sysbios_smp_SysMin_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Object__sizeof__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Object__sizeof (ti_sysbios_smp_SysMin_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_smp_SysMin_Object__table;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_Object__table ti_sysbios_smp_SysMin_Object__table__C;
#ifdef ti_sysbios_smp_SysMin_Object__table__CR
#define ti_sysbios_smp_SysMin_Object__table__C (*((CT__ti_sysbios_smp_SysMin_Object__table*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_Object__table__C_offset)))
#else
#define ti_sysbios_smp_SysMin_Object__table (ti_sysbios_smp_SysMin_Object__table__C)
#endif

/* bufSize */
typedef xdc_SizeT CT__ti_sysbios_smp_SysMin_bufSize;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_bufSize ti_sysbios_smp_SysMin_bufSize__C;
#ifdef ti_sysbios_smp_SysMin_bufSize__CR
#define ti_sysbios_smp_SysMin_bufSize (*((CT__ti_sysbios_smp_SysMin_bufSize*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_bufSize__C_offset)))
#else
#ifdef ti_sysbios_smp_SysMin_bufSize__D
#define ti_sysbios_smp_SysMin_bufSize (ti_sysbios_smp_SysMin_bufSize__D)
#else
#define ti_sysbios_smp_SysMin_bufSize (ti_sysbios_smp_SysMin_bufSize__C)
#endif
#endif

/* flushAtExit */
typedef xdc_Bool CT__ti_sysbios_smp_SysMin_flushAtExit;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_flushAtExit ti_sysbios_smp_SysMin_flushAtExit__C;
#ifdef ti_sysbios_smp_SysMin_flushAtExit__CR
#define ti_sysbios_smp_SysMin_flushAtExit (*((CT__ti_sysbios_smp_SysMin_flushAtExit*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_flushAtExit__C_offset)))
#else
#ifdef ti_sysbios_smp_SysMin_flushAtExit__D
#define ti_sysbios_smp_SysMin_flushAtExit (ti_sysbios_smp_SysMin_flushAtExit__D)
#else
#define ti_sysbios_smp_SysMin_flushAtExit (ti_sysbios_smp_SysMin_flushAtExit__C)
#endif
#endif

/* outputFxn */
typedef ti_sysbios_smp_SysMin_OutputFxn CT__ti_sysbios_smp_SysMin_outputFxn;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_outputFxn ti_sysbios_smp_SysMin_outputFxn__C;
#ifdef ti_sysbios_smp_SysMin_outputFxn__CR
#define ti_sysbios_smp_SysMin_outputFxn (*((CT__ti_sysbios_smp_SysMin_outputFxn*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_outputFxn__C_offset)))
#else
#define ti_sysbios_smp_SysMin_outputFxn (ti_sysbios_smp_SysMin_outputFxn__C)
#endif

/* outputFunc */
typedef ti_sysbios_smp_SysMin_OutputFxn CT__ti_sysbios_smp_SysMin_outputFunc;
__extern __FAR__ const CT__ti_sysbios_smp_SysMin_outputFunc ti_sysbios_smp_SysMin_outputFunc__C;
#ifdef ti_sysbios_smp_SysMin_outputFunc__CR
#define ti_sysbios_smp_SysMin_outputFunc (*((CT__ti_sysbios_smp_SysMin_outputFunc*)(xdcRomConstPtr + ti_sysbios_smp_SysMin_outputFunc__C_offset)))
#else
#define ti_sysbios_smp_SysMin_outputFunc (ti_sysbios_smp_SysMin_outputFunc__C)
#endif


/*
 * ======== VIRTUAL FUNCTIONS ========
 */

/* Fxns__ */
struct ti_sysbios_smp_SysMin_Fxns__ {
    const xdc_runtime_Types_Base* __base;
    const xdc_runtime_Types_SysFxns2* __sysp;
    xdc_Void (*abort)(xdc_CString str);
    xdc_Void (*exit)(xdc_Int stat);
    xdc_Void (*flush)(void);
    xdc_Void (*putch)(xdc_Char ch);
    xdc_Bool (*ready)(void);
    xdc_runtime_Types_SysFxns2 __sfxns;
};
#ifndef ti_sysbios_smp_SysMin_Module__FXNS__CR

/* Module__FXNS__C */
__extern const ti_sysbios_smp_SysMin_Fxns__ ti_sysbios_smp_SysMin_Module__FXNS__C;
#else
#define ti_sysbios_smp_SysMin_Module__FXNS__C (*(xdcRomConstPtr + ti_sysbios_smp_SysMin_Module__FXNS__C_offset))
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_smp_SysMin_Module_startup ti_sysbios_smp_SysMin_Module_startup__E
xdc__CODESECT(ti_sysbios_smp_SysMin_Module_startup__E, "ti_sysbios_smp_SysMin_Module_startup")
__extern xdc_Int ti_sysbios_smp_SysMin_Module_startup__E( xdc_Int state );
xdc__CODESECT(ti_sysbios_smp_SysMin_Module_startup__F, "ti_sysbios_smp_SysMin_Module_startup")
__extern xdc_Int ti_sysbios_smp_SysMin_Module_startup__F( xdc_Int state );

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_smp_SysMin_Module__startupDone__S, "ti_sysbios_smp_SysMin_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_smp_SysMin_Module__startupDone__S( void );

/* abort__E */
#define ti_sysbios_smp_SysMin_abort ti_sysbios_smp_SysMin_abort__E
xdc__CODESECT(ti_sysbios_smp_SysMin_abort__E, "ti_sysbios_smp_SysMin_abort")
__extern xdc_Void ti_sysbios_smp_SysMin_abort__E( xdc_CString str );

/* exit__E */
#define ti_sysbios_smp_SysMin_exit ti_sysbios_smp_SysMin_exit__E
xdc__CODESECT(ti_sysbios_smp_SysMin_exit__E, "ti_sysbios_smp_SysMin_exit")
__extern xdc_Void ti_sysbios_smp_SysMin_exit__E( xdc_Int stat );

/* flush__E */
#define ti_sysbios_smp_SysMin_flush ti_sysbios_smp_SysMin_flush__E
xdc__CODESECT(ti_sysbios_smp_SysMin_flush__E, "ti_sysbios_smp_SysMin_flush")
__extern xdc_Void ti_sysbios_smp_SysMin_flush__E( void );

/* putch__E */
#define ti_sysbios_smp_SysMin_putch ti_sysbios_smp_SysMin_putch__E
xdc__CODESECT(ti_sysbios_smp_SysMin_putch__E, "ti_sysbios_smp_SysMin_putch")
__extern xdc_Void ti_sysbios_smp_SysMin_putch__E( xdc_Char ch );

/* ready__E */
#define ti_sysbios_smp_SysMin_ready ti_sysbios_smp_SysMin_ready__E
xdc__CODESECT(ti_sysbios_smp_SysMin_ready__E, "ti_sysbios_smp_SysMin_ready")
__extern xdc_Bool ti_sysbios_smp_SysMin_ready__E( void );

/* output__I */
#define ti_sysbios_smp_SysMin_output ti_sysbios_smp_SysMin_output__I
xdc__CODESECT(ti_sysbios_smp_SysMin_output__I, "ti_sysbios_smp_SysMin_output")
__extern xdc_Void ti_sysbios_smp_SysMin_output__I( xdc_Char *buf, xdc_UInt size );


/*
 * ======== CONVERTORS ========
 */

/* Module_upCast */
static inline xdc_runtime_ISystemSupport_Module ti_sysbios_smp_SysMin_Module_upCast(void);
static inline xdc_runtime_ISystemSupport_Module ti_sysbios_smp_SysMin_Module_upCast(void)
{
    return (xdc_runtime_ISystemSupport_Module)&ti_sysbios_smp_SysMin_Module__FXNS__C;
}

/* Module_to_xdc_runtime_ISystemSupport */
#define ti_sysbios_smp_SysMin_Module_to_xdc_runtime_ISystemSupport ti_sysbios_smp_SysMin_Module_upCast


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_smp_SysMin_Module_startupDone() ti_sysbios_smp_SysMin_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_smp_SysMin_Object_heap() ti_sysbios_smp_SysMin_Object__heap__C

/* Module_heap */
#define ti_sysbios_smp_SysMin_Module_heap() ti_sysbios_smp_SysMin_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_smp_SysMin_Module__id ti_sysbios_smp_SysMin_Module_id(void);
static inline CT__ti_sysbios_smp_SysMin_Module__id ti_sysbios_smp_SysMin_Module_id( void ) 
{
    return ti_sysbios_smp_SysMin_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_smp_SysMin_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_smp_SysMin_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_smp_SysMin_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_smp_SysMin_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_smp_SysMin_Module_getMask( void ) 
{
    return ti_sysbios_smp_SysMin_Module__diagsMask__C != NULL ? *ti_sysbios_smp_SysMin_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_smp_SysMin_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_smp_SysMin_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_smp_SysMin_Module__diagsMask__C != NULL) {
        *ti_sysbios_smp_SysMin_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#include <ti/sysbios/smp/SysMin__epilogue.h>

#ifdef ti_sysbios_smp_SysMin__top__
#undef __nested__
#endif

#endif /* ti_sysbios_smp_SysMin__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_smp_SysMin__internalaccess))

#ifndef ti_sysbios_smp_SysMin__include_state
#define ti_sysbios_smp_SysMin__include_state

/* Module_State */
struct ti_sysbios_smp_SysMin_Module_State {
    __TA_ti_sysbios_smp_SysMin_Module_State__lineBuffers lineBuffers;
    __TA_ti_sysbios_smp_SysMin_Module_State__outbuf outbuf;
    xdc_UInt outidx;
    xdc_Bool wrapped;
};

/* Module__state__V */
#ifndef ti_sysbios_smp_SysMin_Module__state__VR
extern struct ti_sysbios_smp_SysMin_Module_State__ ti_sysbios_smp_SysMin_Module__state__V;
#else
#define ti_sysbios_smp_SysMin_Module__state__V (*((struct ti_sysbios_smp_SysMin_Module_State__*)(xdcRomStatePtr + ti_sysbios_smp_SysMin_Module__state__V_offset)))
#endif

#endif /* ti_sysbios_smp_SysMin__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_smp_SysMin__nolocalnames)

#ifndef ti_sysbios_smp_SysMin__localnames__done
#define ti_sysbios_smp_SysMin__localnames__done

/* module prefix */
#define SysMin_OutputFxn ti_sysbios_smp_SysMin_OutputFxn
#define SysMin_LineBuffer ti_sysbios_smp_SysMin_LineBuffer
#define SysMin_Module_State ti_sysbios_smp_SysMin_Module_State
#define SysMin_bufSize ti_sysbios_smp_SysMin_bufSize
#define SysMin_flushAtExit ti_sysbios_smp_SysMin_flushAtExit
#define SysMin_outputFxn ti_sysbios_smp_SysMin_outputFxn
#define SysMin_outputFunc ti_sysbios_smp_SysMin_outputFunc
#define SysMin_abort ti_sysbios_smp_SysMin_abort
#define SysMin_exit ti_sysbios_smp_SysMin_exit
#define SysMin_flush ti_sysbios_smp_SysMin_flush
#define SysMin_putch ti_sysbios_smp_SysMin_putch
#define SysMin_ready ti_sysbios_smp_SysMin_ready
#define SysMin_Module_name ti_sysbios_smp_SysMin_Module_name
#define SysMin_Module_id ti_sysbios_smp_SysMin_Module_id
#define SysMin_Module_startup ti_sysbios_smp_SysMin_Module_startup
#define SysMin_Module_startupDone ti_sysbios_smp_SysMin_Module_startupDone
#define SysMin_Module_hasMask ti_sysbios_smp_SysMin_Module_hasMask
#define SysMin_Module_getMask ti_sysbios_smp_SysMin_Module_getMask
#define SysMin_Module_setMask ti_sysbios_smp_SysMin_Module_setMask
#define SysMin_Object_heap ti_sysbios_smp_SysMin_Object_heap
#define SysMin_Module_heap ti_sysbios_smp_SysMin_Module_heap
#define SysMin_Module_upCast ti_sysbios_smp_SysMin_Module_upCast
#define SysMin_Module_to_xdc_runtime_ISystemSupport ti_sysbios_smp_SysMin_Module_to_xdc_runtime_ISystemSupport

#endif /* ti_sysbios_smp_SysMin__localnames__done */
#endif
