# ==============================================================================
# File            : Makedocs.mk
# Description     : 
#
#   GNU makefile to generate release notes using Doxygen
#
# ==============================================================================

# The target for generating release Notes using doxygen is releasenotes

# The target for generating documents using doxygen is gendocs
#blw! MATHLIB_MANIFEST=./docs/manifest/Software_Manifest.html ,NOW USING SRAS-GENERATED MANIFEST,
RELEASE_DOC=./docs/doxygen/release.chm
MASPATH = ../../ti

releasenotes : $(RELEASE_DOC)

$(RELEASE_DOC): ./docs/doxygen/release.h
	-@echo generating Release Notes ...
	if test ! -d ./docs/doxygen/tmp; then mkdir ./docs/doxygen/tmp; fi
	cp $(TI_DOXYGEN_TEMPLATES)/*.* ./docs/doxygen/tmp
	doxygen $(MASPATH)/mas/swtools/docs/doxygen/releaseDoxyfile
	@xs -f $(MASPATH)/mas/swtools/release.js
	rm -rf ./docs/doxygen/tmp

MATHLIB_DOC      =./docs/doxygen/MATHLIB_Function_Reference.chm

release: $(MATHLIB_DOC) #blw! $(MATHLIB_MANIFEST) ,USE SRAS-GENERATED MANIFEST,

gendocs $(MATHLIB_DOC): ./docs/doxygen/doxygen.h  ./docs/doxygen/Doxyfile
	-@echo generating MATHLIB documentation ...
	if test ! -d ./docs/doxygen/html; then mkdir ./docs/doxygen/html; fi
	cp $(TI_DOXYGEN_TEMPLATES)/*.* ./docs/doxygen/html
	doxygen ./docs/doxygen/Doxyfile

#blw! USE SRAS-GENERATED MANFIEST
#blw! genmanifest $(MATHLIB_MANIFEST): ./docs/manifest/manifest.xml 
	#blw! -@echo generating MATHLIB Software Manifest ...
	#blw! @php $(MASPATH)/mas/swtools/mangen.php $(MATHLIB_MANIFEST) $?

# End of Makedocs.mk
