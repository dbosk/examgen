SUBDIR+= 	examples
SUBDIR+= 	examtools


.PHONY: package
package: setup.py examtools/examgen.py
	./setup.py sdist bdist_wheel

examtools/examgen.py:
	${MAKE} -C $(dir $@) $(notdir $@)


.PHONY: pypi
pypi: package
	twine upload dist/*


.PHONY: all
all: package
	$(foreach d,${SUBDIR},${MAKE} -C $d $@;)


.PHONY: clean distclean
clean:
	${RM} -R build dist examtools.egg-info
	$(foreach d,${SUBDIR},${MAKE} -C $d $@;)

distclean:
	$(foreach d,${SUBDIR},${MAKE} -C $d $@;)

