SHELL=/usr/bin/bash
HUGO_BIN=hugo


.PHONY: build demo

build:
	$(HUGO_BIN) --cleanDestinationDir

demo:
	$(HUGO_BIN) server --disableFastRender --port 9001
# -D --bind 0.0.0.0  --ignoreCache

release: build
	cp -r ./exampleSite/resources ./resources

update:
	$(HUGO_BIN) mod get github.com/juggernautjp/hugo-widebs5-dependencies@main

verify:
	$(HUGO_BIN) mod verify
	$(HUGO_BIN) mod graph

vendor:
	rm -rf _vendor
	$(HUGO_BIN) mod vendor


clean:
	rm -rf ./public

