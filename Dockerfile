FROM lsiobase/alpine:3.9
LABEL maintainer="Riccardo Casazza <riccardo.casazza@gmail.com>"

# environment variables
ENV CONFIG_DIR=/config

#install
RUN echo "**** install runtime packages ****"
RUN apk add --no-cache \
	ca-certificates \
    privoxy

# add local files
COPY root /

#ports
EXPOSE 8118
VOLUME [ "/config" ]

