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
 *     CREATE ARGS
 *     INTERNAL DEFINITIONS
 *     MODULE-WIDE CONFIGS
 *     PER-INSTANCE TYPES
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

#ifndef ti_sysbios_io_GIO__include
#define ti_sysbios_io_GIO__include

#ifndef __nested__
#define __nested__
#define ti_sysbios_io_GIO__top__
#endif

#ifdef __cplusplus
#define __extern extern "C"
#else
#define __extern extern
#endif

#define ti_sysbios_io_GIO___VERS 200


/*
 * ======== INCLUDES ========
 */

#include <xdc/std.h>

#include <xdc/runtime/xdc.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/IInstance.h>
#include <ti/sysbios/io/package/package.defs.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/IHeap.h>
#include <xdc/runtime/knl/Sync.h>
#include <xdc/runtime/knl/ISync.h>
#include <ti/sysbios/io/DEV.h>
#include <ti/sysbios/knl/Queue.h>
#include <xdc/runtime/IModule.h>


/*
 * ======== AUXILIARY DEFINITIONS ========
 */

/* InitFxn */
typedef xdc_Void (*ti_sysbios_io_GIO_InitFxn)(void);

/* INPUT */
#define ti_sysbios_io_GIO_INPUT (0x1)

/* OUTPUT */
#define ti_sysbios_io_GIO_OUTPUT (0x2)

/* INOUT */
#define ti_sysbios_io_GIO_INOUT (0x3)

/* Model */
enum ti_sysbios_io_GIO_Model {
    ti_sysbios_io_GIO_Model_STANDARD,
    ti_sysbios_io_GIO_Model_ISSUERECLAIM
};
typedef enum ti_sysbios_io_GIO_Model ti_sysbios_io_GIO_Model;

/* TappCallBack */
typedef xdc_Void (*ti_sysbios_io_GIO_TappCallBack)(xdc_Ptr __arg1, xdc_Int __arg2, xdc_Ptr __arg3, xdc_SizeT __arg4);

/* AppCallback */
struct ti_sysbios_io_GIO_AppCallback {
    ti_sysbios_io_GIO_TappCallBack fxn;
    xdc_Ptr arg;
};


/*
 * ======== CREATE ARGS ========
 */

/* Args__create */
typedef struct ti_sysbios_io_GIO_Args__create {
    xdc_String name;
    xdc_UInt mode;
} ti_sysbios_io_GIO_Args__create;


/*
 * ======== INTERNAL DEFINITIONS ========
 */


/*
 * ======== MODULE-WIDE CONFIGS ========
 */

/* Module__diagsEnabled */
typedef xdc_Bits32 CT__ti_sysbios_io_GIO_Module__diagsEnabled;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__diagsEnabled ti_sysbios_io_GIO_Module__diagsEnabled__C;
#ifdef ti_sysbios_io_GIO_Module__diagsEnabled__CR
#define ti_sysbios_io_GIO_Module__diagsEnabled__C (*((CT__ti_sysbios_io_GIO_Module__diagsEnabled*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__diagsEnabled__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__diagsEnabled (ti_sysbios_io_GIO_Module__diagsEnabled__C)
#endif

/* Module__diagsIncluded */
typedef xdc_Bits32 CT__ti_sysbios_io_GIO_Module__diagsIncluded;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__diagsIncluded ti_sysbios_io_GIO_Module__diagsIncluded__C;
#ifdef ti_sysbios_io_GIO_Module__diagsIncluded__CR
#define ti_sysbios_io_GIO_Module__diagsIncluded__C (*((CT__ti_sysbios_io_GIO_Module__diagsIncluded*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__diagsIncluded__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__diagsIncluded (ti_sysbios_io_GIO_Module__diagsIncluded__C)
#endif

/* Module__diagsMask */
typedef xdc_Bits16 *CT__ti_sysbios_io_GIO_Module__diagsMask;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__diagsMask ti_sysbios_io_GIO_Module__diagsMask__C;
#ifdef ti_sysbios_io_GIO_Module__diagsMask__CR
#define ti_sysbios_io_GIO_Module__diagsMask__C (*((CT__ti_sysbios_io_GIO_Module__diagsMask*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__diagsMask__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__diagsMask (ti_sysbios_io_GIO_Module__diagsMask__C)
#endif

/* Module__gateObj */
typedef xdc_Ptr CT__ti_sysbios_io_GIO_Module__gateObj;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__gateObj ti_sysbios_io_GIO_Module__gateObj__C;
#ifdef ti_sysbios_io_GIO_Module__gateObj__CR
#define ti_sysbios_io_GIO_Module__gateObj__C (*((CT__ti_sysbios_io_GIO_Module__gateObj*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__gateObj__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__gateObj (ti_sysbios_io_GIO_Module__gateObj__C)
#endif

