.PHONY: package
package: setup.py examtools/examgen.py
	./setup.py sdist bdist_wheel

examtools/examgen.py:
	${MAKE} -C $(dir $@) $(notdir $@)


.PHONY: pypi
pypi: package
	twine upload dist/*


.PHONY: clean distclean
clean:
	${RM} -R build dist examtools.egg-info

distclean:
	true

