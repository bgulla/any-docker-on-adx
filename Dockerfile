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

CMD ["python", "/usr/bin/helloworld.py"]

