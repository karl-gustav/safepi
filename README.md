# Usage

Build the agent image:

```sh
make build
```

Run the agent with access to your host Docker daemon:

```sh
make run
```

Resume a pi session by passing `--session <sessionid>` before any folders:

```sh
./safepi --session SESSION_ID /path/to/project
```

Equivalent command:

```sh
docker run -it --rm \
  -v "$PWD:/workspace" \
  -v "$HOME/.pi:/home/piuser/.pi" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  pi-agent
```

Warning: mounting `/var/run/docker.sock` gives the container powerful control over host Docker. Only use this with trusted code/workspaces.
