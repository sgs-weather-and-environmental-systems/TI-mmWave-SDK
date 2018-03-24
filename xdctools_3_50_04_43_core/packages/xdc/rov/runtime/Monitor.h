/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D17
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

#ifndef xdc_rov_runtime_Monitor__include
#define xdc_rov_runtime_Monitor__include

#ifndef __nested__
#define __nested__
#define xdc_rov_runtime_Monitor__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define xdc_rov_runtime_Monitor___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/rov/runtime/package/package.defs.h>

#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* UCharBuffer */
struct xdc_rov_runtime_Monitor_UCharBuffer {
    xdc_UChar elem;
};

/* Bits16Buffer */
struct xdc_rov_runtime_Monitor_Bits16Buffer {
    xdc_Bits16 elem;
};

/* Bits32Buffer */
struct xdc_rov_runtime_Monitor_Bits32Buffer {
    xdc_Bits32 elem;
};

/* MonState */
struct xdc_rov_runtime_Monitor_MonState {
    xdc_Char *buffer;
    xdc_Fxn read;
    xdc_Fxn write;
};


/*
 * ======== INTERNAL DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__xdc_rov_runtime_Monitor_Module__diagsEnabled;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__diagsEnabled xdc_rov_runtime_Monitor_Module__diagsEnabled__C;
#ifdef xdc_rov_runtime_Monitor_Module__diagsEnabled__CR
#define xdc_rov_runtime_Monitor_Module__diagsEnabled__C (*((CT__xdc_rov_runtime_Monitor_Module__diagsEnabled*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__diagsEnabled__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__diagsEnabled (xdc_rov_runtime_Monitor_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__xdc_rov_runtime_Monitor_Module__diagsIncluded;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__diagsIncluded xdc_rov_runtime_Monitor_Module__diagsIncluded__C;
#ifdef xdc_rov_runtime_Monitor_Module__diagsIncluded__CR
#define xdc_rov_runtime_Monitor_Module__diagsIncluded__C (*((CT__xdc_rov_runtime_Monitor_Module__diagsIncluded*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__diagsIncluded__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__diagsIncluded (xdc_rov_runtime_Monitor_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__xdc_rov_runtime_Monitor_Module__diagsMask;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__diagsMask xdc_rov_runtime_Monitor_Module__diagsMask__C;
#ifdef xdc_rov_runtime_Monitor_Module__diagsMask__CR
#define xdc_rov_runtime_Monitor_Module__diagsMask__C (*((CT__xdc_rov_runtime_Monitor_Module__diagsMask*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__diagsMask__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__diagsMask (xdc_rov_runtime_Monitor_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__xdc_rov_runtime_Monitor_Module__gateObj;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__gateObj xdc_rov_runtime_Monitor_Module__gateObj__C;
#ifdef xdc_rov_runtime_Monitor_Module__gateObj__CR
#define xdc_rov_runtime_Monitor_Module__gateObj__C (*((CT__xdc_rov_runtime_Monitor_Module__gateObj*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__gateObj__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__gateObj (xdc_rov_runtime_Monitor_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__xdc_rov_runtime_Monitor_Module__gatePrms;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__gatePrms xdc_rov_runtime_Monitor_Module__gatePrms__C;
#ifdef xdc_rov_runtime_Monitor_Module__gatePrms__CR
#define xdc_rov_runtime_Monitor_Module__gatePrms__C (*((CT__xdc_rov_runtime_Monitor_Module__gatePrms*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__gatePrms__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__gatePrms (xdc_rov_runtime_Monitor_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__xdc_rov_runtime_Monitor_Module__id;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__id xdc_rov_runtime_Monitor_Module__id__C;
#ifdef xdc_rov_runtime_Monitor_Module__id__CR
#define xdc_rov_runtime_Monitor_Module__id__C (*((CT__xdc_rov_runtime_Monitor_Module__id*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__id__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__id (xdc_rov_runtime_Monitor_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__xdc_rov_runtime_Monitor_Module__loggerDefined;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__loggerDefined xdc_rov_runtime_Monitor_Module__loggerDefined__C;
#ifdef xdc_rov_runtime_Monitor_Module__loggerDefined__CR
#define xdc_rov_runtime_Monitor_Module__loggerDefined__C (*((CT__xdc_rov_runtime_Monitor_Module__loggerDefined*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__loggerDefined__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__loggerDefined (xdc_rov_runtime_Monitor_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__xdc_rov_runtime_Monitor_Module__loggerObj;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__loggerObj xdc_rov_runtime_Monitor_Module__loggerObj__C;
#ifdef xdc_rov_runtime_Monitor_Module__loggerObj__CR
#define xdc_rov_runtime_Monitor_Module__loggerObj__C (*((CT__xdc_rov_runtime_Monitor_Module__loggerObj*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__loggerObj__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__loggerObj (xdc_rov_runtime_Monitor_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__xdc_rov_runtime_Monitor_Module__loggerFxn0;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__loggerFxn0 xdc_rov_runtime_Monitor_Module__loggerFxn0__C;
#ifdef xdc_rov_runtime_Monitor_Module__loggerFxn0__CR
#define xdc_rov_runtime_Monitor_Module__loggerFxn0__C (*((CT__xdc_rov_runtime_Monitor_Module__loggerFxn0*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__loggerFxn0__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__loggerFxn0 (xdc_rov_runtime_Monitor_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__xdc_rov_runtime_Monitor_Module__loggerFxn1;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__loggerFxn1 xdc_rov_runtime_Monitor_Module__loggerFxn1__C;
#ifdef xdc_rov_runtime_Monitor_Module__loggerFxn1__CR
#define xdc_rov_runtime_Monitor_Module__loggerFxn1__C (*((CT__xdc_rov_runtime_Monitor_Module__loggerFxn1*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__loggerFxn1__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__loggerFxn1 (xdc_rov_runtime_Monitor_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__xdc_rov_runtime_Monitor_Module__loggerFxn2;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__loggerFxn2 xdc_rov_runtime_Monitor_Module__loggerFxn2__C;
#ifdef xdc_rov_runtime_Monitor_Module__loggerFxn2__CR
#define xdc_rov_runtime_Monitor_Module__loggerFxn2__C (*((CT__xdc_rov_runtime_Monitor_Module__loggerFxn2*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__loggerFxn2__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__loggerFxn2 (xdc_rov_runtime_Monitor_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__xdc_rov_runtime_Monitor_Module__loggerFxn4;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__loggerFxn4 xdc_rov_runtime_Monitor_Module__loggerFxn4__C;
#ifdef xdc_rov_runtime_Monitor_Module__loggerFxn4__CR
#define xdc_rov_runtime_Monitor_Module__loggerFxn4__C (*((CT__xdc_rov_runtime_Monitor_Module__loggerFxn4*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__loggerFxn4__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__loggerFxn4 (xdc_rov_runtime_Monitor_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__xdc_rov_runtime_Monitor_Module__loggerFxn8;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Module__loggerFxn8 xdc_rov_runtime_Monitor_Module__loggerFxn8__C;
#ifdef xdc_rov_runtime_Monitor_Module__loggerFxn8__CR
#define xdc_rov_runtime_Monitor_Module__loggerFxn8__C (*((CT__xdc_rov_runtime_Monitor_Module__loggerFxn8*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Module__loggerFxn8__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Module__loggerFxn8 (xdc_rov_runtime_Monitor_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__xdc_rov_runtime_Monitor_Object__count;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Object__count xdc_rov_runtime_Monitor_Object__count__C;
#ifdef xdc_rov_runtime_Monitor_Object__count__CR
#define xdc_rov_runtime_Monitor_Object__count__C (*((CT__xdc_rov_runtime_Monitor_Object__count*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Object__count__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Object__count (xdc_rov_runtime_Monitor_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__xdc_rov_runtime_Monitor_Object__heap;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Object__heap xdc_rov_runtime_Monitor_Object__heap__C;
#ifdef xdc_rov_runtime_Monitor_Object__heap__CR
#define xdc_rov_runtime_Monitor_Object__heap__C (*((CT__xdc_rov_runtime_Monitor_Object__heap*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Object__heap__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Object__heap (xdc_rov_runtime_Monitor_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__xdc_rov_runtime_Monitor_Object__sizeof;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Object__sizeof xdc_rov_runtime_Monitor_Object__sizeof__C;
#ifdef xdc_rov_runtime_Monitor_Object__sizeof__CR
#define xdc_rov_runtime_Monitor_Object__sizeof__C (*((CT__xdc_rov_runtime_Monitor_Object__sizeof*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Object__sizeof__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Object__sizeof (xdc_rov_runtime_Monitor_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__xdc_rov_runtime_Monitor_Object__table;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_Object__table xdc_rov_runtime_Monitor_Object__table__C;
#ifdef xdc_rov_runtime_Monitor_Object__table__CR
#define xdc_rov_runtime_Monitor_Object__table__C (*((CT__xdc_rov_runtime_Monitor_Object__table*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_Object__table__C_offset)))
#else
#define xdc_rov_runtime_Monitor_Object__table (xdc_rov_runtime_Monitor_Object__table__C)
#endif

/* MAXCMDSIZE */
typedef xdc_Int CT__xdc_rov_runtime_Monitor_MAXCMDSIZE;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_MAXCMDSIZE xdc_rov_runtime_Monitor_MAXCMDSIZE__C;
#ifdef xdc_rov_runtime_Monitor_MAXCMDSIZE__CR
#define xdc_rov_runtime_Monitor_MAXCMDSIZE (*((CT__xdc_rov_runtime_Monitor_MAXCMDSIZE*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_MAXCMDSIZE__C_offset)))
#else
#ifdef xdc_rov_runtime_Monitor_MAXCMDSIZE__D
#define xdc_rov_runtime_Monitor_MAXCMDSIZE (xdc_rov_runtime_Monitor_MAXCMDSIZE__D)
#else
#define xdc_rov_runtime_Monitor_MAXCMDSIZE (xdc_rov_runtime_Monitor_MAXCMDSIZE__C)
#endif
#endif

