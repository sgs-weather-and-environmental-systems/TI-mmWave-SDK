/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D21
 */

#ifndef xdc_runtime_HeapMin__INTERNAL__
#define xdc_runtime_HeapMin__INTERNAL__

#ifndef xdc_runtime_HeapMin__internalaccess
#define xdc_runtime_HeapMin__internalaccess
#endif

#include <xdc/runtime/HeapMin.h>

#undef xdc_FILE__
#ifndef xdc_FILE
#define xdc_FILE__ NULL
#else
#define xdc_FILE__ xdc_FILE
#endif

/* getStats */
#undef xdc_runtime_HeapMin_getStats
#define xdc_runtime_HeapMin_getStats xdc_runtime_HeapMin_getStats__E

/* alloc */
#undef xdc_runtime_HeapMin_alloc
#define xdc_runtime_HeapMin_alloc xdc_runtime_HeapMin_alloc__E

/* free */
#undef xdc_runtime_HeapMin_free
#define xdc_runtime_HeapMin_free xdc_runtime_HeapMin_free__E

/* isBlocking */
#undef xdc_runtime_HeapMin_isBlocking
#define xdc_runtime_HeapMin_isBlocking xdc_runtime_HeapMin_isBlocking__E

/* Module_startup */
#undef xdc_runtime_HeapMin_Module_startup
#define xdc_runtime_HeapMin_Module_startup xdc_runtime_HeapMin_Module_startup__E

/* Instance_init */
#undef xdc_runtime_HeapMin_Instance_init
#define xdc_runtime_HeapMin_Instance_init xdc_runtime_HeapMin_Instance_init__E

/* Instance_finalize */
#undef xdc_runtime_HeapMin_Instance_finalize
#define xdc_runtime_HeapMin_Instance_finalize xdc_runtime_HeapMin_Instance_finalize__E

/* per-module runtime symbols */
#undef Module__MID
#ifdef xdc_runtime_HeapMin_Module__id__CR
#define Module__MID (*((CT__xdc_runtime_HeapMin_Module__id *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__id__C_offset)))
#else
#define Module__MID xdc_runtime_HeapMin_Module__id__C
#endif

#undef Module__DGSINCL
#ifdef xdc_runtime_HeapMin_Module__diagsIncluded__CR
#define Module__DGSINCL (*((CT__xdc_runtime_HeapMin_Module__diagsIncluded *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__diagsIncluded__C_offset)))
#else
#define Module__DGSINCL xdc_runtime_HeapMin_Module__diagsIncluded__C
#endif

#undef Module__DGSENAB
#ifdef xdc_runtime_HeapMin_Module__diagsEnabled__CR
#define Module__DGSENAB (*((CT__xdc_runtime_HeapMin_Module__diagsEnabled *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__diagsEnabled__C_offset)))
#else
#define Module__DGSENAB xdc_runtime_HeapMin_Module__diagsEnabled__C
#endif

#undef Module__DGSMASK
#ifdef xdc_runtime_HeapMin_Module__diagsMask__CR
#define Module__DGSMASK (*((CT__xdc_runtime_HeapMin_Module__diagsMask *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__diagsMask__C_offset)))
#else
#define Module__DGSMASK xdc_runtime_HeapMin_Module__diagsMask__C
#endif

#undef Module__LOGDEF
#ifdef xdc_runtime_HeapMin_Module__loggerDefined__CR
#define Module__LOGDEF (*((CT__xdc_runtime_HeapMin_Module__loggerDefined *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__loggerDefined__C_offset)))
#else
#define Module__LOGDEF xdc_runtime_HeapMin_Module__loggerDefined__C
#endif

#undef Module__LOGOBJ
#ifdef xdc_runtime_HeapMin_Module__loggerObj__CR
#define Module__LOGOBJ xdc_runtime_HeapMin_Module__loggerObj__R
#define Module__LOGOBJ (*((CT__xdc_runtime_HeapMin_Module__loggerObj *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__loggerObj__C_offset)))
#else
#define Module__LOGOBJ xdc_runtime_HeapMin_Module__loggerObj__C
#endif