/* Module__gatePrms */
typedef xdc_Ptr CT__ti_sysbios_io_GIO_Module__gatePrms;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__gatePrms ti_sysbios_io_GIO_Module__gatePrms__C;
#ifdef ti_sysbios_io_GIO_Module__gatePrms__CR
#define ti_sysbios_io_GIO_Module__gatePrms__C (*((CT__ti_sysbios_io_GIO_Module__gatePrms*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__gatePrms__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__gatePrms (ti_sysbios_io_GIO_Module__gatePrms__C)
#endif

/* Module__id */
typedef xdc_runtime_Types_ModuleId CT__ti_sysbios_io_GIO_Module__id;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__id ti_sysbios_io_GIO_Module__id__C;
#ifdef ti_sysbios_io_GIO_Module__id__CR
#define ti_sysbios_io_GIO_Module__id__C (*((CT__ti_sysbios_io_GIO_Module__id*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__id__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__id (ti_sysbios_io_GIO_Module__id__C)
#endif

/* Module__loggerDefined */
typedef xdc_Bool CT__ti_sysbios_io_GIO_Module__loggerDefined;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__loggerDefined ti_sysbios_io_GIO_Module__loggerDefined__C;
#ifdef ti_sysbios_io_GIO_Module__loggerDefined__CR
#define ti_sysbios_io_GIO_Module__loggerDefined__C (*((CT__ti_sysbios_io_GIO_Module__loggerDefined*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__loggerDefined__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__loggerDefined (ti_sysbios_io_GIO_Module__loggerDefined__C)
#endif

/* Module__loggerObj */
typedef xdc_Ptr CT__ti_sysbios_io_GIO_Module__loggerObj;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__loggerObj ti_sysbios_io_GIO_Module__loggerObj__C;
#ifdef ti_sysbios_io_GIO_Module__loggerObj__CR
#define ti_sysbios_io_GIO_Module__loggerObj__C (*((CT__ti_sysbios_io_GIO_Module__loggerObj*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__loggerObj__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__loggerObj (ti_sysbios_io_GIO_Module__loggerObj__C)
#endif

/* Module__loggerFxn0 */
typedef xdc_runtime_Types_LoggerFxn0 CT__ti_sysbios_io_GIO_Module__loggerFxn0;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__loggerFxn0 ti_sysbios_io_GIO_Module__loggerFxn0__C;
#ifdef ti_sysbios_io_GIO_Module__loggerFxn0__CR
#define ti_sysbios_io_GIO_Module__loggerFxn0__C (*((CT__ti_sysbios_io_GIO_Module__loggerFxn0*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__loggerFxn0__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__loggerFxn0 (ti_sysbios_io_GIO_Module__loggerFxn0__C)
#endif

/* Module__loggerFxn1 */
typedef xdc_runtime_Types_LoggerFxn1 CT__ti_sysbios_io_GIO_Module__loggerFxn1;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__loggerFxn1 ti_sysbios_io_GIO_Module__loggerFxn1__C;
#ifdef ti_sysbios_io_GIO_Module__loggerFxn1__CR
#define ti_sysbios_io_GIO_Module__loggerFxn1__C (*((CT__ti_sysbios_io_GIO_Module__loggerFxn1*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__loggerFxn1__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__loggerFxn1 (ti_sysbios_io_GIO_Module__loggerFxn1__C)
#endif

/* Module__loggerFxn2 */
typedef xdc_runtime_Types_LoggerFxn2 CT__ti_sysbios_io_GIO_Module__loggerFxn2;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__loggerFxn2 ti_sysbios_io_GIO_Module__loggerFxn2__C;
#ifdef ti_sysbios_io_GIO_Module__loggerFxn2__CR
#define ti_sysbios_io_GIO_Module__loggerFxn2__C (*((CT__ti_sysbios_io_GIO_Module__loggerFxn2*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__loggerFxn2__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__loggerFxn2 (ti_sysbios_io_GIO_Module__loggerFxn2__C)
#endif

/* Module__loggerFxn4 */
typedef xdc_runtime_Types_LoggerFxn4 CT__ti_sysbios_io_GIO_Module__loggerFxn4;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__loggerFxn4 ti_sysbios_io_GIO_Module__loggerFxn4__C;
#ifdef ti_sysbios_io_GIO_Module__loggerFxn4__CR
#define ti_sysbios_io_GIO_Module__loggerFxn4__C (*((CT__ti_sysbios_io_GIO_Module__loggerFxn4*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__loggerFxn4__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__loggerFxn4 (ti_sysbios_io_GIO_Module__loggerFxn4__C)
#endif

/* Module__loggerFxn8 */
typedef xdc_runtime_Types_LoggerFxn8 CT__ti_sysbios_io_GIO_Module__loggerFxn8;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Module__loggerFxn8 ti_sysbios_io_GIO_Module__loggerFxn8__C;
#ifdef ti_sysbios_io_GIO_Module__loggerFxn8__CR
#define ti_sysbios_io_GIO_Module__loggerFxn8__C (*((CT__ti_sysbios_io_GIO_Module__loggerFxn8*)(xdcRomConstPtr + ti_sysbios_io_GIO_Module__loggerFxn8__C_offset)))
#else
#define ti_sysbios_io_GIO_Module__loggerFxn8 (ti_sysbios_io_GIO_Module__loggerFxn8__C)
#endif

