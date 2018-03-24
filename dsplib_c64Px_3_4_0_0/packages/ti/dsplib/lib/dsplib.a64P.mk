#*******************************************************************************
#* FILE PURPOSE: Lower level makefile for Creating Component Libraries
#*******************************************************************************
#* FILE NAME: lib/dsplib.a64P.mk
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
CC = "$(C6X_GEN_INSTALL_DIR)/bin/"cl6x -c -mv64p
AC = "$(C6X_GEN_INSTALL_DIR)/bin/"cl6x -c -mv64p
ARIN = "$(C6X_GEN_INSTALL_DIR)/bin/"ar6x rq
LIBINFO = "$(C6X_GEN_INSTALL_DIR)/bin/libinfo6x"
LD = "$(C6X_GEN_INSTALL_DIR)/bin/"lnk6x  
CGINCS = $(strip $(subst $(space),\$(space),$(C6X_GEN_INSTALL_DIR)/include))
RTSLIB = -l "$(C6X_GEN_INSTALL_DIR)/lib/undefined"
INCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(subst \,/,$(INCDIR)))))
OBJEXT = o64P
AOBJEXT = s64P
INTERNALDEFS =  -Dti_targets_C64P -Dxdc_target_types__=ti/targets/std.h -eo.$(OBJEXT) -ea.$(AOBJEXT) -fr=$(@D) -fs=$(@D) -ppa -ppd=$@.dep 
INTERNALLINKDEFS =  -o $@ -m $@.map
OBJDIR = ./package/lib/lib/dspliba64P

#List the kernelc64p Files
KERNELC64PC= \
    ./src/DSP_add16//c64P/DSP_add16.c\
    ./src/DSP_add32//c64P/DSP_add32.c\
    ./src/DSP_autocor//c64P/DSP_autocor.c\
    ./src/DSP_bexp//c64P/DSP_bexp.c\
    ./src/DSP_blk_eswap16//c64P/DSP_blk_eswap16.c\
    ./src/DSP_blk_eswap32//c64P/DSP_blk_eswap32.c\
    ./src/DSP_blk_eswap64//c64P/DSP_blk_eswap64.c\
    ./src/DSP_blk_move//c64P/DSP_blk_move.c\
    ./src/DSP_dotprod//c64P/DSP_dotprod.c\
    ./src/DSP_dotp_sqr//c64P/DSP_dotp_sqr.c\
    ./src/DSP_fft16x16//c64P/DSP_fft16x16_i.c\
    ./src/DSP_fft16x16r//c64P/DSP_fft16x16r_i.c\
    ./src/DSP_fft16x16_imre//c64P/DSP_fft16x16_imre_i.c\
    ./src/DSP_fft16x32//c64P/DSP_fft16x32_i.c\
    ./src/DSP_fft32x32//c64P/DSP_fft32x32_i.c\
    ./src/DSP_fft32x32s//c64P/DSP_fft32x32s_i.c\
    ./src/DSP_firlms2//c64P/DSP_firlms2.c\
    ./src/DSP_fir_cplx//c64P/DSP_fir_cplx.c\
    ./src/DSP_fir_cplx_hM4X4//c64P/DSP_fir_cplx_hM4X4.c\
    ./src/DSP_fir_gen//c64P/DSP_fir_gen.c\
    ./src/DSP_fir_gen_hM17_rA8X8//c64P/DSP_fir_gen_hM17_rA8X8.c\
    ./src/DSP_fir_r4//c64P/DSP_fir_r4.c\
    ./src/DSP_fir_r8//c64P/DSP_fir_r8.c\
    ./src/DSP_fir_r8_hM16_rM8A8X8//c64P/DSP_fir_r8_hM16_rM8A8X8.c\
    ./src/DSP_fir_sym//c64P/DSP_fir_sym.c\
    ./src/DSP_fltoq15//c64P/DSP_fltoq15.c\
    ./src/DSP_ifft16x16//c64P/DSP_ifft16x16_i.c\
    ./src/DSP_ifft16x16_imre//c64P/DSP_ifft16x16_imre_i.c\
    ./src/DSP_ifft16x32//c64P/DSP_ifft16x32_i.c\
    ./src/DSP_ifft32x32//c64P/DSP_ifft32x32_i.c\
    ./src/DSP_iir//c64P/DSP_iir.c\
    ./src/DSP_iir_lat//c64P/DSP_iir_lat.c\
    ./src/DSP_iir_ss//c64P/DSP_iir_ss.c\
    ./src/DSP_mat_mul//c64P/DSP_mat_mul.c\
    ./src/DSP_mat_mul_cplx//c64P/DSP_mat_mul_cplx.c\
    ./src/DSP_mat_trans//c64P/DSP_mat_trans.c\
    ./src/DSP_maxidx//c64P/DSP_maxidx.c\
    ./src/DSP_maxval//c64P/DSP_maxval.c\
    ./src/DSP_minerror//c64P/DSP_minerror.c\
    ./src/DSP_minval//c64P/DSP_minval.c\
    ./src/DSP_mul32//c64P/DSP_mul32.c\
    ./src/DSP_neg32//c64P/DSP_neg32.c\
    ./src/DSP_q15tofl//c64P/DSP_q15tofl.c\
    ./src/DSP_recip16//c64P/DSP_recip16.c\
    ./src/DSP_vecsumsq//c64P/DSP_vecsumsq.c\
    ./src/DSP_w_vec//c64P/DSP_w_vec.c

