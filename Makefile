default: all

.PHONY: all
all: html epub azw3

.PHONY: clean
clean:
	rm -f abstracts.{epub,html,azw3}

.PHONY: html
html: abstracts.html
abstracts.html: abstracts.org
	pandoc -s -o $@ $<

.PHONY: epub
epub: abstracts.epub
abstracts.epub: abstracts.html
	ebook-convert $< $@ --level1-toc //h:h1 --level2-toc //h:h2

.PHONY: azw3
azw3: abstracts.azw3
abstracts.azw3: abstracts.epub
	ebook-convert $< $@


