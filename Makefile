.PHONY: all
all: examgen examgen.pdf

examgen: examgen.py
	cp $^ $@
	chmod +x $@

examgen.py: examgen.nw

examgen.pdf: examgen.nw abstract.tex examgen.bib LICENSE
examgen.pdf: infosakb-150601.tex


.PHONY: clean
clean:
	${RM} examgen examgen.py examgen.pdf examgen.tex


PKG_NAME-main= 			examgen
PKG_FILES-main= 		examgen
PKG_PREFIX-main= 		/usr/local
PKG_DIR-main= 			/bin
PKG_TARBALL_FILES-main= ${PKG_FILES-main} Makefile


INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/package.mk
