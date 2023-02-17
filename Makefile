default: README.md

SVG_FILES = $(wildcard **/*.svg)

README.md: Makefile .README.header.md ${SVG_FILES}
	( \
	cat .README.header.md ; \
	SECTION=""; \
	for FILE in ${SVG_FILES}; \
	do \
		DIR=`dirname $$FILE`; \
		if [[ $$DIR != $$SECTION ]] ; then echo "\n## $$DIR" ; SECTION=$$DIR ; fi ; \
		echo "\n##### \`$$FILE\`"; \
		echo "<img width=\"150\" src=\"https://github.com/binxio/svg-assets/raw/main/$${FILE}\" alt=\"$$FILE\"/>"; \
	done \
	) >README.md
