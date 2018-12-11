#!/usr/bin/env python3
""" examtools: a library for generating exams """

import setuptools

with open("README.md", "r") as fh:
    README = fh.read()

setuptools.setup(
    name="examtools",
    version="0.1",
    author="Daniel Bosk",
    author_email="daniel.bosk@miun.se",
    description="A library for generating exams",
    long_description=README,
    long_description_content_type="text/markdown",
    url="https://github.com/dbosk/examtools",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
