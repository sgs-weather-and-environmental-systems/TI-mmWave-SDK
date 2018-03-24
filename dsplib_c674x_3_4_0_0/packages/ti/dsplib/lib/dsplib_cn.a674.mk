#*******************************************************************************
#* FILE PURPOSE: Lower level makefile for Creating Component Libraries
#*******************************************************************************
#* FILE NAME: lib/dsplib_cn.a674.mk
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
OBJDIR = ./package/lib/lib/dsplib_cna674

#List the kernelc674 Files
KERNELC674C= \
    ./src/DSPF_blk_eswap16//c674/DSPF_blk_eswap16_cn.c\
    ./src/DSPF_blk_eswap32//c674/DSPF_blk_eswap32_cn.c\
    ./src/DSPF_blk_eswap64//c674/DSPF_blk_eswap64_cn.c\
    ./src/DSPF_fltoq15//c674/DSPF_fltoq15_cn.c\
    ./src/DSPF_q15tofl//c674/DSPF_q15tofl_cn.c\
    ./src/DSPF_sp_autocor//c674/DSPF_sp_autocor_cn.c\
    ./src/DSPF_sp_biquad//c674/DSPF_sp_biquad_cn.c\
    ./src/DSPF_sp_bitrev_cplx//c674/DSPF_sp_bitrev_cplx_cn.c\
    ./src/DSPF_sp_blk_move//c674/DSPF_sp_blk_move_cn.c\
    ./src/DSPF_sp_cfftr2_dit//c674/DSPF_sp_cfftr2_dit_cn.c\
    ./src/DSPF_sp_cfftr4_dif//c674/DSPF_sp_cfftr4_dif_cn.c\
    ./src/DSPF_sp_convol//c674/DSPF_sp_convol_cn.c\
    ./src/DSPF_sp_dotprod//c674/DSPF_sp_dotprod_cn.c\
    ./src/DSPF_sp_dotp_cplx//c674/DSPF_sp_dotp_cplx_cn.c\
    ./src/DSPF_sp_fftSPxSP//c674/DSPF_sp_fftSPxSP_cn.c\
    ./src/DSPF_sp_fircirc//c674/DSPF_sp_fircirc_cn.c\
    ./src/DSPF_sp_fir_cplx//c674/DSPF_sp_fir_cplx_cn.c\
    ./src/DSPF_sp_fir_gen//c674/DSPF_sp_fir_gen_cn.c\
    ./src/DSPF_sp_fir_r2//c674/DSPF_sp_fir_r2_cn.c\
    ./src/DSPF_sp_icfftr2_dif//c674/DSPF_sp_icfftr2_dif_cn.c\
    ./src/DSPF_sp_ifftSPxSP//c674/DSPF_sp_ifftSPxSP_cn.c\
    ./src/DSPF_sp_iir//c674/DSPF_sp_iir_cn.c\
    ./src/DSPF_sp_iirlat//c674/DSPF_sp_iirlat_cn.c\
    ./src/DSPF_sp_lms//c674/DSPF_sp_lms_cn.c\
    ./src/DSPF_sp_mat_mul//c674/DSPF_sp_mat_mul_cn.c\
    ./src/DSPF_sp_mat_mul_cplx//c674/DSPF_sp_mat_mul_cplx_cn.c\
    ./src/DSPF_sp_mat_mul_gemm//c674/DSPF_sp_mat_mul_gemm_cn.c\
    ./src/DSPF_sp_mat_mul_gemm_cplx//c674/DSPF_sp_mat_mul_gemm_cplx_cn.c\
    ./src/DSPF_sp_mat_trans//c674/DSPF_sp_mat_trans_cn.c\
    ./src/DSPF_sp_maxidx//c674/DSPF_sp_maxidx_cn.c\
    ./src/DSPF_sp_maxval//c674/DSPF_sp_maxval_cn.c\
    ./src/DSPF_sp_minerr//c674/DSPF_sp_minerr_cn.c\
    ./src/DSPF_sp_minval//c674/DSPF_sp_minval_cn.c\
    ./src/DSPF_sp_vecmul//c674/DSPF_sp_vecmul_cn.c\
    ./src/DSPF_sp_vecrecip//c674/DSPF_sp_vecrecip_cn.c\
    ./src/DSPF_sp_vecsum_sq//c674/DSPF_sp_vecsum_sq_cn.c\
    ./src/DSPF_sp_w_vec//c674/DSPF_sp_w_vec_cn.c\
    ./src/DSP_fir_r8_h16//c674/DSP_fir_r8_h16_cn.c\
    ./src/DSP_fir_r8_h24//c674/DSP_fir_r8_h24_cn.c\
    ./src/DSP_fir_r8_h8//c674/DSP_fir_r8_h8_cn.c

# FLAGS for the kernelc674 Files
KERNELC674CFLAGS =  -c -k -mw  -o3 --symdebug:none --mem_model:data=far

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
$(KERNELC674COBJS):lib\dsplib_cn.a674.mk
lib\dsplib_cn.a674.mk:

#Include Depedency for kernelc674 Files
ifneq (clean,$(MAKECMDGOALS))
 -include $(KERNELC674COBJS:%.$(OBJEXT)=%.$(OBJEXT).dep)
endif


lib/dsplib_cn.a674 : $(KERNELC674COBJS)
	@echo archiving $? into $@ ...
	$(ARIN) $@ $?
	if [ -f $(@D)/dsplib_cn.lib  ]; then $(LIBINFO) -u -o=$(@D)/dsplib_cn.lib $@; else $(LIBINFO) -o=$(@D)/dsplib_cn.lib $@; fi;
