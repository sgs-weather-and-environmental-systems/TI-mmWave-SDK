/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D20
 */

#ifndef ti_sysbios_family_arm_v7r_Cache__INTERNAL__
#define ti_sysbios_family_arm_v7r_Cache__INTERNAL__

#ifndef ti_sysbios_family_arm_v7r_Cache__internalaccess
#define ti_sysbios_family_arm_v7r_Cache__internalaccess
#endif

#include <ti/sysbios/family/arm/v7r/Cache.h>

#undef xdc_FILE__
#ifndef xdc_FILE
#define xdc_FILE__ NULL
#else
#define xdc_FILE__ xdc_FILE
#endif

/* enable */
#undef ti_sysbios_family_arm_v7r_Cache_enable
#define ti_sysbios_family_arm_v7r_Cache_enable ti_sysbios_family_arm_v7r_Cache_enable__E

/* inv */
#undef ti_sysbios_family_arm_v7r_Cache_inv
#define ti_sysbios_family_arm_v7r_Cache_inv ti_sysbios_family_arm_v7r_Cache_inv__E

/* wb */
#undef ti_sysbios_family_arm_v7r_Cache_wb
#define ti_sysbios_family_arm_v7r_Cache_wb ti_sysbios_family_arm_v7r_Cache_wb__E

/* wbInv */
#undef ti_sysbios_family_arm_v7r_Cache_wbInv
#define ti_sysbios_family_arm_v7r_Cache_wbInv ti_sysbios_family_arm_v7r_Cache_wbInv__E

/* wbAll */
#undef ti_sysbios_family_arm_v7r_Cache_wbAll
#define ti_sysbios_family_arm_v7r_Cache_wbAll ti_sysbios_family_arm_v7r_Cache_wbAll__E

/* wbInvAll */
#undef ti_sysbios_family_arm_v7r_Cache_wbInvAll
#define ti_sysbios_family_arm_v7r_Cache_wbInvAll ti_sysbios_family_arm_v7r_Cache_wbInvAll__E

/* wait */
#undef ti_sysbios_family_arm_v7r_Cache_wait
#define ti_sysbios_family_arm_v7r_Cache_wait ti_sysbios_family_arm_v7r_Cache_wait__E

/* disable */
#undef ti_sysbios_family_arm_v7r_Cache_disable
#define ti_sysbios_family_arm_v7r_Cache_disable ti_sysbios_family_arm_v7r_Cache_disable__E

/* getEnabled */
#undef ti_sysbios_family_arm_v7r_Cache_getEnabled
#define ti_sysbios_family_arm_v7r_Cache_getEnabled ti_sysbios_family_arm_v7r_Cache_getEnabled__E

/* invL1dAll */
#undef ti_sysbios_family_arm_v7r_Cache_invL1dAll
#define ti_sysbios_family_arm_v7r_Cache_invL1dAll ti_sysbios_family_arm_v7r_Cache_invL1dAll__E

/* invL1pAll */
#undef ti_sysbios_family_arm_v7r_Cache_invL1pAll
#define ti_sysbios_family_arm_v7r_Cache_invL1pAll ti_sysbios_family_arm_v7r_Cache_invL1pAll__E

/* enableBP */
#undef ti_sysbios_family_arm_v7r_Cache_enableBP
#define ti_sysbios_family_arm_v7r_Cache_enableBP ti_sysbios_family_arm_v7r_Cache_enableBP__E

/* disableBP */
#undef ti_sysbios_family_arm_v7r_Cache_disableBP
#define ti_sysbios_family_arm_v7r_Cache_disableBP ti_sysbios_family_arm_v7r_Cache_disableBP__E

/* invBPAll */
#undef ti_sysbios_family_arm_v7r_Cache_invBPAll
#define ti_sysbios_family_arm_v7r_Cache_invBPAll ti_sysbios_family_arm_v7r_Cache_invBPAll__E

/* initModuleState */
#define Cache_initModuleState ti_sysbios_family_arm_v7r_Cache_initModuleState__I

/* startup */
#define Cache_startup ti_sysbios_family_arm_v7r_Cache_startup__I

/* disableL1d */
#define Cache_disableL1d ti_sysbios_family_arm_v7r_Cache_disableL1d__I

/* disableL1p */
#define Cache_disableL1p ti_sysbios_family_arm_v7r_Cache_disableL1p__I

/* enableL1d */
#define Cache_enableL1d ti_sysbios_family_arm_v7r_Cache_enableL1d__I

/* enableL1p */
#define Cache_enableL1p ti_sysbios_family_arm_v7r_Cache_enableL1p__I

/* invL1d */
#define Cache_invL1d ti_sysbios_family_arm_v7r_Cache_invL1d__I

/* invL1p */
#define Cache_invL1p ti_sysbios_family_arm_v7r_Cache_invL1p__I

/* wbInvAllI */
#define Cache_wbInvAllI ti_sysbios_family_arm_v7r_Cache_wbInvAllI__I

/* getCacheLevelInfo */
#define Cache_getCacheLevelInfo ti_sysbios_family_arm_v7r_Cache_getCacheLevelInfo__I

/* Module_startup */
#undef ti_sysbios_family_arm_v7r_Cache_Module_startup
#define ti_sysbios_family_arm_v7r_Cache_Module_startup ti_sysbios_family_arm_v7r_Cache_Module_startup__E

/* Instance_init */
#undef ti_sysbios_family_arm_v7r_Cache_Instance_init
#define ti_sysbios_family_arm_v7r_Cache_Instance_init ti_sysbios_family_arm_v7r_Cache_Instance_init__E

