##############################################################################
#
#
# Makefile for C6000 run-time support library version 8.1.3
#
#
##############################################################################
#
# This Makefile is automatically-generated: you usually should not edit it. 
#
##############################################################################


##############################################################################
#
# This Makefile is specific to compiler RTS library version 8.1.3.  
# The format is subject to change without notice.  This Makefile is intended
# for use with mklib, which understands which 'make' variables to set to build
# each distinct version of the RTS library.
#
# This Makefile uses GNU make language extensions.
#
##############################################################################

##############################################################################
#
# GROUPS
#
# The source files are set up in a modular fashion using "groups."  Groups
# represent major feature clusters, and usually specify source files which
# implement that feature.  When building a library which needs a particular
# feature, the group which represents that feature is "activated" by setting a
# 'make' variable.  This variable can be set directly by the user, or may be
# inferred from the setting of other variables.  Groups (and the files they
# contain) not needed for a certain library are not activated.  Some groups
# are always activated.  Groups which are not always activated are enclosed in
# an "ifeq" testing the corresponding 'make' variable (the name of the
# variable is the name of the group).
#
# Groups can specify any kind of source file (e.g. C, C++, assembly), but do
# not list header files, or source files included from other source files.
# This Makefile is focused on how to build the object files, not listing all
# of the necessary files.  Some groups do not list any source files; these
# groups may still carry information such as extra options to use when that
# group is active, or may activate other groups.  Some groups exist only to be
# tested as part of the activation condition of other groups.
#
# Groups can specify extra compiler options to use when that group is active.
# These can be options intended for all targets (UNIVERSAL_FLAGS), such as the
# CPU version, or can be intended only for a certain type of files (CPP_FLAGS)
# (e.g. the option "--exceptions")
#
##############################################################################

##############################################################################
#
# OPTIONS
#
# You can append or override some options through 'make' variables specified
# on the command line.  Not all options can be changed this way, and some
# options are dangerous to use in a Makefile (e.g. "--skip_assembler").
# Options added by groups below should not be altered; if the option is
# undesired, you're probably building the wrong library.  For example, if you
# don't want "--exceptions", you shouldn't be using EXCEPTIONS=1.
#
# You can append options to the standard list by using EXTRA_FLAGS.  This is
# useful for enabling debugging support or activating silicon errata
# workarounds:
#
# gmake LIB=some.lib EXTRA_FLAGS="-g"
#
# You can completely replace the standard list by using STANDARD_FLAGS, but
# this should almost never be necessary.  WARNING: This Makefile will not
# optimize the files if you replace the standard list and your replacement
# options do not include the right optimization flags.
#
# gmake LIB=some.lib STANDARD_FLAGS="-o3 -oe"
#
##############################################################################

##############################################################################
# Available libraries
#
# You can build each 8.1.3 library using the appropriate command:
#
# gmake library LIB=rts64plus_elf.lib C64P=1
# gmake library LIB=rts64plus_elf_eh.lib EABI_TDEH=1 C64P=1 EXCEPTIONS=1
# gmake library LIB=rts64plus_elf_mt.lib C64P=1 MT=1
# gmake library LIB=rts64plus_elf_mt_eh.lib C64P=1 EXCEPTIONS=1 MT=1 EABI_TDEH=1
# gmake library LIB=rts64pluse_elf.lib BIG_ENDIAN=1 C64P=1
# gmake library LIB=rts64pluse_elf_eh.lib C64P=1 EXCEPTIONS=1 BIG_ENDIAN=1 EABI_TDEH=1
# gmake library LIB=rts64pluse_elf_mt.lib BIG_ENDIAN=1 C64P=1 MT=1
# gmake library LIB=rts64pluse_elf_mt_eh.lib C64P=1 BIG_ENDIAN=1 EXCEPTIONS=1 MT=1 EABI_TDEH=1
# gmake library LIB=rts6600_elf.lib C6600=1
# gmake library LIB=rts6600_elf_eh.lib C6600=1 EABI_TDEH=1 EXCEPTIONS=1
# gmake library LIB=rts6600_elf_mt.lib MT=1 C6600=1
# gmake library LIB=rts6600_elf_mt_eh.lib C6600=1 EABI_TDEH=1 MT=1 EXCEPTIONS=1
# gmake library LIB=rts6600e_elf.lib C6600=1 BIG_ENDIAN=1
# gmake library LIB=rts6600e_elf_eh.lib EABI_TDEH=1 C6600=1 BIG_ENDIAN=1 EXCEPTIONS=1
# gmake library LIB=rts6600e_elf_mt.lib MT=1 C6600=1 BIG_ENDIAN=1
# gmake library LIB=rts6600e_elf_mt_eh.lib BIG_ENDIAN=1 EXCEPTIONS=1 MT=1 EABI_TDEH=1 C6600=1
# gmake library LIB=rts6740_elf.lib C6740=1
# gmake library LIB=rts6740_elf_eh.lib C6740=1 EXCEPTIONS=1 EABI_TDEH=1
# gmake library LIB=rts6740_elf_mt.lib MT=1 C6740=1
# gmake library LIB=rts6740_elf_mt_eh.lib EABI_TDEH=1 MT=1 EXCEPTIONS=1 C6740=1
# gmake library LIB=rts6740e_elf.lib C6740=1 BIG_ENDIAN=1
# gmake library LIB=rts6740e_elf_eh.lib EABI_TDEH=1 C6740=1 EXCEPTIONS=1 BIG_ENDIAN=1
# gmake library LIB=rts6740e_elf_mt.lib C6740=1 BIG_ENDIAN=1 MT=1
# gmake library LIB=rts6740e_elf_mt_eh.lib BIG_ENDIAN=1 EXCEPTIONS=1 C6740=1 EABI_TDEH=1 MT=1
##############################################################################

