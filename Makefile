.PHONY: *

build:
	docker build -t pi-agent .

run:
	./safepi
install:
	ln -s $$PWD/safepi ~/bin/
