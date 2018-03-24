#*******************************************************************************
#* FILE PURPOSE: Lower level makefile for Creating Component Libraries
#*******************************************************************************
#* FILE NAME: lib/mathlib.a674.mk
#*
#* DESCRIPTION: Defines Source Files, Compilers flags and build rules
#*
#*
#* This is an auto-generated file          
#*******************************************************************************
#

#
# Macro definitions referenced below
#
empty =
space =$(empty) $(empty)
CC = "$(C6X_GEN_INSTALL_DIR)/bin/"cl6x -c -mv6740
AC = "$(C6X_GEN_INSTALL_DIR)/bin/"cl6x -c -mv6740
ARIN = "$(C6X_GEN_INSTALL_DIR)/bin/"ar6x rq
LIBINFO = "$(C6X_GEN_INSTALL_DIR)/bin/libinfo6x"
LD = "$(C6X_GEN_INSTALL_DIR)/bin/"lnk6x  
CGINCS = $(strip $(subst $(space),\$(space),$(C6X_GEN_INSTALL_DIR)/include))
RTSLIB = -l "$(C6X_GEN_INSTALL_DIR)/lib/undefined"
INCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(subst \,/,$(INCDIR)))))
OBJEXT = o674
AOBJEXT = s674
INTERNALDEFS =  -Dti_targets_C674 -Dxdc_target_types__=ti/targets/std.h -eo.$(OBJEXT) -ea.$(AOBJEXT) -fr=$(@D) -fs=$(@D) -ppa -ppd=$@.dep 
INTERNALLINKDEFS =  -o $@ -m $@.map
OBJDIR = ./package/lib/lib/mathliba674

