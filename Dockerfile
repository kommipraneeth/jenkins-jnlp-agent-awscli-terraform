FROM subodhhatkar/jenkins-jnlp-agent-openjdk:11.0.7-jre-slim-buster

ARG APP=terraform
ARG VERSION=0.12.29
ARG ARCH=linux_amd64
RUN curl --insecure -L https://releases.hashicorp.com/${APP}/${VERSION}/${APP}_${VERSION}_${ARCH}.zip \
    -o ${APP}.zip && \
    unzip ${APP}.zip && \
    mv ${APP} /usr/local/bin/${APP} && \
    rm -rf ${APP}.zip