/* STATEADDR */
typedef xdc_Ptr CT__xdc_rov_runtime_Monitor_STATEADDR;
__extern __FAR__ const CT__xdc_rov_runtime_Monitor_STATEADDR xdc_rov_runtime_Monitor_STATEADDR__C;
#ifdef xdc_rov_runtime_Monitor_STATEADDR__CR
#define xdc_rov_runtime_Monitor_STATEADDR (*((CT__xdc_rov_runtime_Monitor_STATEADDR*)(xdcRomConstPtr + xdc_rov_runtime_Monitor_STATEADDR__C_offset)))
#else
#define xdc_rov_runtime_Monitor_STATEADDR (xdc_rov_runtime_Monitor_STATEADDR__C)
#endif


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define xdc_rov_runtime_Monitor_Module_startup( state ) (-1)

/* Module__startupDone__S */
xdc__CODESECT(xdc_rov_runtime_Monitor_Module__startupDone__S, "xdc_rov_runtime_Monitor_Module__startupDone__S")
__extern xdc_Bool xdc_rov_runtime_Monitor_Module__startupDone__S( void );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define xdc_rov_runtime_Monitor_Module_startupDone() xdc_rov_runtime_Monitor_Module__startupDone__S()

/* Object_heap */
#define xdc_rov_runtime_Monitor_Object_heap() xdc_rov_runtime_Monitor_Object__heap__C

