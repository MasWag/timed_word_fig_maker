timed word fig maker
====================

[![Regression Test](https://github.com/MasWag/timed_word_fig_maker/actions/workflows/regression_test.yml/badge.svg?branch=master)](https://github.com/MasWag/timed_word_fig_maker/actions/workflows/regression_test.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)

Generate a figure of timed word from csv input. 

Usage
-----

```
awk -v scale=5.0 -v duration=3.7 -f ./draw.awk  < ./examples/input.csv > output.tex
pdflatex output.tex
pdf2svg output.pdf output.svg
```

Example
-------

From the following csv, you can output the figure below.

```
login(Alice),0.8
logout(Alice),  1.2
login(Bob),2.0
logout(Bob),3.5
```

![Sample Output](examples/output.svg)

Since the timed word is drawn using tikz, you can use the usual LaTeX math expression. For example, from the following csv, you get the following figure.

```
$\mathcal{A}$,0.8
$\int_0^\infty f(x)$,1.2
$\mathrm{P} \land \mathrm{Q}$,2.0
$x \in \mathbb{R}$,3.5
```

![Sample Math Output](examples/output_math.svg)

Requirements
------------

The script `draw.awk` only depends on an AWK, but in order to generate pdf or svg figure, you also need `pdflatex` and `pdf2svg`.
