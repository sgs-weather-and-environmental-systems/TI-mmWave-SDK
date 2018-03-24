# ==============================================================================
# File            : Makedocs.mk
# Description     : 
#
#   GNU makefile to generate release notes using Doxygen
#
# ==============================================================================

# The target for generating release Notes using doxygen is releasenotes

# The target for generating documents using doxygen is gendocs
DSPLIB_MANIFEST=./docs/manifest/Software_Manifest.html
RELEASE_DOC=./docs/doxygen/release.chm


releasenotes : $(RELEASE_DOC)

$(RELEASE_DOC): ./docs/doxygen/release.h
	-@echo generating Release Notes ...
	if test ! -d ./docs/doxygen/html; then mkdir ./docs/doxygen/html; fi
	cp $(TI_DOXYGEN_TEMPLATES)/*.* ./docs/doxygen/html
	doxygen $(SWTOOLS_DIR)/docs/doxygen/releaseDoxyfile
	@xs -f $(SWTOOLS_DIR)/release.js

DSPLIB_DOC=./docs/doxygen/DSPLIB.chm

release : $(DSPLIB_DOC)

gendocs $(DSPLIB_DOC): ./docs/doxygen/doxygen.h  ./docs/doxygen/Doxyfile
	-@echo generating DSPLIB documentation ...
	if test ! -d ./docs/doxygen/html; then mkdir ./docs/doxygen/html; fi
	cp $(TI_DOXYGEN_TEMPLATES)/*.* ./docs/doxygen/html
	doxygen ./docs/doxygen/Doxyfile

genmanifest $(DSPLIB_MANIFEST): ./docs/manifest/manifest.xml
	-@echo generating DSPLIB Software Manifest ...
	@php $(SWTOOLS_DIR)/mangen.php $(DSPLIB_MANIFEST) $?

# End of Makedocs.mk
