
HAML := haml -r ./ruby/helpers.rb
SASS := sass -E utf-8

sass_dep := $(shell find sass -name *.scss)

all: dirs _site/index.html _site/css/main.min.css

dirs:
	mkdir -p _site/ _site/css/

clean:
	rm -rf _site

_site/%.html: %.haml
	$(HAML) $< $@

_site/css/%.min.css: %.scss $(sass_dep)
	$(SASS) --style compressed $< $@
	$(SASS) $< $(patsubst %.min.css,%.css,$@)

.PHONY: all dirs clean

vpath %.haml haml
vpath %.scss sass