/* Object__count */
typedef xdc_Int CT__ti_sysbios_io_GIO_Object__count;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Object__count ti_sysbios_io_GIO_Object__count__C;
#ifdef ti_sysbios_io_GIO_Object__count__CR
#define ti_sysbios_io_GIO_Object__count__C (*((CT__ti_sysbios_io_GIO_Object__count*)(xdcRomConstPtr + ti_sysbios_io_GIO_Object__count__C_offset)))
#else
#define ti_sysbios_io_GIO_Object__count (ti_sysbios_io_GIO_Object__count__C)
#endif

/* Object__heap */
typedef xdc_runtime_IHeap_Handle CT__ti_sysbios_io_GIO_Object__heap;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Object__heap ti_sysbios_io_GIO_Object__heap__C;
#ifdef ti_sysbios_io_GIO_Object__heap__CR
#define ti_sysbios_io_GIO_Object__heap__C (*((CT__ti_sysbios_io_GIO_Object__heap*)(xdcRomConstPtr + ti_sysbios_io_GIO_Object__heap__C_offset)))
#else
#define ti_sysbios_io_GIO_Object__heap (ti_sysbios_io_GIO_Object__heap__C)
#endif

/* Object__sizeof */
typedef xdc_SizeT CT__ti_sysbios_io_GIO_Object__sizeof;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Object__sizeof ti_sysbios_io_GIO_Object__sizeof__C;
#ifdef ti_sysbios_io_GIO_Object__sizeof__CR
#define ti_sysbios_io_GIO_Object__sizeof__C (*((CT__ti_sysbios_io_GIO_Object__sizeof*)(xdcRomConstPtr + ti_sysbios_io_GIO_Object__sizeof__C_offset)))
#else
#define ti_sysbios_io_GIO_Object__sizeof (ti_sysbios_io_GIO_Object__sizeof__C)
#endif

/* Object__table */
typedef xdc_Ptr CT__ti_sysbios_io_GIO_Object__table;
__extern __FAR__ const CT__ti_sysbios_io_GIO_Object__table ti_sysbios_io_GIO_Object__table__C;
#ifdef ti_sysbios_io_GIO_Object__table__CR
#define ti_sysbios_io_GIO_Object__table__C (*((CT__ti_sysbios_io_GIO_Object__table*)(xdcRomConstPtr + ti_sysbios_io_GIO_Object__table__C_offset)))
#else
#define ti_sysbios_io_GIO_Object__table (ti_sysbios_io_GIO_Object__table__C)
#endif

/* E_notFound */
typedef xdc_runtime_Error_Id CT__ti_sysbios_io_GIO_E_notFound;
__extern __FAR__ const CT__ti_sysbios_io_GIO_E_notFound ti_sysbios_io_GIO_E_notFound__C;
#ifdef ti_sysbios_io_GIO_E_notFound__CR
#define ti_sysbios_io_GIO_E_notFound (*((CT__ti_sysbios_io_GIO_E_notFound*)(xdcRomConstPtr + ti_sysbios_io_GIO_E_notFound__C_offset)))
#else
#define ti_sysbios_io_GIO_E_notFound (ti_sysbios_io_GIO_E_notFound__C)
#endif

/* E_createFailed */
typedef xdc_runtime_Error_Id CT__ti_sysbios_io_GIO_E_createFailed;
__extern __FAR__ const CT__ti_sysbios_io_GIO_E_createFailed ti_sysbios_io_GIO_E_createFailed__C;
#ifdef ti_sysbios_io_GIO_E_createFailed__CR
#define ti_sysbios_io_GIO_E_createFailed (*((CT__ti_sysbios_io_GIO_E_createFailed*)(xdcRomConstPtr + ti_sysbios_io_GIO_E_createFailed__C_offset)))
#else
#define ti_sysbios_io_GIO_E_createFailed (ti_sysbios_io_GIO_E_createFailed__C)
#endif

/* A_badModel */
typedef xdc_runtime_Assert_Id CT__ti_sysbios_io_GIO_A_badModel;
__extern __FAR__ const CT__ti_sysbios_io_GIO_A_badModel ti_sysbios_io_GIO_A_badModel__C;
#ifdef ti_sysbios_io_GIO_A_badModel__CR
#define ti_sysbios_io_GIO_A_badModel (*((CT__ti_sysbios_io_GIO_A_badModel*)(xdcRomConstPtr + ti_sysbios_io_GIO_A_badModel__C_offset)))
#else
#define ti_sysbios_io_GIO_A_badModel (ti_sysbios_io_GIO_A_badModel__C)
#endif

