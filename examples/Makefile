.PHONY: all
all: example.mk


.PHONY: clean distclean
clean:
	${RM} example.mk
	${RM} example.tex

distclean:
	true


INCLUDE_MAKEFILES?=../makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk
