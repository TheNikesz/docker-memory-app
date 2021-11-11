FROM alpine

LABEL author="Blazej Typek"

WORKDIR /usr/src/app

VOLUME [ "/logi" ]

COPY pluto.sh pluto.sh

ENTRYPOINT [ "./pluto.sh" ]
# CMD [ "/bin/sh" ]