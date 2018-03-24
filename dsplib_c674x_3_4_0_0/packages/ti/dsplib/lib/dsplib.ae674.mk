#*******************************************************************************
#* FILE PURPOSE: Lower level makefile for Creating Component Libraries
#*******************************************************************************
#* FILE NAME: lib/dsplib.ae674.mk
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
CC = "$(C6X_GEN_INSTALL_DIR)/bin/"cl6x -c -mv6740 --abi=eabi
AC = "$(C6X_GEN_INSTALL_DIR)/bin/"cl6x -c -mv6740 --abi=eabi
ARIN = "$(C6X_GEN_INSTALL_DIR)/bin/"ar6x rq
LIBINFO = "$(C6X_GEN_INSTALL_DIR)/bin/libinfo6x"
LD = "$(C6X_GEN_INSTALL_DIR)/bin/"lnk6x --abi=eabi 
CGINCS = $(strip $(subst $(space),\$(space),$(C6X_GEN_INSTALL_DIR)/include))
RTSLIB = -l "$(C6X_GEN_INSTALL_DIR)/lib/undefined"
INCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(subst \,/,$(INCDIR)))))
OBJEXT = oe674
AOBJEXT = se674
INTERNALDEFS =  -Dti_targets_elf_C674 -Dxdc_target_types__=ti/targets/std.h -eo.$(OBJEXT) -ea.$(OBJEXT) -fr=$(@D) -fs=$(@D) -ppa -ppd=$@.dep 
INTERNALLINKDEFS =  -o $@ -m $@.map
OBJDIR = ./package/lib/lib/dsplibae674

#List the kernelc674 Files
KERNELC674C= \
    ./src/DSPF_blk_eswap16//c674/DSPF_blk_eswap16.c\
    ./src/DSPF_blk_eswap32//c674/DSPF_blk_eswap32.c\
    ./src/DSPF_blk_eswap64//c674/DSPF_blk_eswap64.c\
    ./src/DSPF_fltoq15//c674/DSPF_fltoq15.c\
    ./src/DSPF_q15tofl//c674/DSPF_q15tofl.c\
    ./src/DSPF_sp_autocor//c674/DSPF_sp_autocor.c\
    ./src/DSPF_sp_biquad//c674/DSPF_sp_biquad.c\
    ./src/DSPF_sp_bitrev_cplx//c674/DSPF_sp_bitrev_cplx.c\
    ./src/DSPF_sp_blk_move//c674/DSPF_sp_blk_move.c\
    ./src/DSPF_sp_convol//c674/DSPF_sp_convol.c\
    ./src/DSPF_sp_dotprod//c674/DSPF_sp_dotprod.c\
    ./src/DSPF_sp_dotp_cplx//c674/DSPF_sp_dotp_cplx.c\
    ./src/DSPF_sp_fircirc//c674/DSPF_sp_fircirc.c\
    ./src/DSPF_sp_fir_gen//c674/DSPF_sp_fir_gen.c\
    ./src/DSPF_sp_lms//c674/DSPF_sp_lms.c\
    ./src/DSPF_sp_mat_mul_gemm//c674/DSPF_sp_mat_mul_gemm.c\
    ./src/DSPF_sp_mat_mul_gemm_cplx//c674/DSPF_sp_mat_mul_gemm_cplx.c\
    ./src/DSPF_sp_mat_trans//c674/DSPF_sp_mat_trans.c\
    ./src/DSPF_sp_maxidx//c674/DSPF_sp_maxidx.c\
    ./src/DSPF_sp_maxval//c674/DSPF_sp_maxval.c\
    ./src/DSPF_sp_minerr//c674/DSPF_sp_minerr.c\
    ./src/DSPF_sp_minval//c674/DSPF_sp_minval.c\
    ./src/DSPF_sp_vecmul//c674/DSPF_sp_vecmul.c\
    ./src/DSPF_sp_vecrecip//c674/DSPF_sp_vecrecip.c\
    ./src/DSPF_sp_vecsum_sq//c674/DSPF_sp_vecsum_sq.c\
    ./src/DSPF_sp_w_vec//c674/DSPF_sp_w_vec.c\
    ./src/DSP_fir_r8_h16//c674/DSP_fir_r8_h16.c\
    ./src/DSP_fir_r8_h24//c674/DSP_fir_r8_h24.c\
    ./src/DSP_fir_r8_h8//c674/DSP_fir_r8_h8.c

