DOMAIN="multiformats.io"
IPFSLOCAL="http://localhost:8080/ipfs/"
IPFSGATEWAY="https://ipfs.io/ipfs/"
OUTPUTDIR=public
NPMBIN=./node_modules/.bin

ifeq ($(DEBUG), true)
	PREPEND=
	APPEND=
else
	PREPEND=@
	APPEND=1>/dev/null
endif

build: install lint css
	$(PREPEND)$(NPMBIN)/hugo && \
	echo "" && \
	echo "Site built out to ./$(OUTPUTDIR) dir"

help:
	@echo 'Makefile for a multiformats.io, a hugo built static site.                                                          '
	@echo '                                                                                                          '
	@echo 'Usage:                                                                                                    '
	@echo '   make                                Build the optimised site to ./$(OUTPUTDIR)                         '
	@echo '   make serve                          Preview the production ready site at http://localhost:1313         '
	@echo '   make lint                           Check your CSS is ok                                               '
	@echo '   make css                            Compile the *.css to ./static/css                                  '
	@echo '   make dev                            Start a hot-reloding dev server on http://localhost:1313           '
	@echo '   make clean                          remove the generated files                                         '
	@echo '                                                                                                          '
	@echo '   DEBUG=true make [command] for increased verbosity                                                      '

clean:
	$(PREPEND)[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR) && \
	[ ! -d static/css ] || rm -rf static/css/*.css

node_modules:
	$(PREPEND)npm i $(APPEND)

install: node_modules
	$(PREPEND)[ -d static/css ] || mkdir -p static/css

lint: install
	$(PREPEND)$(NPMBIN)/lessc --lint layouts/less/*

css: install
	$(PREPEND)$(NPMBIN)/lessc --clean-css --autoprefix layouts/less/main.less static/css/main.css $(APPEND)

serve: install lint css
	$(PREPEND)$(NPMBIN)/hugo server

dev: install css
	$(PREPEND)( \
		$(NPMBIN)/nodemon --watch layouts/css --exec "$(NPMBIN)/lessc --clean-css --autoprefix layouts/less/main.less static/css/main.css" & \
		$(NPMBIN)/hugo server -w \
	)

.PHONY: build help install lint css serve clean