# FLAGS for the kernelc64p Files
KERNELC64PCFLAGS =  -c -k -mw  -o3 --symdebug:none --mem_model:data=far

# Make Rule for the kernelc64p Files
KERNELC64PCOBJS = $(patsubst %.c, $(OBJDIR)/%.$(OBJEXT), $(KERNELC64PC))

$(KERNELC64PCOBJS): $(OBJDIR)/%.$(OBJEXT): %.c
	-@echo cl64P $< ...
	if [ ! -d $(@D) ]; then $(MKDIR) $(@D) ; fi;
	-$(RM) $@.dep
	$(CC) $(KERNELC64PCFLAGS) $(INTERNALDEFS) $(INCS) -I$(CGINCS) -fc $< 
	-@cp $@.dep $@.pp; \
         $(SED) -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
             -e '/^$$/ d' -e 's/$$/ :/' < $@.pp >> $@.dep; \
         $(RM) $@.pp 

#Create Empty rule for dependency
$(KERNELC64PCOBJS):lib\dsplib.a64P.mk
lib\dsplib.a64P.mk:

#Include Depedency for kernelc64p Files
ifneq (clean,$(MAKECMDGOALS))
 -include $(KERNELC64PCOBJS:%.$(OBJEXT)=%.$(OBJEXT).dep)
endif

#List the kernelc64p Files
KERNELC64PSA= \
    ./src/DSP_fft16x16//c64P/DSP_fft16x16_sa.sa\
    ./src/DSP_fft16x16r//c64P/DSP_fft16x16r_sa.sa\
    ./src/DSP_fft16x16_imre//c64P/DSP_fft16x16_imre_sa.sa\
    ./src/DSP_fft16x32//c64P/DSP_fft16x32_sa.sa\
    ./src/DSP_fft32x32//c64P/DSP_fft32x32_sa.sa\
    ./src/DSP_fft32x32s//c64P/DSP_fft32x32s_sa.sa\
    ./src/DSP_ifft16x16//c64P/DSP_ifft16x16_sa.sa\
    ./src/DSP_ifft16x16_imre//c64P/DSP_ifft16x16_imre_sa.sa\
    ./src/DSP_ifft16x32//c64P/DSP_ifft16x32_sa.sa\
    ./src/DSP_ifft32x32//c64P/DSP_ifft32x32_sa.sa

# FLAGS for the kernelc64p Files
KERNELC64PSAFLAGS =  -c -k -mw  -o3 --symdebug:none --mem_model:data=far

# Make Rule for the kernelc64p Files
KERNELC64PSAOBJS = $(patsubst %.sa, $(OBJDIR)/%.$(OBJEXT), $(KERNELC64PSA))

$(KERNELC64PSAOBJS): $(OBJDIR)/%.$(OBJEXT): %.sa
	-@echo asm64P $< ...
	if [ ! -d $(@D) ]; then $(MKDIR) $(@D) ; fi;
	$(AC) $(KERNELC64PSAFLAGS) $(INTERNALDEFS) $(INCS) -I$(CGINCS) $< 

#Create Empty rule for dependency
$(KERNELC64PSAOBJS):lib\dsplib.a64P.mk
lib\dsplib.a64P.mk:

#Include Depedency for kernelc64p Files
ifneq (clean,$(MAKECMDGOALS))
 -include $(KERNELC64PSAOBJS:%.$(OBJEXT)=%.$(OBJEXT).dep)
endif


lib/dsplib.a64P : $(KERNELC64PCOBJS) $(KERNELC64PSAOBJS)
	@echo archiving $? into $@ ...
	$(ARIN) $@ $?
	if [ -f $(@D)/dsplib.lib  ]; then $(LIBINFO) -u -o=$(@D)/dsplib.lib $@; else $(LIBINFO) -o=$(@D)/dsplib.lib $@; fi;
