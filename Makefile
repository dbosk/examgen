SUBDIR_GOALS=all clean distclean

SUBDIR+=	src/examgen
SUBDIR+=	doc

version=$(shell sed -n 's/^ *version *= *\"\([^\"]\+\)\"/\1/p' pyproject.toml)

.PHONY: all publish

all: README.md

README.md: doc/abstract.tex
	pandoc -o $@ $< -t gfm
	${EDITOR} $@

publish: all
	poetry build
	poetry publish
	git push
	gh release create -t v${version} v${version} \
		doc/kthutils.pdf \
		src/kthutils/restlabb.sh src/kthutils/restlabbsetup.sh


.PHONY: clean distclean
clean:
distclean:
	${RM} -Rf dist

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/subdir.mk
