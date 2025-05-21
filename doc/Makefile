.PHONY: all
all: examgen.pdf

LATEXFLAGS+=	-shell-escape -xelatex
TEX_PYTHONTEX=	yes
PYTHONTEXFLAGS=	--interpreter "python:poetry run python3"

examgen.pdf: examgen.tex
examgen.pdf: abstract.tex examgen.bib
examgen.pdf: acknowledgements.tex ../LICENSE
examgen.pdf: init.py
examgen.pdf: example.tex
examgen.pdf: ../makefiles/exam.tex

examgen.pdf: didactic.sty
examgen.pdf: dasak-150604.pdf

examgen.tex: ../src/examgen/init.tex
init.py: ../src/examgen/__init__.py

examgen.tex init.py:
	${LN} $< $@

example.tex: example.mk.nw

all: example.mk

example.mk: example.mk.nw

../makefiles/exam.tex: ../makefiles/exam.mk.nw

../%:
	${MAKE} -C $(dir $@) $(notdir $@)

.PHONY: clean
clean:
	${RM} init.py examgen.pdf init.tex
	${RM} example.mk example.tex


INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
INCLUDE_DIDACTIC=didactic
include ${INCLUDE_DIDACTIC}/didactic.mk
