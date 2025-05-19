.PHONY: all
all: examgen.pdf

LATEXFLAGS=	-shell-escape

examgen.pdf: examgen.tex abstract.tex examgen.bib
examgen.pdf: acknowledgements.tex LICENSE
examgen.pdf: examgen.py
examgen.pdf: example.tex
examgen.pdf: makefiles/exam.tex

examgen.pdf: didactic.sty
examgen.pdf: dasak-150604.pdf

examgen.tex: examgen.nw
example.tex: example.mk.nw

all: examgen

examgen.py: examgen.nw
examgen: examgen.py
	cp $^ $@
	chmod +x $@

all: example.mk

example.mk: example.mk.nw

makefiles/exam.tex: makefiles/exam.mk.nw
	${MAKE} -C makefiles exam.tex

.PHONY: clean
clean:
	${RM} examgen examgen.py examgen.pdf examgen.tex
	${RM} example.mk example.tex


PREFIX?= 				/usr/local

PKG_NAME-main= 			examgen
PKG_INSTALL_FILES-main= examgen
PKG_PREFIX-main= 		${PREFIX}
PKG_INSTALL_DIR-main= 	/bin
PKG_TARBALL_FILES-main= ${PKG_INSTALL_FILES-main} Makefile


INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/pkg.mk
INCLUDE_DIDACTIC=didactic
include ${INCLUDE_DIDACTIC}/didactic.mk
