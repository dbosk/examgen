PKG_NAME-main= 			examgen
PKG_INSTALL_FILES-main= examgen
PKG_PREFIX-main= 		/usr/local
PKG_DIR-main= 			/bin
PKG_TARBALL_FILES-main= ${PKG_INSTALL_FILES-main} Makefile


.PHONY: all
all: examgen examgen.pdf

examgen.py: examgen.nw
examgen: examgen.py
	cp $^ $@
	chmod +x $@

examgen.pdf: examgen.tex preamble.tex abstract.tex examgen.bib
examgen.pdf: acknowledgements.tex LICENSE
examgen.pdf: example.tex

examgen.tex: examgen.nw

LICENSE: ../LICENSE
	${LN} $< $@

example.tex: ../examples/example.mk.nw
	${NOWEAVE}


.PHONY: clean
clean:
	${RM} examgen examgen.py
	${RM} examgen.pdf
	${RM} LICENSE
	${RM} example.tex



INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/pkg.mk
