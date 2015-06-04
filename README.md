examgen
===============================================================================

`examgen` is an exam generator for the LaTeX document class `exam`.  It is 
written using literate programming through [NOWEB][noweb].  The program code is 
Python 3 and the documentation is LaTeX.

[noweb]: https://github.com/nrnrnr/noweb


Building
-------------------------------------------------------------------------------

To build the executable file you need [NOWEB][noweb], there is a package on 
most systems.  For the documented source code you also need a LaTeX 
distribution, e.g. [TeXLive][TL].  There are TeXLive packages for most systems.  
Finally, to run the program you need [Python 3][py3] with the `readline` 
module.  These should also be available on most systems.

[TL]: https://www.tug.org/texlive/
[py3]: https://www.python.org/

Once you have the dependencies.  Make sure to first clone the submodules: `git 
submodule update --init`.  Then you can build the documentation PDF by `make 
examgen.pdf`.  To get the executable code run `make examgen`, then run 
`./examgen` to get the usage.  (You can also run `make examgen.py` is you 
prefer to have the .py file-name extension.)

In summary:
```
$ git submodule update --init
$ make examgen.pdf
$ make examgen
```