#undef Module__LOGFXN0
#ifdef xdc_runtime_HeapMin_Module__loggerFxn0__CR
#define Module__LOGFXN0 (*((CT__xdc_runtime_HeapMin_Module__loggerFxn0 *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__loggerFxn0__C_offset)))
#else
#define Module__LOGFXN0 xdc_runtime_HeapMin_Module__loggerFxn0__C
#endif

#undef Module__LOGFXN1
#ifdef xdc_runtime_HeapMin_Module__loggerFxn1__CR
#define Module__LOGFXN1 (*((CT__xdc_runtime_HeapMin_Module__loggerFxn1 *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__loggerFxn1__C_offset)))
#else
#define Module__LOGFXN1 xdc_runtime_HeapMin_Module__loggerFxn1__C
#endif

#undef Module__LOGFXN2
#ifdef xdc_runtime_HeapMin_Module__loggerFxn2__CR
#define Module__LOGFXN2 (*((CT__xdc_runtime_HeapMin_Module__loggerFxn2 *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__loggerFxn2__C_offset)))
#else
#define Module__LOGFXN2 xdc_runtime_HeapMin_Module__loggerFxn2__C
#endif

#undef Module__LOGFXN4
#ifdef xdc_runtime_HeapMin_Module__loggerFxn4__CR
#define Module__LOGFXN4 (*((CT__xdc_runtime_HeapMin_Module__loggerFxn4 *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__loggerFxn4__C_offset)))
#else
#define Module__LOGFXN4 xdc_runtime_HeapMin_Module__loggerFxn4__C
#endif

#undef Module__LOGFXN8
#ifdef xdc_runtime_HeapMin_Module__loggerFxn8__CR
#define Module__LOGFXN8 (*((CT__xdc_runtime_HeapMin_Module__loggerFxn8 *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__loggerFxn8__C_offset)))
#else
#define Module__LOGFXN8 xdc_runtime_HeapMin_Module__loggerFxn8__C
#endif

#undef Module__G_OBJ
#ifdef xdc_runtime_HeapMin_Module__gateObj__CR
#define Module__G_OBJ (*((CT__xdc_runtime_HeapMin_Module__gateObj *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__gateObj__C_offset)))
#else
#define Module__G_OBJ xdc_runtime_HeapMin_Module__gateObj__C
#endif

#undef Module__G_PRMS
#ifdef xdc_runtime_HeapMin_Module__gatePrms__CR
#define Module__G_PRMS (*((CT__xdc_runtime_HeapMin_Module__gatePrms *)(xdcRomConstPtr + xdc_runtime_HeapMin_Module__gatePrms__C_offset)))
#else
#define Module__G_PRMS xdc_runtime_HeapMin_Module__gatePrms__C
#endif

#undef Module__GP_create
#define Module__GP_create xdc_runtime_HeapMin_Module_GateProxy_create
#undef Module__GP_delete
#define Module__GP_delete xdc_runtime_HeapMin_Module_GateProxy_delete
#undef Module__GP_enter
#define Module__GP_enter xdc_runtime_HeapMin_Module_GateProxy_enter
#undef Module__GP_leave
#define Module__GP_leave xdc_runtime_HeapMin_Module_GateProxy_leave
#undef Module__GP_query
#define Module__GP_query xdc_runtime_HeapMin_Module_GateProxy_query

/* Object__sizingError */
#line 1 "Error_inconsistent_object_size_in_xdc.runtime.HeapMin"
typedef char xdc_runtime_HeapMin_Object__sizingError[sizeof(xdc_runtime_HeapMin_Object) > sizeof(xdc_runtime_HeapMin_Struct) ? -1 : 1];


#endif /* xdc_runtime_HeapMin__INTERNAL____ */
