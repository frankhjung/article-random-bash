#!/usr/bin/make

.SUFFIXES:
.SUFFIXES: .Rmd .html .pdf

PROJECT:= random-bash

R	= /usr/bin/R

default: $(PROJECT).html $(PROJECT).pdf

.Rmd.html:
	@mkdir -p public
	@$(R) --quiet --slave --vanilla --file=make.R --args $< $@
	@mv $@ public/index.html

.Rmd.pdf:
	@mkdir -p public
	@$(R) --quiet --slave --vanilla --file=make.R --args $< $@
	@mv $@ public/

.PHONY: clean
clean:
	@$(RM) *.random test.* temp.random.* *.zip
	@$(RM) -rf cache figure public/*.html public/*.pdf