/* Instance_finalize */
#undef ti_sysbios_family_arm_v7r_Cache_Instance_finalize
#define ti_sysbios_family_arm_v7r_Cache_Instance_finalize ti_sysbios_family_arm_v7r_Cache_Instance_finalize__E

/* module */
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__state__VR
#define Cache_module ((ti_sysbios_family_arm_v7r_Cache_Module_State *)(xdcRomStatePtr + ti_sysbios_family_arm_v7r_Cache_Module__state__V_offset))
#define module ((ti_sysbios_family_arm_v7r_Cache_Module_State *)(xdcRomStatePtr + ti_sysbios_family_arm_v7r_Cache_Module__state__V_offset))
#else
#define Cache_module ((ti_sysbios_family_arm_v7r_Cache_Module_State *)(xdc__MODOBJADDR__(ti_sysbios_family_arm_v7r_Cache_Module__state__V)))
#if !defined(__cplusplus) ||!defined(ti_sysbios_family_arm_v7r_Cache__cplusplus)
#define module ((ti_sysbios_family_arm_v7r_Cache_Module_State *)(xdc__MODOBJADDR__(ti_sysbios_family_arm_v7r_Cache_Module__state__V)))
#endif
#endif

/* per-module runtime symbols */
#undef Module__MID
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__id__CR
#define Module__MID (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__id *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__id__C_offset)))
#else
#define Module__MID ti_sysbios_family_arm_v7r_Cache_Module__id__C
#endif

#undef Module__DGSINCL
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__diagsIncluded__CR
#define Module__DGSINCL (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__diagsIncluded *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__diagsIncluded__C_offset)))
#else
#define Module__DGSINCL ti_sysbios_family_arm_v7r_Cache_Module__diagsIncluded__C
#endif

#undef Module__DGSENAB
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__diagsEnabled__CR
#define Module__DGSENAB (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__diagsEnabled *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__diagsEnabled__C_offset)))
#else
#define Module__DGSENAB ti_sysbios_family_arm_v7r_Cache_Module__diagsEnabled__C
#endif

#undef Module__DGSMASK
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__diagsMask__CR
#define Module__DGSMASK (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__diagsMask *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__diagsMask__C_offset)))
#else
#define Module__DGSMASK ti_sysbios_family_arm_v7r_Cache_Module__diagsMask__C
#endif

#undef Module__LOGDEF
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__loggerDefined__CR
#define Module__LOGDEF (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__loggerDefined *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__loggerDefined__C_offset)))
#else
#define Module__LOGDEF ti_sysbios_family_arm_v7r_Cache_Module__loggerDefined__C
#endif

#undef Module__LOGOBJ
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__loggerObj__CR
#define Module__LOGOBJ ti_sysbios_family_arm_v7r_Cache_Module__loggerObj__R
#define Module__LOGOBJ (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__loggerObj *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__loggerObj__C_offset)))
#else
#define Module__LOGOBJ ti_sysbios_family_arm_v7r_Cache_Module__loggerObj__C
#endif

#undef Module__LOGFXN0
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn0__CR
#define Module__LOGFXN0 (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn0 *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn0__C_offset)))
#else
#define Module__LOGFXN0 ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn0__C
#endif

#undef Module__LOGFXN1
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn1__CR
#define Module__LOGFXN1 (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn1 *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn1__C_offset)))
#else
#define Module__LOGFXN1 ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn1__C
#endif

#undef Module__LOGFXN2
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn2__CR
#define Module__LOGFXN2 (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn2 *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn2__C_offset)))
#else
#define Module__LOGFXN2 ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn2__C
#endif

#undef Module__LOGFXN4
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn4__CR
#define Module__LOGFXN4 (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn4 *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn4__C_offset)))
#else
#define Module__LOGFXN4 ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn4__C
#endif

#undef Module__LOGFXN8
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn8__CR
#define Module__LOGFXN8 (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn8 *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn8__C_offset)))
#else
#define Module__LOGFXN8 ti_sysbios_family_arm_v7r_Cache_Module__loggerFxn8__C
#endif

#undef Module__G_OBJ
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__gateObj__CR
#define Module__G_OBJ (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__gateObj *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__gateObj__C_offset)))
#else
#define Module__G_OBJ ti_sysbios_family_arm_v7r_Cache_Module__gateObj__C
#endif

#undef Module__G_PRMS
#ifdef ti_sysbios_family_arm_v7r_Cache_Module__gatePrms__CR
#define Module__G_PRMS (*((CT__ti_sysbios_family_arm_v7r_Cache_Module__gatePrms *)(xdcRomConstPtr + ti_sysbios_family_arm_v7r_Cache_Module__gatePrms__C_offset)))
#else
#define Module__G_PRMS ti_sysbios_family_arm_v7r_Cache_Module__gatePrms__C
#endif

#undef Module__GP_create
#define Module__GP_create ti_sysbios_family_arm_v7r_Cache_Module_GateProxy_create
#undef Module__GP_delete
#define Module__GP_delete ti_sysbios_family_arm_v7r_Cache_Module_GateProxy_delete
#undef Module__GP_enter
#define Module__GP_enter ti_sysbios_family_arm_v7r_Cache_Module_GateProxy_enter
#undef Module__GP_leave
#define Module__GP_leave ti_sysbios_family_arm_v7r_Cache_Module_GateProxy_leave
#undef Module__GP_query
#define Module__GP_query ti_sysbios_family_arm_v7r_Cache_Module_GateProxy_query


#endif /* ti_sysbios_family_arm_v7r_Cache__INTERNAL____ */
