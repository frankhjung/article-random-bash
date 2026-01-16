#!/usr/bin/make

.PHONY: clean cleanall default
.SUFFIXES:
.SUFFIXES: .Rmd .html .pdf

R	= /usr/bin/R

default: public/random.html public/random.pdf

public/%.html: %.Rmd
	@mkdir -p public
	@$(R) --quiet --slave --vanilla --file=make.R --args $< $@
	@mv $@ public/index.html

public/%.pdf:	%.Rmd
	@mkdir -p public
	@$(R) --quiet --slave --vanilla --file=make.R --args $< $@

clean:
	@$(RM) *.random test.* temp.random.* *.zip

cleanall: clean
	@$(RM) -rf cache figure public/*.html public/*.pdf
