#!/bin/bash

scriptsDir=/opt/scripts
binDir=/usr/local/bin
input=${scriptsDir}/providers/providers.txt
providersArch=linux_amd64
while IFS= read -r line
do
  providersId=${line%%:*}
  version=${line##$providersId:}
  wget https://releases.hashicorp.com/${providersId}/${version}/${providersId}_${version}_${providersArch}.zip \
    -O ${providersId}.zip && \
    unzip ${providersId}.zip && \
    rm -rf ${providersId}.zip && \
    mv ${providersId}* ${binDir}
done < ${input}