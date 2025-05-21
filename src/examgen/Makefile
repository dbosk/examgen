.PHONY: all
all: __init__.py

__init__.py: init.py
	${MV} $< $@

.PHONY: clean
clean:
	${RM} __init__.py
	${RM} init.tex

INCLUDE_MAKEFILES=../../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
