# Alpine 3.x Sandbox Dockerfile
# This image is used to build PHP packages.

# IMAGE ARGUMENT
ARG ALPINE_VERSION

# ALPINE 3.x.
FROM alpine:$ALPINE_VERSION

# MAINTAINER.
MAINTAINER limingxinleo <l@hyperf.io>

# AFTER IMAGE DEFINITION ARGUMENTS
ARG ALPINE_VERSION
ARG APK_PACKAGER
ARG APK_MAINTAINER

# ADD SDK AND BASIC TOOLS.
RUN apk add --update alpine-sdk sudo git bash nano vim

# CONFIGURE ALPINE REPOSITORIES AND PHP BUILD DIR.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories

# ADD THE START SCRIPT.
ADD start.sh /bin/start.sh
ADD bashrc /home/sandbox/.bashrc

# CONFIGURE BUILD.
RUN adduser -D -u 1000 sandbox && \
    addgroup sandbox abuild && \
    echo "sandbox  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i "/#PACKAGER=.*/c\PACKAGER=\"${APK_PACKAGER}\"" /etc/abuild.conf && \
    sed -i "/#MAINTAINER=.*/c\MAINTAINER=\"${APK_MAINTAINER}\"" /etc/abuild.conf && \
    chown -R sandbox:sandbox /home/sandbox

# generate build env vars.
RUN echo "ALPINE_VERSION=${ALPINE_VERSION}" >> /home/sandbox/.build_env && \
    echo "APK_PACKAGER=${APK_PACKAGER}" >> /home/sandbox/.build_env && \
    echo "APK_MAINTAINER=${APK_MAINTAINER}" >> /home/sandbox/.build_env

# REMOVE TEMP FILES.
RUN mkdir -p /var/cache/apk && \
    ln -s /var/cache/apk /etc/apk/cache

# START ON SANDBOX USER.
USER sandbox

# CONFIGURE ENTRYPOINT.
ENTRYPOINT ["/bin/start.sh"]

# START ON SANDBOX USER HOME.
WORKDIR "/home/sandbox"

# START WITH BASH.
CMD ["/bin/bash"]