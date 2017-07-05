IPFSLOCAL="http://localhost:8080/ipfs/"
IPFSGATEWAY="https://ipfs.io/ipfs/"
OUTDIR=public

build:
	@hugo && \
	echo "" && \
	echo "Site built out to ./public dir"

help:
	@echo 'Makefile for a filecoin.io, a hugo built static site.                                                          '
	@echo '                                                                                                          '
	@echo 'Usage:                                                                                                    '
	@echo '   make                                Build the optimised site to ./$(OUTPUTDIR)                         '
	@echo '   make serve                          Preview the production ready site at http://localhost:1313         '
	@echo '   make lint                           Check your CSS is ok                                               '
	@echo '   make js                             Copy the *.js to ./static/js                                       '
	@echo '   make css                            Compile the *.css to ./static/css                                  '
	@echo '   make deploy                         Add the website to your local IPFS node                            '
	@echo '   make publish-to-domain              Update $(DOMAIN) DNS record to the ipfs hash from the last deploy  '
	@echo '   make clean                          remove the generated files                                         '
	@echo '                                                                                                          '

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR) && \
	[ ! -d static/css ] || rm -rf static/css/*.css && \

node_modules:
	$(NPM) i

install: node_modules
	[ -d static/css ] || mkdir -p static/css

lint: install
	$(NPMBIN)/lessc --lint layouts/less/*

css: install
	$(NPMBIN)/lessc --clean-css --autoprefix layouts/less/main.less static/css/main.css

serve: install css
	open http://localhost:1313
	hugo serve

deploy:
	ipfs swarm peers >/dev/null || (echo "ipfs daemon must be online to publish" && exit 1)
	ipfs add -r -q $(OUTPUTDIR) | tail -n1 >versions/current
	cat versions/current >>versions/history
	@export hash=`cat versions/current`; \
		echo ""; \
		echo "published website:"; \
		echo "- $(IPFSLOCAL)$$hash"; \
		echo "- $(IPFSGATEWAY)$$hash"; \
		echo ""; \
		echo "next steps:"; \
		echo "- ipfs pin add -r /ipfs/$$hash"; \
		echo "- make publish-to-domain"; \

publish-to-domain: auth.token versions/current
	DNSIMPLE_TOKEN=$(shell cat auth.token) \
	./dnslink.sh $(DOMAIN) $(shell cat versions/current)

.PHONY: build help install lint css serve deploy publish-to-domain clean
