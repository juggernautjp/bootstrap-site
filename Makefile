SHELL=/usr/bin/bash
HUGO_BIN=hugo
BOOTSTRAP_SITE=../../GoHugo.repo/bootstrap/site
COPY_DIRS=assets content data layouts static

.PHONY: build demo

build: clean
	$(HUGO_BIN) --cleanDestinationDir

demo:
	$(HUGO_BIN) server --disableFastRender --port 9013
# -D --bind 0.0.0.0  --ignoreCache

release: build
	cp -rf ./exampleSite/resources ./resources

update:
	$(HUGO_BIN) mod get -u github.com/juggernautjp/hugo-widebs5-dependencies@main

verify:
	$(HUGO_BIN) mod verify
	$(HUGO_BIN) mod graph

vendor:
	rm -rf _vendor
	$(HUGO_BIN) mod vendor

clean:
	rm -rf public
	rm -rf _vendor

cleansite:
	rm -rf $(COPY_DIRS)

copysite: cleansite
	cp -r $(BOOTSTRAP_SITE)/assets ./
	cp -r $(BOOTSTRAP_SITE)/content ./
	cp -r $(BOOTSTRAP_SITE)/layouts ./
	cp -r $(BOOTSTRAP_SITE)/static ./
	cp -r $(BOOTSTRAP_SITE)/data ./
