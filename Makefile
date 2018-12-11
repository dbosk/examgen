SUBDIR+= 	examgen
SUBDIR+= 	pyexam
SUBDIR+= 	examples

INCLUDE_MAKEFILES?=./makefiles
include ${INCLUDE_MAKEFILES}/subdir.mk