#-----------------------------------------------------------------------------
# Basic definitions
#-----------------------------------------------------------------------------
STANDARD_FLAGS =  -O3 --diag_warning=225 --quiet
ifeq (y,$(shell [ -e $(CGT_BIN)/cl6x ] && echo y))
  CC = $(CGT_BIN)/cl6x
else
  CC = cl6x
endif
ifeq (y,$(shell [ -e $(CGT_BIN)/ar6x ] && echo y))
  AR = $(CGT_BIN)/ar6x
else
  AR = ar6x
endif
CD = cd

OBJ = OBJ

#-----------------------------------------------------------------------------
# Group TARGET
#-----------------------------------------------------------------------------
UNIVERSAL_FLAGS += -mo --mem_model:data=far --no_visible_enums

TARGET_LINASM_SOURCE = \
	negll.sa

LINASM_SOURCE += $(TARGET_LINASM_SOURCE)


TARGET_C_SOURCE = \
	boot.c \
	dtos.c \
	gsmfuncs.c \
	gsmvars.c \
	imath40.c \
	imath64.c \
	llshift.c \
	lltoa.c \
	memcpy62.c \
	mpyll.c \
	outprof.c \
	pprof_cio.c \
	pprof_user.c \
	memset.c \
	autoinit.c \
	cpy_tbl.c \
	copy_zero_init.c \
	copy_decompress_none.c \
	copy_decompress_rle.c \
	copy_decompress_lzss.c

