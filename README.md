examgen
===============================================================================

`examgen` is an exam generator for the LaTeX document class `exam`.  It is 
written using literate programming through [NOWEB][noweb].  The program code is 
Python 3 and the documentation is LaTeX.

[noweb]: https://github.com/nrnrnr/noweb


Installation
===============================================================================

There are two options for "installing" this utility.  Either go to 
[releases][Releases], download the code and put it in your PATH.
Otherwise you can follow the build instructions below.

[Releases]: https://github.com/dbosk/examgen/releases

Building
-------------------------------------------------------------------------------

To build the executable file you need [NOWEB][noweb], there is a package on 
most systems.  For the documented source code you also need a LaTeX 
distribution, e.g. [TeXLive][TL].  There are TeXLive packages for most systems.
Finally, to run the program you need [Python 3][py3].  These should also be 
available on most systems.

[TL]: https://www.tug.org/texlive/
[py3]: https://www.python.org/

Once you have the dependencies.  Make sure to first clone the submodules:
```sh
git submodule update --init
```
Then you can build the documentation PDF by
```sh
make examgen.pdf
```
To get the executable code run
```sh
make examgen
```
then run `./examgen -h` to get the usage.  (You can also run `make examgen.py` 
is you prefer to have the .py file-name extension.)  Finally, if you'd like to 
have the `examgen` command available somewhere in your $PATH, then
```
sudo make install
```
will put `examgen` in `/usr/local/bin`.

In summary:
```
$ git submodule update --init
$ make examgen.pdf examgen
$ sudo make install
```


Example usage
===============================================================================

To generate the exams I have an exam directory for the course, in this          
directory I have a Makefile which says something along the lines of:

```Makefile
.PHONY: 2016
2016: exam-160603.pdf exam-160822.pdf exam-161024.pdf

exam-161024.pdf: exam-161024.tex miunexam
exam-160822.pdf: exam-160822.tex miunexam
exam-160603.pdf: exam-160603.tex miunexam

MODULE_QUESTION_DBs+=   ../modules/crypto/questions.tex
MODULE_QUESTION_DBs+=   ../modules/crypto/slides.tex
EXAM_TAGS+=             AnalyseNeededCryptoProperties
EXAM_TAGS+=             DesignSystemsWithCryptoProperties

# ...

new_exam_questions.tex: ${MODULE_QUESTION_DBs}
    examgen -d ${MODULE_QUESTION_DBs} -t ${EXAM_TAGS} -i > $@


INCLUDE_MIUNTEX=../miuntex      # https://github.com/dbosk/miuntex
INCLUDE_MAKEFILES=../makefiles  # https://github.com/dbosk/makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/miun.depend.mk
```

Whenever I get the reminder that I should submit new exams for a course I just 
run the command `make new_exam_questions.tex` in that directory, that will 
create questions for one exam.  Then I can easily create the three exams needed 
for the year by repeating the process.

What actually happens when I run that command is the following:

 - The exam generator will try to find questions in the files 
   MODULE_QUESTION_DBs whose tags are subsets of the required tags 
   specified in EXAM_TAGS. The exam needs enough questions to cover the 
   required tags --- but no tags which are not in the required tags.

 - The -i parameter enables the interactive (or inspirational) mode.  
   This opens each qualifying question in the user's favourite editor, 
   set by the EDITOR environment variable. This allows you to use the 
   exam generator to generate questions for inspiration: you use the 
   questions as starting points when creating new ones. But if 
   a question truly is the perfect question you can always use the 
   question without any modification.

 - The way the questions are tagged is as follows.  Each question is tagged 
   with the intended learning outcomes (ILOs) it covers --- which is what we 
   examine in a course!  The ILOs in the course syllabus represent the *least* 
   a student should be able to do to pass the course.  So we need ILOs for the 
   higher grades too to be able to grade an exam A-F. In the example above: 
   AnalyseNeededCryptoProperties for E and DesignSystemsWithCryptoProperties 
   for A.

