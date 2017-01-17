default: all

.PHONY: all
all: html epub azw3

.PHONY: clean
clean:
	rm -f abstracts.{epub,html,azw3}

.PHONY: html
html: abstracts.html
abstracts.html: abstracts.org
	pandoc -o $@ $<

.PHONY: epub
epub: abstracts.epub
abstracts.epub: abstracts.html
	ebook-convert $< $@

.PHONY: azw3
azw3: abstracts.azw3
abstracts.azw3: abstracts.html
	ebook-convert $< $@