/* Module_heap */
#define xdc_rov_runtime_Monitor_Module_heap() xdc_rov_runtime_Monitor_Object__heap__C

/* Module_id */
static inline CT__xdc_rov_runtime_Monitor_Module__id xdc_rov_runtime_Monitor_Module_id( void ) 
{
    return xdc_rov_runtime_Monitor_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool xdc_rov_runtime_Monitor_Module_hasMask( void ) 
{
    return (xdc_Bool)(xdc_rov_runtime_Monitor_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 xdc_rov_runtime_Monitor_Module_getMask( void ) 
{
    return xdc_rov_runtime_Monitor_Module__diagsMask__C != NULL ? *xdc_rov_runtime_Monitor_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void xdc_rov_runtime_Monitor_Module_setMask( xdc_Bits16 mask ) 
{
    if (xdc_rov_runtime_Monitor_Module__diagsMask__C != NULL) {
        *xdc_rov_runtime_Monitor_Module__diagsMask__C = mask;
    }
}


/*
 * ======== EPILOGUE ========
 */

#ifdef xdc_rov_runtime_Monitor__top__
#undef __nested__
#endif

#endif /* xdc_rov_runtime_Monitor__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(xdc_rov_runtime_Monitor__internalaccess))

#ifndef xdc_rov_runtime_Monitor__include_state
#define xdc_rov_runtime_Monitor__include_state


#endif /* xdc_rov_runtime_Monitor__include_state */

#endif

/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(xdc_rov_runtime_Monitor__nolocalnames)

#ifndef xdc_rov_runtime_Monitor__localnames__done
#define xdc_rov_runtime_Monitor__localnames__done

/* module prefix */
#define Monitor_UCharBuffer xdc_rov_runtime_Monitor_UCharBuffer
#define Monitor_Bits16Buffer xdc_rov_runtime_Monitor_Bits16Buffer
#define Monitor_Bits32Buffer xdc_rov_runtime_Monitor_Bits32Buffer
#define Monitor_MonState xdc_rov_runtime_Monitor_MonState
#define Monitor_MAXCMDSIZE xdc_rov_runtime_Monitor_MAXCMDSIZE
#define Monitor_STATEADDR xdc_rov_runtime_Monitor_STATEADDR
#define Monitor_Module_name xdc_rov_runtime_Monitor_Module_name
#define Monitor_Module_id xdc_rov_runtime_Monitor_Module_id
#define Monitor_Module_startup xdc_rov_runtime_Monitor_Module_startup
#define Monitor_Module_startupDone xdc_rov_runtime_Monitor_Module_startupDone
#define Monitor_Module_hasMask xdc_rov_runtime_Monitor_Module_hasMask
#define Monitor_Module_getMask xdc_rov_runtime_Monitor_Module_getMask
#define Monitor_Module_setMask xdc_rov_runtime_Monitor_Module_setMask
#define Monitor_Object_heap xdc_rov_runtime_Monitor_Object_heap
#define Monitor_Module_heap xdc_rov_runtime_Monitor_Module_heap

#endif /* xdc_rov_runtime_Monitor__localnames__done */
#endif
