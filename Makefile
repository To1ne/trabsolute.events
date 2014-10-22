HTDOCS := _site/htdocs

HAML := haml -r ./ruby/helpers.rb --no-escape-attrs
SASS := sass -E utf-8
CP := cp

sass_dep := $(shell find sass -name *.scss)
img := $(patsubst assets/%,$(HTDOCS)/img/%,$(wildcard assets/*.jpg))

all: dirs $(HTDOCS)/index.html $(HTDOCS)/css/main.min.css $(img)

dirs:
	mkdir -p $(HTDOCS)/ $(HTDOCS)/css/ $(HTDOCS)/img

clean:
	rm -rf $(HTDOCS)/*

$(HTDOCS)/%.html: %.haml
	$(HAML) $< $@

$(HTDOCS)/css/%.min.css: %.scss $(sass_dep)
	$(SASS) --style compressed $< $@
	$(SASS) $< $(patsubst %.min.css,%.css,$@)

$(HTDOCS)/img/%: assets/%
	$(CP) -a $^ $@

.PHONY: all dirs clean

vpath %.haml haml
vpath %.scss sass