C_SOURCE += $(TARGET_C_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC_MATH_LIBRARY_DOUBLE_IS_64
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group GENERIC_MATH_FUNDAMENTAL_DOUBLE_IS_64
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group GENERIC_MATH_LIBRARY_FLOAT
#-----------------------------------------------------------------------------

GENERIC_MATH_LIBRARY_FLOAT_C_SOURCE = \
	absf.c \
	acosf.c \
	acoshf.c \
	acot2f.c \
	acotf.c \
	acothf.c \
	asinf.c \
	asinhf.c \
	atanf.c \
	atan2f.c \
	atanhf.c \
	ceilf.c \
	cosf.c \
	coshf.c \
	cotf.c \
	cothf.c \
	exp10f.c \
	exp2f.c \
	expf.c \
	fabsf.c \
	floorf.c \
	fmodf.c \
	fpclassifyf.c \
	frexpf.c \
	isfinitef.c \
	isinff.c \
	isnanf.c \
	isnormalf.c \
	ldexpf.c \
	log10f.c \
	log2f.c \
	logf.c \
	modff.c \
	powif.c \
	powf.c \
	roundf.c \
	rsqrtf.c \
	sinf.c \
	sinhf.c \
	sqrtf.c \
	tanf.c \
	tanhf.c \
	truncf.c

C_SOURCE += $(GENERIC_MATH_LIBRARY_FLOAT_C_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC_MATH_LIBRARY_DOUBLE
#-----------------------------------------------------------------------------

GENERIC_MATH_LIBRARY_DOUBLE_C_SOURCE = \
	absd.c \
	acos.c \
	acosh.c \
	acot.c \
	acot2.c \
	acoth.c \
	asin.c \
	asinh.c \
	atan.c \
	atan2.c \
	atanh.c \
	ceil.c \
	cos.c \
	cosh.c \
	cot.c \
	coth.c \
	exp.c \
	exp10.c \
	exp2.c \
	fabs.c \
	floor.c \
	fmod.c \
	fpclassify.c \
	frexp.c \
	isfinite.c \
	isinf.c \
	isnan.c \
	isnormal.c \
	ldexp.c \
	log.c \
	log10.c \
	log2.c \
	modf.c \
	pow.c \
	powi.c \
	round.c \
	rsqrt.c \
	sin.c \
	sinh.c \
	sqrt.c \
	tan.c \
	tanh.c \
	trunc.c \
	signbit.c

C_SOURCE += $(GENERIC_MATH_LIBRARY_DOUBLE_C_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC_MATH_FUNDAMENTAL_FLOAT
#-----------------------------------------------------------------------------

GENERIC_MATH_FUNDAMENTAL_FLOAT_C_SOURCE = \
	addf.c \
	cmpf.c \
	eqlf.c \
	gef.c \
	gtf.c \
	lef.c \
	ltf.c \
	neqlf.c \
	cvtdf.c \
	divf.c \
	fixfi.c \
	fixfli.c \
	fixflli.c \
	fixfu.c \
	fixful.c \
	fixfull.c \
	fltif.c \
	fltlif.c \
	fltllif.c \
	fltuf.c \
	fltulf.c \
	fltullf.c \
	frcaddf.c \
	frcdivf.c \
	frcmpyf.c \
	frcmpyf_div.c \
	mpyf.c \
	negf.c \
	renormf.c \
	subf.c

C_SOURCE += $(GENERIC_MATH_FUNDAMENTAL_FLOAT_C_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC_MATH_FUNDAMENTAL_DOUBLE
#-----------------------------------------------------------------------------

GENERIC_MATH_FUNDAMENTAL_DOUBLE_C_SOURCE = \
	addd.c \
	cmpd.c \
	eqld.c \
	ged.c \
	gtd.c \
	led.c \
	ltd.c \
	neqld.c \
	cvtfd.c \
	divd.c \
	fixdi.c \
	fixdli.c \
	fixdlli.c \
	fixdu.c \
	fixdul.c \
	fixdull.c \
	fltid.c \
	fltlid.c \
	fltllid.c \
	fltud.c \
	fltuld.c \
	fltulld.c \
	frcaddd.c \
	frcdivd.c \
	frcmpyd.c \
	frcmpyd_div.c \
	mpyd.c \
	negd.c \
	renormd.c \
	subd.c

C_SOURCE += $(GENERIC_MATH_FUNDAMENTAL_DOUBLE_C_SOURCE)


#-----------------------------------------------------------------------------
# Group TSPA_C99_COMPLEX
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group GENERIC_MATH_COMMON_32BIT
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group GENERIC_MATH_COMMON_DOUBLE
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group TSPA_CPP
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group GENERIC_MATH_COMMON_64BIT
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group GENERIC_MATH_COMMON_FLOAT
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group C64P
#-----------------------------------------------------------------------------
ifeq ($(C64P),1)
VECTOR_TYPES=1
UNIVERSAL_FLAGS += -mv64+
endif


#-----------------------------------------------------------------------------
# Group C6740
#-----------------------------------------------------------------------------
ifeq ($(C6740),1)
VECTOR_TYPES=1
UNIVERSAL_FLAGS += -mv6740
endif


#-----------------------------------------------------------------------------
# Group GENERIC_MATH_COMMON
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group EXCEPTIONS
#-----------------------------------------------------------------------------
ifeq ($(EXCEPTIONS),1)
CPP_FLAGS += --exceptions
endif


#-----------------------------------------------------------------------------
# Group C6XABI
#-----------------------------------------------------------------------------
UNIVERSAL_FLAGS += --abi=eabi

C6XABI_ASM_SOURCE = \
	tdeh_uwentry_c6000.asm \
	tls_get_tp.asm

ASM_SOURCE += $(C6XABI_ASM_SOURCE)


C6XABI_C_SOURCE = \
	weak_return.c \
	divrem.c \
	tls.c

C_SOURCE += $(C6XABI_C_SOURCE)


C6XABI_CPP_SOURCE = \
	tdeh_pr_c6000.cpp

CPP_SOURCE += $(C6XABI_CPP_SOURCE)


#-----------------------------------------------------------------------------
# Group FREEBSD_C99_COMPLEX
#-----------------------------------------------------------------------------
FREEBSD_C99_COMPLEX_C_FLAGS += --c99

#-----------------------------------------------------------------------------
# Group GENERIC_MATH_LIBRARY_COMMON
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group STLPORT_CPP
#-----------------------------------------------------------------------------

STLPORT_CPP_CPP_SOURCE = \
	allocators.cpp \
	bitset.cpp \
	complex.cpp \
	complex_io.cpp \
	complex_trig.cpp \
	_ctype.cpp \
	dll_main.cpp \
	istream.cpp \
	ostream.cpp \
	sstream.cpp \
	string.cpp

CPP_SOURCE += $(STLPORT_CPP_CPP_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC
#-----------------------------------------------------------------------------
CPP_FLAGS += -fg --rtti
UNIVERSAL_FLAGS += -c --ti_lib --keep_unneeded_types=false

#-----------------------------------------------------------------------------
# Group C6600
#-----------------------------------------------------------------------------
ifeq ($(C6600),1)
VECTOR_TYPES=1
UNIVERSAL_FLAGS += -mv6600
endif


#-----------------------------------------------------------------------------
# Group FREEBSD_C99_COMPLEX_64_BIT
#-----------------------------------------------------------------------------
FREEBSD_C99_COMPLEX_64_BIT_C_FLAGS += --c99

FREEBSD_C99_COMPLEX_64_BIT_C_SOURCE = \
	catrig.c \
	k_exp.c \
	s_ccosh.c \
	s_cexp.c \
	s_csinh.c \
	s_csqrt.c \
	s_ctanh.c \
	s_log1p.c \
	e_hypot.c \
	s_copysign.c

#-----------------------------------------------------------------------------
# Group TI_SUPPLEMENTAL_C
#-----------------------------------------------------------------------------

TI_SUPPLEMENTAL_C_C_SOURCE = \
	signal.c \
	wchar.c

C_SOURCE += $(TI_SUPPLEMENTAL_C_C_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC_TI
#-----------------------------------------------------------------------------

GENERIC_TI_C_SOURCE = \
	ecvt.c \
	exit.c \
	fcvt.c \
	memory.c \
	_bufread.c \
	_data_synch.c \
	_io_perm.c \
	_lock.c \
	_mutex.c \
	_printfi.c \
	_printfi_min.c \
	_printfi_nf.c \
	_pthread.c \
	_scanfi.c \
	_scanfi_min.c \
	_scanfi_nf.c \
	_tvaltostr.c \
	args_main.c \
	asctime.c \
	assert.c \
	atexit.c \
	atof.c \
	atoi.c \
	atol.c \
	atoll.c \
	bcmp.c \
	bcopy.c \
	bsearch.c \
	bzero.c \
	clearerr.c \
	clock.c \
	ctime_.c \
	ctime64.c \
	ctype.c \
	defs.c \
	difftime.c \
	difftime64.c \
	fclose.c \
	feof.c \
	ferror.c \
	fflush.c \
	ffs.c \
	fgetc.c \
	fgetpos.c \
	fgets.c \
	fopen.c \
	fprintf.c \
	fputc.c \
	fputs.c \
	fread.c \
	fscanf.c \
	fseek.c \
	fsetpos.c \
	ftell.c \
	fwrite.c \
	getenv.c \
	gmtime.c \
	gmtime64.c \
	index.c \
	isalnum.c \
	isalpha.c \
	isascii.c \
	iscntrl.c \
	isdigit.c \
	isgraph.c \
	islower.c \
	isprint.c \
	ispunct.c \
	isspace.c \
	isupper.c \
	isxdigit.c \
	localtim.c \
	localtim64.c \
	lowlev.c \
	ltoa.c \
	memccpy.c \
	memchr.c \
	memcmp.c \
	memmov.c \
	mktime.c \
	mktime64.c \
	multibyte.c \
	perror.c \
	printf.c \
	qsort.c \
	rand.c \
	remove.c \
	rewind.c \
	rindex.c \
	setbuf.c \
	setlocale.c \
	setvbuf.c \
	sinit.c \
	snprintf.c \
	sprintf.c \
	sscanf.c \
	strcasecmp.c \
	strcat.c \
	strchr.c \
	strcmp.c \
	strcoll.c \
	strcpy.c \
	strcspn.c \
	strdup.c \
	strerror.c \
	strftime.c \
	strlen.c \
	strncasecmp.c \
	strncat.c \
	strncmp.c \
	strncpy.c \
	strpbrk.c \
	strrchr.c \
	strspn.c \
	strstr.c \
	strtod.c \
	strtof.c \
	strtok.c \
	strtol.c \
	strtold.c \
	strtoll.c \
	strtoul.c \
	strtoull.c \
	strtoimax.c \
	strtoumax.c \
	strxfrm.c \
	time.c \
	time64.c \
	tmpfile.c \
	tmpnam.c \
	tmzone.c \
	toascii.c \
	tolower.c \
	toupper.c \
	trgdrv.c \
	trgmsg.c \
	ungetc.c \
	vfprintf.c \
	vprintf.c \
	vsnprintf.c \
	vsprintf.c \
	wctype.c

C_SOURCE += $(GENERIC_TI_C_SOURCE)


#-----------------------------------------------------------------------------
# Group FREEBSD_C99_COMPLEX_COMMON
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group STLPORT_LOCALE
#-----------------------------------------------------------------------------
STLPORT_LOCALE_CPP_FLAGS += -O3

STLPORT_LOCALE_CPP_SOURCE = \
	unified_locale.cpp

#-----------------------------------------------------------------------------
# Group EDG_CPP_SUPPLEMENTAL
#-----------------------------------------------------------------------------
EDG_CPP_SUPPLEMENTAL_CPP_FLAGS += --building_runtime -DCHECKING=0 -DUSE_EDG_EXCEPTION_CLASSES=1

EDG_CPP_SUPPLEMENTAL_CPP_SOURCE = \
	exception_.cpp \
	bad_alloc.cpp

#-----------------------------------------------------------------------------
# Group CLASSIC_MATH_LIBRARY_INTEGER
#-----------------------------------------------------------------------------

CLASSIC_MATH_LIBRARY_INTEGER_C_SOURCE = \
	abs.c \
	labs.c \
	llabs.c \
	imaxabs.c \
	imaxdiv.c

C_SOURCE += $(CLASSIC_MATH_LIBRARY_INTEGER_C_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC_MATH_LIBRARY_INTEGER
#-----------------------------------------------------------------------------

GENERIC_MATH_LIBRARY_INTEGER_C_SOURCE = \
	div.c \
	ldiv.c \
	lldiv.c

C_SOURCE += $(GENERIC_MATH_LIBRARY_INTEGER_C_SOURCE)


#-----------------------------------------------------------------------------
# Group OPENBSD_C99_COMPLEX
#-----------------------------------------------------------------------------
OPENBSD_C99_COMPLEX_C_FLAGS += --c99

OPENBSD_C99_COMPLEX_C_SOURCE = \
	s_clog.c \
	s_clogf.c \
	s_clogl.c \
	s_cpow.c \
	s_cpowf.c \
	s_cpowl.c

#-----------------------------------------------------------------------------
# Group TSPA_COMPLEX_HEADERS
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group BIG_ENDIAN
#-----------------------------------------------------------------------------
ifeq ($(BIG_ENDIAN),1)
UNIVERSAL_FLAGS += -me
endif


#-----------------------------------------------------------------------------
# Group FREEBSD_C99_COMPLEX_32_BIT
#-----------------------------------------------------------------------------
FREEBSD_C99_COMPLEX_32_BIT_C_FLAGS += --c99

FREEBSD_C99_COMPLEX_32_BIT_C_SOURCE = \
	catrigf.c \
	k_expf.c \
	s_carg.c \
	s_cargf.c \
	s_cargl.c \
	s_ccoshf.c \
	s_cexpf.c \
	s_cimag.c \
	s_cimagf.c \
	s_cimagl.c \
	s_conj.c \
	s_conjf.c \
	s_conjl.c \
	s_cproj.c \
	s_cprojf.c \
	s_cprojl.c \
	s_creal.c \
	s_crealf.c \
	s_creall.c \
	s_csinhf.c \
	s_csqrtf.c \
	s_ctanhf.c \
	w_cabs.c \
	w_cabsf.c \
	w_cabsl.c \
	s_log1pf.c \
	e_hypotf.c \
	s_copysignf.c

#-----------------------------------------------------------------------------
# Group NOT_VENC_ASM
#-----------------------------------------------------------------------------
ifneq ($(VENC),1)
NOT_VENC_ASM=1
endif


NOT_VENC_ASM_ASM_SOURCE = \
	push.asm \
	call_stub.asm \
	setjmp.asm

ASM_SOURCE += $(NOT_VENC_ASM_ASM_SOURCE)


#-----------------------------------------------------------------------------
# Group FREEBSD_SUPPLEMENTAL_C
#-----------------------------------------------------------------------------

FREEBSD_SUPPLEMENTAL_C_C_SOURCE = \
	wcslen.c \
	wmemchr.c \
	wmemcmp.c \
	wmemcpy.c \
	wmemmove.c \
	wmemset.c \
	wcscmp.c \
	wcsncmp.c \
	wcsncpy.c \
	ascii.c

C_SOURCE += $(FREEBSD_SUPPLEMENTAL_C_C_SOURCE)


#-----------------------------------------------------------------------------
# Group VECTOR_TYPES
#-----------------------------------------------------------------------------
C_FLAGS += --vectypes

VECTOR_TYPES_C_SOURCE = \
	c6x_veclib.c

C_SOURCE += $(VECTOR_TYPES_C_SOURCE)


#-----------------------------------------------------------------------------
# Group C6000
#-----------------------------------------------------------------------------
ifneq ($(VENC),1)
C6000=1
endif


C6000_ASM_SOURCE = \
	divi.asm \
	divu.asm \
	memcpy64.asm \
	remi.asm \
	remu.asm \
	strasg.asm

ASM_SOURCE += $(C6000_ASM_SOURCE)


#-----------------------------------------------------------------------------
# Group MT
#-----------------------------------------------------------------------------
ifeq ($(MT),1)
UNIVERSAL_FLAGS += --multithread --use_libc_tls -D__TI_SHARED_DATA_SYNCHRONIZATION -D__TI_RECURSIVE_RESOURCE_MUTEXES
endif


#-----------------------------------------------------------------------------
# Group GENERIC_EDG
#-----------------------------------------------------------------------------
GENERIC_EDG_CPP_FLAGS += --building_runtime -DCHECKING=0
GENERIC_EDG_C_FLAGS += --building_runtime -DCHECKING=0

GENERIC_EDG_CPP_SOURCE = \
	array_del.cpp \
	array_new.cpp \
	array_nodel.cpp \
	array_nonew.cpp \
	array_pdel.cpp \
	array_pnew.cpp \
	delete.cpp \
	delnothrow.cpp \
	dtor_list.cpp \
	error.cpp \
	guard.cpp \
	memzero.cpp \
	new_.cpp \
	newhandler.cpp \
	newnothrow.cpp \
	placedel.cpp \
	placenew.cpp \
	pure_virt.cpp \
	rtti.cpp \
	set_new.cpp \
	typeinfo_.cpp \
	vars.cpp \
	vec_cctor.cpp \
	vec_newdel.cpp \
	vla_alloc.cpp

#-----------------------------------------------------------------------------
# Group EABI
#-----------------------------------------------------------------------------
EABI_C_FLAGS += --building_runtime -DCHECKING=0
EABI_CPP_FLAGS += --building_runtime -DCHECKING=0

EABI_CPP_C_SOURCE = \
	decode.c

CPP_C_SOURCE += $(EABI_CPP_C_SOURCE)


#-----------------------------------------------------------------------------
# Group CLASSIC_CPP_MATH_OVERLOADS
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group EABI_TDEH
#-----------------------------------------------------------------------------
ifeq ($(C6XABI),1)
ifeq ($(EXCEPTIONS),1)
EABI_TDEH=1
endif
endif

ifeq ($(EABI_TDEH),1)
EABI_TDEH_CPP_FLAGS += --building_runtime -DCHECKING=0
UNIVERSAL_FLAGS += -D__TI_TABLE_DRIVEN_EXCEPTIONS
CPP_FLAGS += --extern_c_can_throw

EABI_TDEH_CPP_SOURCE = \
	tdeh_unwinder.cpp \
	tdeh_cpp_abi.cpp \
	tdeh_pr_common.cpp \
	tdeh_init.cpp
endif


#-----------------------------------------------------------------------------
# Group EDG_C99_COMPLEX_HELPER
#-----------------------------------------------------------------------------
EDG_C99_COMPLEX_HELPER_C_FLAGS += --building_runtime -DCHECKING=0
EDG_C99_COMPLEX_HELPER_CPP_FLAGS += --building_runtime -DCHECKING=0

EDG_C99_COMPLEX_HELPER_C_SOURCE = \
	c99_complex.c

#-----------------------------------------------------------------------------
# Group CLASSIC_ERRNO
#-----------------------------------------------------------------------------

CLASSIC_ERRNO_C_SOURCE = \
	errno.c

C_SOURCE += $(CLASSIC_ERRNO_C_SOURCE)



EDG_C99_COMPLEX_HELPER_C_OBJS_1 = $(patsubst %.c,$(OBJ)/%.obj,$(notdir $(EDG_C99_COMPLEX_HELPER_C_SOURCE)))
$(EDG_C99_COMPLEX_HELPER_C_OBJS_1): $(OBJ)/%.obj: %.c
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(EDG_C99_COMPLEX_HELPER_FLAGS) $(C_FLAGS) $(EDG_C99_COMPLEX_HELPER_C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

EABI_TDEH_CPP_OBJS_2 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(EABI_TDEH_CPP_SOURCE)))
$(EABI_TDEH_CPP_OBJS_2): $(OBJ)/%.obj: %.cpp
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(EABI_TDEH_FLAGS) $(CPP_FLAGS) $(EABI_TDEH_CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

GENERIC_EDG_CPP_OBJS_3 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(GENERIC_EDG_CPP_SOURCE)))
$(GENERIC_EDG_CPP_OBJS_3): $(OBJ)/%.obj: %.cpp
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(GENERIC_EDG_FLAGS) $(CPP_FLAGS) $(GENERIC_EDG_CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

FREEBSD_C99_COMPLEX_32_BIT_C_OBJS_4 = $(patsubst %.c,$(OBJ)/%.obj,$(notdir $(FREEBSD_C99_COMPLEX_32_BIT_C_SOURCE)))
$(FREEBSD_C99_COMPLEX_32_BIT_C_OBJS_4): $(OBJ)/%.obj: %.c
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(FREEBSD_C99_COMPLEX_32_BIT_FLAGS) $(C_FLAGS) $(FREEBSD_C99_COMPLEX_32_BIT_C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

OPENBSD_C99_COMPLEX_C_OBJS_5 = $(patsubst %.c,$(OBJ)/%.obj,$(notdir $(OPENBSD_C99_COMPLEX_C_SOURCE)))
$(OPENBSD_C99_COMPLEX_C_OBJS_5): $(OBJ)/%.obj: %.c
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(OPENBSD_C99_COMPLEX_FLAGS) $(C_FLAGS) $(OPENBSD_C99_COMPLEX_C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

EDG_CPP_SUPPLEMENTAL_CPP_OBJS_6 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(EDG_CPP_SUPPLEMENTAL_CPP_SOURCE)))
$(EDG_CPP_SUPPLEMENTAL_CPP_OBJS_6): $(OBJ)/%.obj: %.cpp
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(EDG_CPP_SUPPLEMENTAL_FLAGS) $(CPP_FLAGS) $(EDG_CPP_SUPPLEMENTAL_CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

STLPORT_LOCALE_CPP_OBJS_7 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(STLPORT_LOCALE_CPP_SOURCE)))
$(STLPORT_LOCALE_CPP_OBJS_7): $(OBJ)/%.obj: %.cpp
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(STLPORT_LOCALE_FLAGS) $(CPP_FLAGS) $(STLPORT_LOCALE_CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

FREEBSD_C99_COMPLEX_64_BIT_C_OBJS_8 = $(patsubst %.c,$(OBJ)/%.obj,$(notdir $(FREEBSD_C99_COMPLEX_64_BIT_C_SOURCE)))
$(FREEBSD_C99_COMPLEX_64_BIT_C_OBJS_8): $(OBJ)/%.obj: %.c
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(FREEBSD_C99_COMPLEX_64_BIT_FLAGS) $(C_FLAGS) $(FREEBSD_C99_COMPLEX_64_BIT_C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

CPP_OBJS_9 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(CPP_SOURCE)))
$(CPP_OBJS_9): $(OBJ)/%.obj: %.cpp
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

CPP_C_OBJS_10 = $(patsubst %.c,$(OBJ)/%.obj,$(notdir $(CPP_C_SOURCE)))
$(CPP_C_OBJS_10): $(OBJ)/%.obj: %.c
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

ASM_OBJS_11 = $(patsubst %.asm,$(OBJ)/%.obj,$(notdir $(ASM_SOURCE)))
$(ASM_OBJS_11): $(OBJ)/%.obj: %.asm
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) --asm_dependency=$(OBJ)/$(basename $(@F)).pp
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

C_OBJS_12 = $(patsubst %.c,$(OBJ)/%.obj,$(notdir $(C_SOURCE)))
$(C_OBJS_12): $(OBJ)/%.obj: %.c
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) -ppa -ppd --pp_directory=$(OBJ)
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp

LINASM_OBJS_13 = $(patsubst %.sa,$(OBJ)/%.obj,$(notdir $(LINASM_SOURCE)))
$(LINASM_OBJS_13): $(OBJ)/%.obj: %.sa
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)
	$(CC) $< $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ) --asm_dependency=$(OBJ)/$(basename $(@F)).pp
	@cp $(OBJ)/$(basename $(@F)).pp $(OBJ)/$(basename $(@F)).P
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\$$//' \
	-e '/^$$/ d' -e 's/$$/ :/' < $(OBJ)/$(basename $(@F)).pp >> $(OBJ)/$(basename $(@F)).P; \
	rm -f $(OBJ)/$(basename $(@F)).pp
ALL_OBJS = $(EDG_C99_COMPLEX_HELPER_C_OBJS_1) $(EABI_TDEH_CPP_OBJS_2) $(GENERIC_EDG_CPP_OBJS_3) $(FREEBSD_C99_COMPLEX_32_BIT_C_OBJS_4) $(OPENBSD_C99_COMPLEX_C_OBJS_5) $(EDG_CPP_SUPPLEMENTAL_CPP_OBJS_6) $(STLPORT_LOCALE_CPP_OBJS_7) $(FREEBSD_C99_COMPLEX_64_BIT_C_OBJS_8) $(CPP_OBJS_9) $(CPP_C_OBJS_10) $(ASM_OBJS_11) $(C_OBJS_12) $(LINASM_OBJS_13)
-include $(ALL_OBJS:.obj=.P)

library: $(ALL_OBJS)
	$(CD) $(OBJ); $(AR) -qa $(LIB) *.obj

info:
	@echo EDG_C99_COMPLEX_HELPER_C_OBJS_1 $(EDG_C99_COMPLEX_HELPER_C_OBJS_1)
	@echo EABI_TDEH_CPP_OBJS_2 $(EABI_TDEH_CPP_OBJS_2)
	@echo GENERIC_EDG_CPP_OBJS_3 $(GENERIC_EDG_CPP_OBJS_3)
	@echo FREEBSD_C99_COMPLEX_32_BIT_C_OBJS_4 $(FREEBSD_C99_COMPLEX_32_BIT_C_OBJS_4)
	@echo OPENBSD_C99_COMPLEX_C_OBJS_5 $(OPENBSD_C99_COMPLEX_C_OBJS_5)
	@echo EDG_CPP_SUPPLEMENTAL_CPP_OBJS_6 $(EDG_CPP_SUPPLEMENTAL_CPP_OBJS_6)
	@echo STLPORT_LOCALE_CPP_OBJS_7 $(STLPORT_LOCALE_CPP_OBJS_7)
	@echo FREEBSD_C99_COMPLEX_64_BIT_C_OBJS_8 $(FREEBSD_C99_COMPLEX_64_BIT_C_OBJS_8)
	@echo CPP_OBJS_9 $(CPP_OBJS_9)
	@echo CPP_C_OBJS_10 $(CPP_C_OBJS_10)
	@echo ASM_OBJS_11 $(ASM_OBJS_11)
	@echo C_OBJS_12 $(C_OBJS_12)
	@echo LINASM_OBJS_13 $(LINASM_OBJS_13)
	@echo CPP_FLAGS $(CPP_FLAGS)
	@echo C_FLAGS $(C_FLAGS)
	@echo EABI_TDEH_CPP_FLAGS $(EABI_TDEH_CPP_FLAGS)
	@echo EABI_TDEH_FLAGS $(EABI_TDEH_FLAGS)
	@echo EDG_C99_COMPLEX_HELPER_C_FLAGS $(EDG_C99_COMPLEX_HELPER_C_FLAGS)
	@echo EDG_C99_COMPLEX_HELPER_FLAGS $(EDG_C99_COMPLEX_HELPER_FLAGS)
	@echo EDG_CPP_SUPPLEMENTAL_CPP_FLAGS $(EDG_CPP_SUPPLEMENTAL_CPP_FLAGS)
	@echo EDG_CPP_SUPPLEMENTAL_FLAGS $(EDG_CPP_SUPPLEMENTAL_FLAGS)
	@echo EXTRA_FLAGS $(EXTRA_FLAGS)
	@echo FREEBSD_C99_COMPLEX_32_BIT_C_FLAGS $(FREEBSD_C99_COMPLEX_32_BIT_C_FLAGS)
	@echo FREEBSD_C99_COMPLEX_32_BIT_FLAGS $(FREEBSD_C99_COMPLEX_32_BIT_FLAGS)
	@echo FREEBSD_C99_COMPLEX_64_BIT_C_FLAGS $(FREEBSD_C99_COMPLEX_64_BIT_C_FLAGS)
	@echo FREEBSD_C99_COMPLEX_64_BIT_FLAGS $(FREEBSD_C99_COMPLEX_64_BIT_FLAGS)
	@echo GENERIC_EDG_CPP_FLAGS $(GENERIC_EDG_CPP_FLAGS)
	@echo GENERIC_EDG_FLAGS $(GENERIC_EDG_FLAGS)
	@echo OPENBSD_C99_COMPLEX_C_FLAGS $(OPENBSD_C99_COMPLEX_C_FLAGS)
	@echo OPENBSD_C99_COMPLEX_FLAGS $(OPENBSD_C99_COMPLEX_FLAGS)
	@echo STANDARD_FLAGS $(STANDARD_FLAGS)
	@echo STLPORT_LOCALE_CPP_FLAGS $(STLPORT_LOCALE_CPP_FLAGS)
	@echo STLPORT_LOCALE_FLAGS $(STLPORT_LOCALE_FLAGS)
	@echo UNIVERSAL_FLAGS $(UNIVERSAL_FLAGS)
