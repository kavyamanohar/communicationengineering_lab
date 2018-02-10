default: pdf
all: clean pdf html

pdf: clean celab.pdf

html:
	latex2html -html_version 4.0,latin1,unicode celab.tex

%.pdf: celab.tex
	xelatex $<
	xelatex $<	# to include generated ToC

clean:
	rm -f celab.pdf celab.aux celab.toc celab.log
