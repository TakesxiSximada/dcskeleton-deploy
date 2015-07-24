# -*- coding: utf-8 -*-

.PHONY: all clean build rebuild

all: env bin/buildout build
	echo "buildout finished..."

clean:
	rm -rf bin parts eggs develop-eggs .installed env bootstrap.py

build: bin/buildout
	bin/buildout -c buildout.cfg

rebuild: clean build
	echo

bin/buildout: env
	mkdir -p var
	curl https://raw.githubusercontent.com/buildout/buildout/master/bootstrap/bootstrap.py > var/bootstrap.py
	env/bin/python var/bootstrap.py

env:
	virtualenv env