# FLAGS for the kernelc674 Files
KERNELC674CFLAGS =  -c -k -mw  -o3 --symdebug:none --mem_model:data=far

# Make Rule for the kernelc674 Files
KERNELC674COBJS = $(patsubst %.c, $(OBJDIR)/%.$(OBJEXT), $(KERNELC674C))

$(KERNELC674COBJS): $(OBJDIR)/%.$(OBJEXT): %.c
	-@echo cle674 $< ...
	if [ ! -d $(@D) ]; then $(MKDIR) $(@D) ; fi;
	-$(RM) $@.dep
	$(CC) $(KERNELC674CFLAGS) $(INTERNALDEFS) $(INCS) -I$(CGINCS) -fc $< 
	-@cp $@.dep $@.pp; \
         $(SED) -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
             -e '/^$$/ d' -e 's/$$/ :/' < $@.pp >> $@.dep; \
         $(RM) $@.pp 

#Create Empty rule for dependency
$(KERNELC674COBJS):lib\dsplib.ae674.mk
lib\dsplib.ae674.mk:

#Include Depedency for kernelc674 Files
ifneq (clean,$(MAKECMDGOALS))
 -include $(KERNELC674COBJS:%.$(OBJEXT)=%.$(OBJEXT).dep)
endif

#List the kernelc674 Files
KERNELC674S= \
    ./src/DSPF_sp_cfftr2_dit//c674/DSPF_sp_cfftr2_dit.s\
    ./src/DSPF_sp_cfftr4_dif//c674/DSPF_sp_cfftr4_dif.s\
    ./src/DSPF_sp_fftSPxSP//c674/DSPF_sp_fftSPxSP.s\
    ./src/DSPF_sp_fir_cplx//c674/DSPF_sp_fir_cplx.s\
    ./src/DSPF_sp_fir_r2//c674/DSPF_sp_fir_r2.s\
    ./src/DSPF_sp_icfftr2_dif//c674/DSPF_sp_icfftr2_dif.s\
    ./src/DSPF_sp_ifftSPxSP//c674/DSPF_sp_ifftSPxSP.s\
    ./src/DSPF_sp_iir//c674/DSPF_sp_iir.s\
    ./src/DSPF_sp_iirlat//c674/DSPF_sp_iirlat.s\
    ./src/DSPF_sp_mat_mul//c674/DSPF_sp_mat_mul.s\
    ./src/DSPF_sp_mat_mul_cplx//c674/DSPF_sp_mat_mul_cplx.s

# FLAGS for the kernelc674 Files
KERNELC674SFLAGS =  -ea.s -c -k  --mem_model:data=far

# Make Rule for the kernelc674 Files
KERNELC674SOBJS = $(patsubst %.s, $(OBJDIR)/%.$(OBJEXT), $(KERNELC674S))

$(KERNELC674SOBJS): $(OBJDIR)/%.$(OBJEXT): %.s
	-@echo asme674 $< ...
	if [ ! -d $(@D) ]; then $(MKDIR) $(@D) ; fi;
	$(AC) $(KERNELC674SFLAGS) $(INTERNALDEFS) $(INCS) -I$(CGINCS) -fa $< 

#Create Empty rule for dependency
$(KERNELC674SOBJS):lib\dsplib.ae674.mk
lib\dsplib.ae674.mk:

#Include Depedency for kernelc674 Files
ifneq (clean,$(MAKECMDGOALS))
 -include $(KERNELC674SOBJS:%.$(OBJEXT)=%.$(OBJEXT).dep)
endif


lib/dsplib.ae674 : $(KERNELC674COBJS) $(KERNELC674SOBJS)
	@echo archiving $? into $@ ...
	$(ARIN) $@ $?
	if [ -f $(@D)/dsplib.lib  ]; then $(LIBINFO) -u -o=$(@D)/dsplib.lib $@; else $(LIBINFO) -o=$(@D)/dsplib.lib $@; fi;
