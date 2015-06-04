.PHONY: all
all: examgen examgen.pdf

examgen: examgen.py
	cp $^ $@
	chmod +x $@

examgen.py: examgen.py.nw
examgen.pdf: examgen.py.nw examgen.bib LICENSE
examgen.pdf: infosakb-150601.tex

.PHONY: clean
clean:
	${RM} examgen examgen.py examgen.pdf examgen.tex


INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
