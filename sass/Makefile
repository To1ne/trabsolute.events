
HAML := haml -r ./ruby/helpers.rb
SASS := sass

all: dirs _site/index.html _site/css/main.css

dirs:
	mkdir -p _site/ _site/css/

clean:
	rm -rf _site

_site/%.html: %.haml
	$(HAML) $< $@

_site/css/%.css: %.scss
	$(SASS) $< $@

.PHONY: all dirs clean

vpath %.haml haml
vpath %.scss sass

#-include .deps/main.scss.deps

