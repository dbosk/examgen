.PHONY: all
all: examgen.pdf

examgen.pdf: examgen.tex abstract.tex examgen.bib LICENSE
examgen.pdf: exam.tex

examgen.tex: examgen.nw
exam.tex: exam.mk.nw

all: examgen

examgen.py: examgen.nw
examgen: examgen.py
	cp $^ $@
	chmod +x $@

all: exam.mk

exam.mk: exam.mk.nw

.PHONY: clean
clean:
	${RM} examgen examgen.py examgen.pdf examgen.tex
	${RM} exam.mk exam.tex


PKG_NAME-main= 			examgen
PKG_FILES-main= 		examgen
PKG_PREFIX-main= 		/usr/local
PKG_DIR-main= 			/bin
PKG_TARBALL_FILES-main= ${PKG_FILES-main} Makefile


INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/package.mk
