FROM subodhhatkar/jenkins-jnlp-agent-openjdk:11.0.8-jre-slim-buster

ARG AWSCLI_APP=awscli
ARG AWSCLI_VERSION=2.0.41
ARG AWSCLI_ARCH=linux-x86_64
RUN wget https://awscli.amazonaws.com/${AWSCLI_APP}-exe-${AWSCLI_ARCH}.zip \
    -O ${AWSCLI_APP}-${AWSCLI_VERSION}.zip && \
    unzip ${AWSCLI_APP}-${AWSCLI_VERSION}.zip && \
    ./aws/install && \
    rm -rf ./aws ${AWSCLI_APP}-${AWSCLI_VERSION}.zip

ARG IAM_AUTH_APP=aws-iam-authenticator
ARG IAM_AUTH_VERSION=v0.5.0
ARG IAM_AUTH_ARCH=linux/amd64
RUN wget https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/${IAM_AUTH_ARCH}/${IAM_AUTH_APP} \
    -O ${IAM_AUTH_APP} && \
    chmod +x ${IAM_AUTH_APP} && \
    mv ${IAM_AUTH_APP} /usr/local/bin/${IAM_AUTH_APP}

COPY ./scripts /opt/scripts
RUN /opt/scripts/installProviders.sh