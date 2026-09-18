.PHONY: *

build:
	docker build -t pi-agent .

run:
	docker run -it --rm \
		-v "$$PWD:/workspace" \
		-v "$$HOME/.pi:/home/piuser/.pi" \
		-v /var/run/docker.sock:/var/run/docker.sock \
		pi-agent
