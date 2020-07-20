FROM subodhhatkar/jenkins-jnlp-agent-openjdk:11.0.7-jre-slim-buster

ARG APP=terraform
ARG VERSION=0.12.28
RUN curl --insecure -L https://releases.hashicorp.com/${APP}/${VERSION}/${APP}_${VERSION}_linux_amd64.zip -o /usr/local/bin/${APP}.zip \
    && unzip /usr/local/bin/${APP}.zip -d /usr/local/bin \
    && rm -rf /usr/local/bin/${APP}.zip