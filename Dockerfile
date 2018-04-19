FROM node:9-stretch

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg

RUN apt-get update && apt-get install -qy apt-transport-https libunwind8 gettext
ADD dotnetdev.list /etc/apt/sources.list.d/

RUN apt-get update && \
    apt-get install -qy dotnet-runtime-2.0.6 &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g \
    azure-functions-core-tools@core --unsafe-perm true

EXPOSE 7071