/* deviceTableSize */
typedef xdc_Int CT__ti_sysbios_io_GIO_deviceTableSize;
__extern __FAR__ const CT__ti_sysbios_io_GIO_deviceTableSize ti_sysbios_io_GIO_deviceTableSize__C;
#ifdef ti_sysbios_io_GIO_deviceTableSize__CR
#define ti_sysbios_io_GIO_deviceTableSize (*((CT__ti_sysbios_io_GIO_deviceTableSize*)(xdcRomConstPtr + ti_sysbios_io_GIO_deviceTableSize__C_offset)))
#else
#ifdef ti_sysbios_io_GIO_deviceTableSize__D
#define ti_sysbios_io_GIO_deviceTableSize (ti_sysbios_io_GIO_deviceTableSize__D)
#else
#define ti_sysbios_io_GIO_deviceTableSize (ti_sysbios_io_GIO_deviceTableSize__C)
#endif
#endif


/*
 * ======== PER-INSTANCE TYPES ========
 */

/* Params */
struct ti_sysbios_io_GIO_Params {
    size_t __size;
    const void *__self;
    void *__fxns;
    xdc_runtime_IInstance_Params *instance;
    ti_sysbios_io_GIO_Model model;
    xdc_Int numPackets;
    xdc_UInt timeout;
    xdc_runtime_knl_ISync_Handle sync;
    xdc_Ptr chanParams;
    xdc_Ptr packets;
    xdc_runtime_IInstance_Params __iprms;
};

/* Struct */
struct ti_sysbios_io_GIO_Struct {
    xdc_String __f0;
    xdc_UInt __f1;
    xdc_UInt __f2;
    xdc_UInt __f3;
    xdc_runtime_IHeap_Handle __f4;
    xdc_runtime_knl_ISync_Handle __f5;
    xdc_Bool __f6;
    xdc_Bool __f7;
    xdc_Ptr __f8;
    xdc_Int __f9;
    xdc_Int __f10;
    xdc_Int __f11;
    xdc_Int __f12;
    xdc_Ptr __f13;
    xdc_Ptr __f14;
    ti_sysbios_knl_Queue_Struct __f15;
    ti_sysbios_knl_Queue_Struct __f16;
    xdc_runtime_Types_CordAddr __name;
};


/*
 * ======== FUNCTION DECLARATIONS ========
 */

/* Module_startup */
#define ti_sysbios_io_GIO_Module_startup( state ) (-1)

/* Instance_init__E */
xdc__CODESECT(ti_sysbios_io_GIO_Instance_init__E, "ti_sysbios_io_GIO_Instance_init")
__extern xdc_Int ti_sysbios_io_GIO_Instance_init__E(ti_sysbios_io_GIO_Object *__obj, xdc_String name, xdc_UInt mode, const ti_sysbios_io_GIO_Params *__prms, xdc_runtime_Error_Block *__eb);

/* Instance_finalize__E */
xdc__CODESECT(ti_sysbios_io_GIO_Instance_finalize__E, "ti_sysbios_io_GIO_Instance_finalize")
__extern void ti_sysbios_io_GIO_Instance_finalize__E(ti_sysbios_io_GIO_Object *__obj, int __ec);

/* create */
xdc__CODESECT(ti_sysbios_io_GIO_create, "ti_sysbios_io_GIO_create")
__extern ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_create( xdc_String name, xdc_UInt mode, const ti_sysbios_io_GIO_Params *__prms, xdc_runtime_Error_Block *__eb );

/* construct */
xdc__CODESECT(ti_sysbios_io_GIO_construct, "ti_sysbios_io_GIO_construct")
__extern void ti_sysbios_io_GIO_construct( ti_sysbios_io_GIO_Struct *__obj, xdc_String name, xdc_UInt mode, const ti_sysbios_io_GIO_Params *__prms, xdc_runtime_Error_Block *__eb );

/* delete */
xdc__CODESECT(ti_sysbios_io_GIO_delete, "ti_sysbios_io_GIO_delete")
__extern void ti_sysbios_io_GIO_delete(ti_sysbios_io_GIO_Handle *instp);

/* destruct */
xdc__CODESECT(ti_sysbios_io_GIO_destruct, "ti_sysbios_io_GIO_destruct")
__extern void ti_sysbios_io_GIO_destruct(ti_sysbios_io_GIO_Struct *obj);

/* Handle__label__S */
xdc__CODESECT(ti_sysbios_io_GIO_Handle__label__S, "ti_sysbios_io_GIO_Handle__label__S")
__extern xdc_runtime_Types_Label *ti_sysbios_io_GIO_Handle__label__S( xdc_Ptr obj, xdc_runtime_Types_Label *lab );

/* Module__startupDone__S */
xdc__CODESECT(ti_sysbios_io_GIO_Module__startupDone__S, "ti_sysbios_io_GIO_Module__startupDone__S")
__extern xdc_Bool ti_sysbios_io_GIO_Module__startupDone__S( void );