#List the kernelc674 Files
KERNELC674C= \
    ./src/common/tables.c\
    ./src/atan2dp//c674/atan2dp_c.c\
    ./src/atan2dp/atan2dp_v.c\
    ./src/atan2sp//c674/atan2sp_c.c\
    ./src/atan2sp/atan2sp_v.c\
    ./src/atandp//c674/atandp_c.c\
    ./src/atandp//c674/atandp_v.c\
    ./src/atansp//c674/atansp_c.c\
    ./src/atansp/atansp_v.c\
    ./src/cosdp//c674/cosdp_c.c\
    ./src/cosdp/cosdp_v.c\
    ./src/cossp//c674/cossp_c.c\
    ./src/cossp/cossp_v.c\
    ./src/divdp//c674/divdp_c.c\
    ./src/divdp/divdp_v.c\
    ./src/divsp//c674/divsp_c.c\
    ./src/divsp/divsp_v.c\
    ./src/exp10dp//c674/exp10dp_c.c\
    ./src/exp10dp/exp10dp_v.c\
    ./src/exp10sp//c674/exp10sp_c.c\
    ./src/exp10sp/exp10sp_v.c\
    ./src/exp2dp//c674/exp2dp_c.c\
    ./src/exp2dp/exp2dp_v.c\
    ./src/exp2sp//c674/exp2sp_c.c\
    ./src/exp2sp/exp2sp_v.c\
    ./src/expdp//c674/expdp_c.c\
    ./src/expdp/expdp_v.c\
    ./src/expsp//c674/expsp_c.c\
    ./src/expsp/expsp_v.c\
    ./src/log10dp//c674/log10dp_c.c\
    ./src/log10dp/log10dp_v.c\
    ./src/log10sp//c674/log10sp_c.c\
    ./src/log10sp/log10sp_v.c\
    ./src/log2dp//c674/log2dp_c.c\
    ./src/log2dp/log2dp_v.c\
    ./src/log2sp//c674/log2sp_c.c\
    ./src/log2sp/log2sp_v.c\
    ./src/logdp//c674/logdp_c.c\
    ./src/logdp/logdp_v.c\
    ./src/logsp//c674/logsp_c.c\
    ./src/logsp/logsp_v.c\
    ./src/powdp//c674/powdp_c.c\
    ./src/powdp/powdp_v.c\
    ./src/powsp//c674/powsp_c.c\
    ./src/powsp/powsp_v.c\
    ./src/recipdp//c674/recipdp_c.c\
    ./src/recipdp/recipdp_v.c\
    ./src/recipsp//c674/recipsp_c.c\
    ./src/recipsp/recipsp_v.c\
    ./src/rsqrtdp//c674/rsqrtdp_c.c\
    ./src/rsqrtdp/rsqrtdp_v.c\
    ./src/rsqrtsp//c674/rsqrtsp_c.c\
    ./src/rsqrtsp/rsqrtsp_v.c\
    ./src/sindp//c674/sindp_c.c\
    ./src/sindp/sindp_v.c\
    ./src/sinsp//c674/sinsp_c.c\
    ./src/sinsp/sinsp_v.c\
    ./src/sqrtdp//c674/sqrtdp_c.c\
    ./src/sqrtdp/sqrtdp_v.c\
    ./src/sqrtsp//c674/sqrtsp_c.c\
    ./src/sqrtsp/sqrtsp_v.c\
    ./src/asindp//c674/asindp.c\
    ./src/asindp//c674/asindp_c.c\
    ./src/asindp//c674/asindp_v.c\
    ./src/acosdp//c674/acosdp.c\
    ./src/acosdp//c674/acosdp_c.c\
    ./src/acosdp//c674/acosdp_v.c\
    ./src/sinhdp//c674/sinhdp.c\
    ./src/sinhdp//c674/sinhdp_c.c\
    ./src/sinhdp//c674/sinhdp_v.c\
    ./src/sinhsp//c674/sinhsp.c\
    ./src/sinhsp//c674/sinhsp_c.c\
    ./src/sinhsp/sinhsp_v.c\
    ./src/coshdp//c674/coshdp.c\
    ./src/coshdp//c674/coshdp_c.c\
    ./src/coshdp//c674/coshdp_v.c\
    ./src/coshsp//c674/coshsp.c\
    ./src/coshsp//c674/coshsp_c.c\
    ./src/coshsp/coshsp_v.c\
    ./src/tandp//c674/tandp.c\
    ./src/tandp//c674/tandp_c.c\
    ./src/tandp/tandp_v.c\
    ./src/tansp//c674/tansp.c\
    ./src/tansp//c674/tansp_c.c\
    ./src/tansp/tansp_v.c\
    ./src/tanhdp//c674/tanhdp.c\
    ./src/tanhdp//c674/tanhdp_c.c\
    ./src/tanhdp//c674/tanhdp_v.c\
    ./src/tanhsp//c674/tanhsp.c\
    ./src/tanhsp//c674/tanhsp_c.c\
    ./src/tanhsp/tanhsp_v.c\
    ./src/acoshdp//c674/acoshdp.c\
    ./src/acoshdp//c674/acoshdp_c.c\
    ./src/acoshdp/acoshdp_v.c\
    ./src/acoshsp//c674/acoshsp.c\
    ./src/acoshsp//c674/acoshsp_c.c\
    ./src/acoshsp/acoshsp_v.c\
    ./src/asinhdp//c674/asinhdp.c\
    ./src/asinhdp//c674/asinhdp_c.c\
    ./src/asinhdp/asinhdp_v.c\
    ./src/asinhsp//c674/asinhsp.c\
    ./src/asinhsp//c674/asinhsp_c.c\
    ./src/asinhsp/asinhsp_v.c\
    ./src/atanhdp//c674/atanhdp.c\
    ./src/atanhdp//c674/atanhdp_c.c\
    ./src/atanhdp//c674/atanhdp_v.c\
    ./src/acossp//c674/acossp.c\
    ./src/acossp//c674/acossp_c.c\
    ./src/acossp/acossp_v.c\
    ./src/asinsp//c674/asinsp.c\
    ./src/asinsp//c674/asinsp_c.c\
    ./src/asinsp/asinsp_v.c\
    ./src/atanhsp//c674/atanhsp.c\
    ./src/atanhsp//c674/atanhsp_c.c\
    ./src/atanhsp/atanhsp_v.c

# FLAGS for the kernelc674 Files
KERNELC674CFLAGS =  -c -k -mw  -o3 --symdebug:none --mem_model:data=far -dOVERRIDE_RTS=0 

# Make Rule for the kernelc674 Files
KERNELC674COBJS = $(patsubst %.c, $(OBJDIR)/%.$(OBJEXT), $(KERNELC674C))

