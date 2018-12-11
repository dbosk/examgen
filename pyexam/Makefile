.PHONY: all
all: pyexam.py pyexam.pdf

pyexam.py: pyexam.nw
	${NOTANGLE.py}
	chmod +x $@

pyexam.pdf: pyexam.tex preamble.tex abstract.tex pyexam.bib
pyexam.pdf: acknowledgements.tex LICENSE
pyexam.pdf: example.tex

pyexam.tex: pyexam.nw

LICENSE: ../LICENSE
	${LN} $< $@

example.tex: ../examples/example.mk.nw
	${NOWEAVE}


.PHONY: clean
clean:
	${RM} pyexam.py
	${RM} pyexam.pdf
	${RM} LICENSE
	${RM} example.tex



INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/pkg.mk