/* Object__create__S */
xdc__CODESECT(ti_sysbios_io_GIO_Object__create__S, "ti_sysbios_io_GIO_Object__create__S")
__extern xdc_Ptr ti_sysbios_io_GIO_Object__create__S( xdc_CPtr __aa, const xdc_UChar *__pa, xdc_SizeT __psz, xdc_runtime_Error_Block *__eb );

/* Object__delete__S */
xdc__CODESECT(ti_sysbios_io_GIO_Object__delete__S, "ti_sysbios_io_GIO_Object__delete__S")
__extern xdc_Void ti_sysbios_io_GIO_Object__delete__S( xdc_Ptr instp );

/* Object__get__S */
xdc__CODESECT(ti_sysbios_io_GIO_Object__get__S, "ti_sysbios_io_GIO_Object__get__S")
__extern xdc_Ptr ti_sysbios_io_GIO_Object__get__S( xdc_Ptr oarr, xdc_Int i );

/* Object__first__S */
xdc__CODESECT(ti_sysbios_io_GIO_Object__first__S, "ti_sysbios_io_GIO_Object__first__S")
__extern xdc_Ptr ti_sysbios_io_GIO_Object__first__S( void );

/* Object__next__S */
xdc__CODESECT(ti_sysbios_io_GIO_Object__next__S, "ti_sysbios_io_GIO_Object__next__S")
__extern xdc_Ptr ti_sysbios_io_GIO_Object__next__S( xdc_Ptr obj );

/* Params__init__S */
xdc__CODESECT(ti_sysbios_io_GIO_Params__init__S, "ti_sysbios_io_GIO_Params__init__S")
__extern xdc_Void ti_sysbios_io_GIO_Params__init__S( xdc_Ptr dst, const xdc_Void *src, xdc_SizeT psz, xdc_SizeT isz );

/* addDevice__E */
#define ti_sysbios_io_GIO_addDevice ti_sysbios_io_GIO_addDevice__E
xdc__CODESECT(ti_sysbios_io_GIO_addDevice__E, "ti_sysbios_io_GIO_addDevice")
__extern xdc_Int ti_sysbios_io_GIO_addDevice__E( xdc_String name, xdc_Ptr fxns, ti_sysbios_io_GIO_InitFxn initFxn, xdc_Int devid, xdc_Ptr params );

/* removeDevice__E */
#define ti_sysbios_io_GIO_removeDevice ti_sysbios_io_GIO_removeDevice__E
xdc__CODESECT(ti_sysbios_io_GIO_removeDevice__E, "ti_sysbios_io_GIO_removeDevice")
__extern xdc_Int ti_sysbios_io_GIO_removeDevice__E( xdc_String name );

/* abort__E */
#define ti_sysbios_io_GIO_abort ti_sysbios_io_GIO_abort__E
xdc__CODESECT(ti_sysbios_io_GIO_abort__E, "ti_sysbios_io_GIO_abort")
__extern xdc_Int ti_sysbios_io_GIO_abort__E( ti_sysbios_io_GIO_Handle __inst );

/* control__E */
#define ti_sysbios_io_GIO_control ti_sysbios_io_GIO_control__E
xdc__CODESECT(ti_sysbios_io_GIO_control__E, "ti_sysbios_io_GIO_control")
__extern xdc_Int ti_sysbios_io_GIO_control__E( ti_sysbios_io_GIO_Handle __inst, xdc_UInt cmd, xdc_Ptr args );

/* flush__E */
#define ti_sysbios_io_GIO_flush ti_sysbios_io_GIO_flush__E
xdc__CODESECT(ti_sysbios_io_GIO_flush__E, "ti_sysbios_io_GIO_flush")
__extern xdc_Int ti_sysbios_io_GIO_flush__E( ti_sysbios_io_GIO_Handle __inst );

/* issue__E */
#define ti_sysbios_io_GIO_issue ti_sysbios_io_GIO_issue__E
xdc__CODESECT(ti_sysbios_io_GIO_issue__E, "ti_sysbios_io_GIO_issue")
__extern xdc_Int ti_sysbios_io_GIO_issue__E( ti_sysbios_io_GIO_Handle __inst, xdc_Ptr buf, xdc_SizeT size, xdc_UArg arg );

/* reclaim__E */
#define ti_sysbios_io_GIO_reclaim ti_sysbios_io_GIO_reclaim__E
xdc__CODESECT(ti_sysbios_io_GIO_reclaim__E, "ti_sysbios_io_GIO_reclaim")
__extern xdc_Int ti_sysbios_io_GIO_reclaim__E( ti_sysbios_io_GIO_Handle __inst, xdc_Ptr *pBuf, xdc_SizeT *pSize, xdc_UArg *pArg );

