srcs = preamble.md $(wildcard loesung??.md)
clean = \
	Übungen.aux \
	Übungen.fdb_latexmk \
	Übungen.fls \
	Übungen.html \
	Übungen.log \
	Übungen.pdf \
	Übungen.tex \
	Übungen.xdv

.PHONY: all clean

all: Übungen.html Übungen.pdf

clean:
	$(RM) $(clean)

Übungen.html: $(srcs) GNUmakefile
	pandoc -so $@ --toc --mathml -f markdown+gfm_auto_identifiers $(srcs)

Übungen.pdf: Übungen.tex
	latexmk -g -xelatex -output-directory=$(@D) Übungen.tex < /dev/null

Übungen.tex: $(srcs) GNUmakefile
	pandoc -so $@ -H header-tex.txt -f markdown+gfm_auto_identifiers $(srcs)
