.PHONY: *

build:
	docker build -t pi-agent .

run:
	docker run -it --privileged -v "$$PWD:/workspace" -v "$$HOME/.pi:/root/.pi" pi-agent
