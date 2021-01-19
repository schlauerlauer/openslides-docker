# Openslides

[![pipeline status](https://gitlab.com/Maxkolbe/openslides/badges/main/pipeline.svg)](https://gitlab.com/Maxkolbe/openslides/-/commits/main)

This repository helps to install a small Openslides server for your digital elections and conferences.

The image gets updated and rebuilt every week automatically.

> More information on Openslides [here](https://openslides.org)
>
> More information on the installation process [here](https://github.com/OpenSlides/OpenSlides)
> (not for smaller/simpler installations)

## Prerequisites

- A Linux server with ssh access and [Git installed](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- A Domain pointing to your server or subdomain (with a [DNS entry](https://help.dreamhost.com/hc/en-us/articles/215414867-How-do-I-add-custom-DNS-records-))
- Container runtime ([docker](https://docs.docker.com/get-docker/) or [podman](https://podman.io/getting-started/installation))
- [tls certificate files for your subdomain or domain](https://letsencrypt.org/getting-started/) (if you don't have the certificates, you can get them after installing the reverse proxy)

### Optional (recommended) prerequisites

- Add a user account to your server (other than `root`)
- [Disable ssh password login to your server](https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/)

## Openslides installation

### Run the container with podman or docker

```bash
docker run -d --name openslides \
  --user root:root \
  -p 8000:8000 \
  -v $PWD/settings.py:/root/.config/openslides/settings.py:rw \
  -v $PWD/openslides:/root/.local/share/openslides:rw \
  registry.gitlab.com/maxkolbe/openslides:latest \
  openslides
```

## Reverse proxy installation

```bash
docker run -d --name nginx \
        -p 80:80 \
        -p 443:443 \
        -v $PWD/conf.d:/etc/nginx/conf.d:ro \
        -v $PWD/tls/key.pem:/etc/nginx/cert.key:ro \
        -v $PWD/tls/cert.pem:/etc/nginx/cert.crt:ro \
        -v $PWD/ssl.conf:/etc/nginx/ssl.conf:ro \
        -v $PWD/nginx.conf:/etc/nginx/nginx.conf:ro \
        docker.io/library/nginx:stable-alpine
```

> If you don't have the certificates yet, leave the two `-v $PWD/tls/...` lines out.
>
> If you have the certificates remove the `#` from the `#include /etc/nginx/ssl.conf` line inside `conf.d/slides.conf` file!