/* read__E */
#define ti_sysbios_io_GIO_read ti_sysbios_io_GIO_read__E
xdc__CODESECT(ti_sysbios_io_GIO_read__E, "ti_sysbios_io_GIO_read")
__extern xdc_Int ti_sysbios_io_GIO_read__E( ti_sysbios_io_GIO_Handle __inst, xdc_Ptr buf, xdc_SizeT *pSize );

/* write__E */
#define ti_sysbios_io_GIO_write ti_sysbios_io_GIO_write__E
xdc__CODESECT(ti_sysbios_io_GIO_write__E, "ti_sysbios_io_GIO_write")
__extern xdc_Int ti_sysbios_io_GIO_write__E( ti_sysbios_io_GIO_Handle __inst, xdc_Ptr buf, xdc_SizeT *pSize );

/* submit__E */
#define ti_sysbios_io_GIO_submit ti_sysbios_io_GIO_submit__E
xdc__CODESECT(ti_sysbios_io_GIO_submit__E, "ti_sysbios_io_GIO_submit")
__extern xdc_Int ti_sysbios_io_GIO_submit__E( ti_sysbios_io_GIO_Handle __inst, xdc_UInt cmd, xdc_Ptr buf, xdc_SizeT *pSize, ti_sysbios_io_GIO_AppCallback *appCallback );

/* prime__E */
#define ti_sysbios_io_GIO_prime ti_sysbios_io_GIO_prime__E
xdc__CODESECT(ti_sysbios_io_GIO_prime__E, "ti_sysbios_io_GIO_prime")
__extern xdc_Int ti_sysbios_io_GIO_prime__E( ti_sysbios_io_GIO_Handle __inst, xdc_Ptr buf, xdc_SizeT size, xdc_UArg arg );


/*
 * ======== SYSTEM FUNCTIONS ========
 */

/* Module_startupDone */
#define ti_sysbios_io_GIO_Module_startupDone() ti_sysbios_io_GIO_Module__startupDone__S()

/* Object_heap */
#define ti_sysbios_io_GIO_Object_heap() ti_sysbios_io_GIO_Object__heap__C

/* Module_heap */
#define ti_sysbios_io_GIO_Module_heap() ti_sysbios_io_GIO_Object__heap__C

/* Module_id */
static inline CT__ti_sysbios_io_GIO_Module__id ti_sysbios_io_GIO_Module_id(void);
static inline CT__ti_sysbios_io_GIO_Module__id ti_sysbios_io_GIO_Module_id( void ) 
{
    return ti_sysbios_io_GIO_Module__id__C;
}

/* Module_hasMask */
static inline xdc_Bool ti_sysbios_io_GIO_Module_hasMask(void);
static inline xdc_Bool ti_sysbios_io_GIO_Module_hasMask(void) 
{
    return (xdc_Bool)(ti_sysbios_io_GIO_Module__diagsMask__C != NULL);
}

/* Module_getMask */
static inline xdc_Bits16 ti_sysbios_io_GIO_Module_getMask(void);
static inline xdc_Bits16 ti_sysbios_io_GIO_Module_getMask( void ) 
{
    return ti_sysbios_io_GIO_Module__diagsMask__C != NULL ? *ti_sysbios_io_GIO_Module__diagsMask__C : (xdc_Bits16)0;
}

/* Module_setMask */
static inline xdc_Void ti_sysbios_io_GIO_Module_setMask(xdc_Bits16 mask);
static inline xdc_Void ti_sysbios_io_GIO_Module_setMask(xdc_Bits16 mask)
{
    if (ti_sysbios_io_GIO_Module__diagsMask__C != NULL) {
        *ti_sysbios_io_GIO_Module__diagsMask__C = mask;
    }
}

