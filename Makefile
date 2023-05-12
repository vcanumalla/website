PAGES = \
	index.html \
	graduated-students.html \
	pubs.html

%.html: %.dj REFLINKS HEADER.html FOOTER.html
	$(eval PAGE := $(shell basename $< .dj))
	@echo
	@echo "BUILD $(PAGE)"
	cat HEADER.html | sed 's/__PAGE__/$(PAGE)/' > $@
	cat $< REFLINKS | djot >> $@
	cat FOOTER.html >> $@

.PHONY: all
all: $(PAGES)

.PHONY: clean
clean:
	rm -f $(PAGES)
