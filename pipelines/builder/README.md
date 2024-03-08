## Build the image locally

```shell
podman build -t devhub-bootstrap/gitops-cli .
```

Run the image with an interactive shell:

```shell
podman run --name gitops --rm -i -t devhub-bootstrap/gitops-cli bash
```
