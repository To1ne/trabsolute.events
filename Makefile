
HAML := haml -r ./ruby/helpers.rb --no-escape-attrs
SASS := sass -E utf-8
CP := cp

sass_dep := $(shell find sass -name *.scss)
img := $(patsubst assets/%,_site/img/%,$(wildcard assets/*.jpg))

all: dirs _site/index.html _site/css/main.min.css $(img)

dirs:
	mkdir -p _site/ _site/css/ _site/img

clean:
	rm -rf _site/*

_site/%.html: %.haml
	$(HAML) $< $@

_site/css/%.min.css: %.scss $(sass_dep)
	$(SASS) --style compressed $< $@
	$(SASS) $< $(patsubst %.min.css,%.css,$@)

_site/img/%: assets/%
	$(CP) -a $^ $@

.PHONY: all dirs clean

vpath %.haml haml
vpath %.scss sass
