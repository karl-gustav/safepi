.PHONY: *

build:
	docker build  --no-cache -t safepi .

run:
	./safepi
install:
	ln -s $$PWD/safepi ~/bin/
