# Openslides

[![pipeline status](https://gitlab.com/Maxkolbe/openslides/badges/main/pipeline.svg)](https://gitlab.com/Maxkolbe/openslides/-/commits/main)

## Run Container

```bash
podman run -d --name openslides \
  --userns=keep-id \
  --user 1000:1000 \
  -p 8000:8000 \
  -v $PWD/settings.py:/root/.config/openslides/settings.py:rw \
  -v $PWD/data:/root/.local/share/openslides:rw \
  registry.gitlab.com/maxkolbe/openslides:latest \
  openslides
```