$(KERNELC674COBJS): $(OBJDIR)/%.$(OBJEXT): %.c
	-@echo cl674 $< ...
	if [ ! -d $(@D) ]; then $(MKDIR) $(@D) ; fi;
	-$(RM) $@.dep
	$(CC) $(KERNELC674CFLAGS) $(INTERNALDEFS) $(INCS) -I$(CGINCS) -fc $< 
	-@cp $@.dep $@.pp; \
         $(SED) -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
             -e '/^$$/ d' -e 's/$$/ :/' < $@.pp >> $@.dep; \
         $(RM) $@.pp 

#Create Empty rule for dependency
$(KERNELC674COBJS):lib\mathlib.a674.mk
lib\mathlib.a674.mk:

#Include Depedency for kernelc674 Files
ifneq (clean,$(MAKECMDGOALS))
 -include $(KERNELC674COBJS:%.$(OBJEXT)=%.$(OBJEXT).dep)
endif

#List the kernelc674 Files
KERNELC674ASM= \
    ./src/atan2dp//c674/atan2dp.asm\
    ./src/atan2sp//c674/atan2sp.asm\
    ./src/atandp//c674/atandp.asm\
    ./src/atansp//c674/atansp.asm\
    ./src/cosdp//c674/cosdp.asm\
    ./src/cossp//c674/cossp.asm\
    ./src/divdp//c674/divdp.asm\
    ./src/divsp//c674/divsp.asm\
    ./src/exp10dp//c674/exp10dp.asm\
    ./src/exp10sp//c674/exp10sp.asm\
    ./src/exp2dp//c674/exp2dp.asm\
    ./src/exp2sp//c674/exp2sp.asm\
    ./src/expdp//c674/expdp.asm\
    ./src/expsp//c674/expsp.asm\
    ./src/log10dp//c674/log10dp.asm\
    ./src/log10sp//c674/log10sp.asm\
    ./src/log2dp//c674/log2dp.asm\
    ./src/log2sp//c674/log2sp.asm\
    ./src/logdp//c674/logdp.asm\
    ./src/logsp//c674/logsp.asm\
    ./src/powdp//c674/powdp.asm\
    ./src/powsp//c674/powsp.asm\
    ./src/recipdp//c674/recipdp.asm\
    ./src/recipsp//c674/recipsp.asm\
    ./src/rsqrtdp//c674/rsqrtdp.asm\
    ./src/rsqrtsp//c674/rsqrtsp.asm\
    ./src/sindp//c674/sindp.asm\
    ./src/sinsp//c674/sinsp.asm\
    ./src/sqrtdp//c674/sqrtdp.asm\
    ./src/sqrtsp//c674/sqrtsp.asm

# FLAGS for the kernelc674 Files
KERNELC674ASMFLAGS =  -ea.s -c -k  --mem_model:data=far -dOVERRIDE_RTS=0 

# Make Rule for the kernelc674 Files
KERNELC674ASMOBJS = $(patsubst %.asm, $(OBJDIR)/%.$(OBJEXT), $(KERNELC674ASM))

$(KERNELC674ASMOBJS): $(OBJDIR)/%.$(OBJEXT): %.asm
	-@echo asm674 $< ...
	if [ ! -d $(@D) ]; then $(MKDIR) $(@D) ; fi;
	$(AC) $(KERNELC674ASMFLAGS) $(INTERNALDEFS) $(INCS) -I$(CGINCS) -fa $< 

#Create Empty rule for dependency
$(KERNELC674ASMOBJS):lib\mathlib.a674.mk
lib\mathlib.a674.mk:

#Include Depedency for kernelc674 Files
ifneq (clean,$(MAKECMDGOALS))
 -include $(KERNELC674ASMOBJS:%.$(OBJEXT)=%.$(OBJEXT).dep)
endif


lib/mathlib.a674 : $(KERNELC674COBJS) $(KERNELC674ASMOBJS)
	@echo archiving $? into $@ ...
	$(ARIN) $@ $?
	if [ -f $(@D)/mathlib.lib  ]; then $(LIBINFO) -u -o=$(@D)/mathlib.lib $@; else $(LIBINFO) -o=$(@D)/mathlib.lib $@; fi;
