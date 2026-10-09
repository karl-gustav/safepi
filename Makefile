.PHONY: *

build:
	docker build -t safepi .

run:
	./safepi
install:
	ln -s $$PWD/safepi ~/bin/