/* Params_init */
static inline void ti_sysbios_io_GIO_Params_init(ti_sysbios_io_GIO_Params *prms);
static inline void ti_sysbios_io_GIO_Params_init( ti_sysbios_io_GIO_Params *prms ) 
{
    if (prms) {
        ti_sysbios_io_GIO_Params__init__S(prms, 0, sizeof(ti_sysbios_io_GIO_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}

/* Params_copy */
static inline void ti_sysbios_io_GIO_Params_copy(ti_sysbios_io_GIO_Params *dst, const ti_sysbios_io_GIO_Params *src);
static inline void ti_sysbios_io_GIO_Params_copy(ti_sysbios_io_GIO_Params *dst, const ti_sysbios_io_GIO_Params *src) 
{
    if (dst) {
        ti_sysbios_io_GIO_Params__init__S(dst, (const void *)src, sizeof(ti_sysbios_io_GIO_Params), sizeof(xdc_runtime_IInstance_Params));
    }
}

/* Object_count */
#define ti_sysbios_io_GIO_Object_count() ti_sysbios_io_GIO_Object__count__C

/* Object_sizeof */
#define ti_sysbios_io_GIO_Object_sizeof() ti_sysbios_io_GIO_Object__sizeof__C

/* Object_get */
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_Object_get(ti_sysbios_io_GIO_Instance_State *oarr, int i);
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_Object_get(ti_sysbios_io_GIO_Instance_State *oarr, int i) 
{
    return (ti_sysbios_io_GIO_Handle)ti_sysbios_io_GIO_Object__get__S(oarr, i);
}

/* Object_first */
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_Object_first(void);
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_Object_first(void)
{
    return (ti_sysbios_io_GIO_Handle)ti_sysbios_io_GIO_Object__first__S();
}

/* Object_next */
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_Object_next(ti_sysbios_io_GIO_Object *obj);
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_Object_next(ti_sysbios_io_GIO_Object *obj)
{
    return (ti_sysbios_io_GIO_Handle)ti_sysbios_io_GIO_Object__next__S(obj);
}

/* Handle_label */
static inline xdc_runtime_Types_Label *ti_sysbios_io_GIO_Handle_label(ti_sysbios_io_GIO_Handle inst, xdc_runtime_Types_Label *lab);
static inline xdc_runtime_Types_Label *ti_sysbios_io_GIO_Handle_label(ti_sysbios_io_GIO_Handle inst, xdc_runtime_Types_Label *lab)
{
    return ti_sysbios_io_GIO_Handle__label__S(inst, lab);
}

/* Handle_name */
static inline xdc_String ti_sysbios_io_GIO_Handle_name(ti_sysbios_io_GIO_Handle inst);
static inline xdc_String ti_sysbios_io_GIO_Handle_name(ti_sysbios_io_GIO_Handle inst)
{
    xdc_runtime_Types_Label lab;
    return ti_sysbios_io_GIO_Handle__label__S(inst, &lab)->iname;
}

/* handle */
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_handle(ti_sysbios_io_GIO_Struct *str);
static inline ti_sysbios_io_GIO_Handle ti_sysbios_io_GIO_handle(ti_sysbios_io_GIO_Struct *str)
{
    return (ti_sysbios_io_GIO_Handle)str;
}

/* struct */
static inline ti_sysbios_io_GIO_Struct *ti_sysbios_io_GIO_struct(ti_sysbios_io_GIO_Handle inst);
static inline ti_sysbios_io_GIO_Struct *ti_sysbios_io_GIO_struct(ti_sysbios_io_GIO_Handle inst)
{
    return (ti_sysbios_io_GIO_Struct*)inst;
}


/*
 * ======== EPILOGUE ========
 */

#ifdef ti_sysbios_io_GIO__top__
#undef __nested__
#endif

#endif /* ti_sysbios_io_GIO__include */


/*
 * ======== STATE STRUCTURES ========
 */

#if defined(__config__) || (!defined(__nested__) && defined(ti_sysbios_io_GIO__internalaccess))

#ifndef ti_sysbios_io_GIO__include_state
#define ti_sysbios_io_GIO__include_state

/* Object */
struct ti_sysbios_io_GIO_Object {
    xdc_String name;
    xdc_UInt mode;
    xdc_UInt model;
    xdc_UInt timeout;
    xdc_runtime_IHeap_Handle packetHeap;
    xdc_runtime_knl_ISync_Handle sync;
    xdc_Bool userSync;
    xdc_Bool userPackets;
    xdc_Ptr packets;
    xdc_Int numPackets;
    xdc_Int freeCount;
    xdc_Int doneCount;
    xdc_Int submitCount;
    xdc_Ptr fxns;
    xdc_Ptr mdChan;
    char __dummy;
};

/* Instance_State_doneList */
#ifndef ti_sysbios_io_GIO_Instance_State_doneList__OR
__extern __FAR__ const xdc_SizeT ti_sysbios_io_GIO_Instance_State_doneList__O;
#endif
static inline ti_sysbios_knl_Queue_Handle ti_sysbios_io_GIO_Instance_State_doneList(ti_sysbios_io_GIO_Object *obj);
static inline ti_sysbios_knl_Queue_Handle ti_sysbios_io_GIO_Instance_State_doneList(ti_sysbios_io_GIO_Object *obj)
{
    return (ti_sysbios_knl_Queue_Handle)(((char*)obj) + ti_sysbios_io_GIO_Instance_State_doneList__O);
}

/* Instance_State_freeList */
#ifndef ti_sysbios_io_GIO_Instance_State_freeList__OR
__extern __FAR__ const xdc_SizeT ti_sysbios_io_GIO_Instance_State_freeList__O;
#endif
static inline ti_sysbios_knl_Queue_Handle ti_sysbios_io_GIO_Instance_State_freeList(ti_sysbios_io_GIO_Object *obj);
static inline ti_sysbios_knl_Queue_Handle ti_sysbios_io_GIO_Instance_State_freeList(ti_sysbios_io_GIO_Object *obj)
{
    return (ti_sysbios_knl_Queue_Handle)(((char*)obj) + ti_sysbios_io_GIO_Instance_State_freeList__O);
}

#endif /* ti_sysbios_io_GIO__include_state */

#endif


/*
 * ======== PREFIX ALIASES ========
 */

#if !defined(__nested__) && !defined(ti_sysbios_io_GIO__nolocalnames)

#ifndef ti_sysbios_io_GIO__localnames__done
#define ti_sysbios_io_GIO__localnames__done

/* module prefix */
#define GIO_Instance ti_sysbios_io_GIO_Instance
#define GIO_Handle ti_sysbios_io_GIO_Handle
#define GIO_Module ti_sysbios_io_GIO_Module
#define GIO_Object ti_sysbios_io_GIO_Object
#define GIO_Struct ti_sysbios_io_GIO_Struct
#define GIO_InitFxn ti_sysbios_io_GIO_InitFxn
#define GIO_INPUT ti_sysbios_io_GIO_INPUT
#define GIO_OUTPUT ti_sysbios_io_GIO_OUTPUT
#define GIO_INOUT ti_sysbios_io_GIO_INOUT
#define GIO_Model ti_sysbios_io_GIO_Model
#define GIO_TappCallBack ti_sysbios_io_GIO_TappCallBack
#define GIO_AppCallback ti_sysbios_io_GIO_AppCallback
#define GIO_Instance_State ti_sysbios_io_GIO_Instance_State
#define GIO_Model_STANDARD ti_sysbios_io_GIO_Model_STANDARD
#define GIO_Model_ISSUERECLAIM ti_sysbios_io_GIO_Model_ISSUERECLAIM
#define GIO_E_notFound ti_sysbios_io_GIO_E_notFound
#define GIO_E_createFailed ti_sysbios_io_GIO_E_createFailed
#define GIO_A_badModel ti_sysbios_io_GIO_A_badModel
#define GIO_deviceTableSize ti_sysbios_io_GIO_deviceTableSize
#define GIO_Instance_State_doneList ti_sysbios_io_GIO_Instance_State_doneList
#define GIO_Instance_State_freeList ti_sysbios_io_GIO_Instance_State_freeList
#define GIO_Params ti_sysbios_io_GIO_Params
#define GIO_addDevice ti_sysbios_io_GIO_addDevice
#define GIO_removeDevice ti_sysbios_io_GIO_removeDevice
#define GIO_abort ti_sysbios_io_GIO_abort
#define GIO_control ti_sysbios_io_GIO_control
#define GIO_flush ti_sysbios_io_GIO_flush
#define GIO_issue ti_sysbios_io_GIO_issue
#define GIO_reclaim ti_sysbios_io_GIO_reclaim
#define GIO_read ti_sysbios_io_GIO_read
#define GIO_write ti_sysbios_io_GIO_write
#define GIO_submit ti_sysbios_io_GIO_submit
#define GIO_prime ti_sysbios_io_GIO_prime
#define GIO_Module_name ti_sysbios_io_GIO_Module_name
#define GIO_Module_id ti_sysbios_io_GIO_Module_id
#define GIO_Module_startup ti_sysbios_io_GIO_Module_startup
#define GIO_Module_startupDone ti_sysbios_io_GIO_Module_startupDone
#define GIO_Module_hasMask ti_sysbios_io_GIO_Module_hasMask
#define GIO_Module_getMask ti_sysbios_io_GIO_Module_getMask
#define GIO_Module_setMask ti_sysbios_io_GIO_Module_setMask
#define GIO_Object_heap ti_sysbios_io_GIO_Object_heap
#define GIO_Module_heap ti_sysbios_io_GIO_Module_heap
#define GIO_construct ti_sysbios_io_GIO_construct
#define GIO_create ti_sysbios_io_GIO_create
#define GIO_handle ti_sysbios_io_GIO_handle
#define GIO_struct ti_sysbios_io_GIO_struct
#define GIO_Handle_label ti_sysbios_io_GIO_Handle_label
#define GIO_Handle_name ti_sysbios_io_GIO_Handle_name
#define GIO_Instance_init ti_sysbios_io_GIO_Instance_init
#define GIO_Object_count ti_sysbios_io_GIO_Object_count
#define GIO_Object_get ti_sysbios_io_GIO_Object_get
#define GIO_Object_first ti_sysbios_io_GIO_Object_first
#define GIO_Object_next ti_sysbios_io_GIO_Object_next
#define GIO_Object_sizeof ti_sysbios_io_GIO_Object_sizeof
#define GIO_Params_copy ti_sysbios_io_GIO_Params_copy
#define GIO_Params_init ti_sysbios_io_GIO_Params_init
#define GIO_Instance_finalize ti_sysbios_io_GIO_Instance_finalize
#define GIO_delete ti_sysbios_io_GIO_delete
#define GIO_destruct ti_sysbios_io_GIO_destruct

#endif /* ti_sysbios_io_GIO__localnames__done */
#endif
