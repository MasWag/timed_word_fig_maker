#!/usr/bin/env awk -f
#****h* timed_word_fig_maker/draw
# NAME
#  timed_word_fig_maker
# DESCRIPTION
#  Generates a figure of timed word from CSV input.
#
# EXAMPLE
#   awk -v scale=5.0 -v duration=3.7 -f ./draw.awk  < ./examples/input.csv > output.tex
#   pdflatex output.tex
#   pdf2svg output.pdf output.svg
#
# PORTABILITY
#  The script `draw.awk` only depends on an AWK, but to generate pdf or svg figure, you also need `pdflatex` and `pdf2svg`.
#******

BEGIN{
    FS = ","
    # Set the default parameters
    if (duration == 0) {
        duration = 5;
    }
    if (scale == 0) {
        scale = 1;
    }
    print "\\documentclass{standalone}"
    print "\\usepackage{amssymb,amsmath}"
    print "\\usepackage{tikz}"
    print "\\usetikzlibrary{automata,positioning,matrix,shapes.callouts}"
    print "\\begin{document}"
    print "\\begin{tikzpicture}"
    print "% scale"
    printf "\\draw [thick, -stealth](-0.5,0)--(%f,0) node [anchor=north]{$t$};\n", duration * scale
    print "\\draw (0,0.1) -- (0,-0.1) node [anchor=north]{$0$};"
    print ""
    print "% alphabets"
}
{
    event = $1
    timestamp = $2
    scaled_timestamp = timestamp * scale
    if (no_timestamp) {
        printf "\\draw (%f,0.1) node[anchor=south]{%s} -- (%f,-0.1);\n",  scaled_timestamp, event, scaled_timestamp
    } else {
        printf "\\draw (%f,0.1) node[anchor=south]{%s} -- (%f,-0.1) node[anchor=north]{%s};\n",  scaled_timestamp, event, scaled_timestamp, timestamp
    }
}
END {
    print "\\end{tikzpicture}"
    print "\\end{document}"
}
