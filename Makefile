
HAML := haml -r ./ruby/helpers.rb
SASS := sass

htmls:=$(patsubst haml/%.haml,_site/%.html,$(wildcard haml/*.haml))
csss:=$(patsubst sass/%.scss,_site/css/%.css,$(wildcard sass/*.scss))

all: dirs $(htmls) $(csss)

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

