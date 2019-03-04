# Deploy any Docker on the ADX Platform!

In order to allow tenant developers with the freedom required to develop great tools, you are able to deploy **any** Docker image on the 
ADX platform. In the tutorial below, we will show a custom-made docker (being stored on DockerHub) running on the ADX Platform.


![Dockerhub](/static/dockerhub.png?raw=true)

## Creating the Dockerfile

#### Dockerfile
```dockerfile
FROM alpine
MAINTAINER Brandon Gulla <gulla_brandon@bah.com>

USER root

RUN   apk update && \
      apk upgrade && \
      apk add python

COPY ./src/hello_world.py /src/hello_world.py

RUN chmod -R 777 /src

# Drop down to general unpriveleged user. Must use UID. 1001 is setup earlier.
USER 1001

WORKDIR /src

ENTRYPOINT ["container-entrypoint"]

CMD ["python", "/usr/bin/hello_world.py"]
```

## Building the Dockerfile
```bash
docker build -t bgulla/any-docker-on-adx .
```

## Pushing the Docker image binary to DockerHub (public docker registry)
```bash
b@bah[~/projects/adx-anydocker] > docker push bgulla/any-docker-on-adx

b@bah[~/projects/adx-anydocker] > docker push bgulla/any-docker-on-adx
The push refers to repository [docker.io/bgulla/any-docker-on-adx]
f154e7defe4a: Layer already exists
5dde58e1d5f0: Layer already exists
29df65d5ddaf: Layer already exists
503e53e365f3: Layer already exists
latest: digest: sha256:68e619843f36f93661bfe202d77061e6e6e93b4a953150a25a7a35d8a9576c33 size: 1154

```

Now the Docker image resides in the public Docker registry, let's get it deploy on ADX.

## Deploying our new Docker on ADX

![Deploying the container on ADX](/static/deploy.png?raw=true)

## Successful Deployment on ADX

![Pod Running](/static/running.png?raw=true)

## Proof of Docker running on the platform

![Logs](/static/logs.png?raw=true)

