export SHELL := /bin/bash
export PATH  := $(shell npm bin):$(PATH)

all: index.js

index.js: index.js.template fetch/fetch.js
	node -e "fs = require('fs') ; fs.writeFileSync('$@', fs.readFileSync('$<', 'utf8').replace('{{{ body }}}', fs.readFileSync('fetch/fetch.js')))"