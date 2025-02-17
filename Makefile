HOMEWORKS=01 02 03

.PHONY: clean all

all: $(foreach I,$(HOMEWORKS),$I.pdf)


%.pdf: %.typ template.typ
	typst compile $< --pdf-standard=a-2b

clean:
	rm *.pdf || echo
