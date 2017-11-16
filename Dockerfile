FROM node:stretch

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg

RUN apt-get update && apt-get install -qy apt-transport-https
ADD dotnetdev.list /etc/apt/sources.list.d/

RUN apt-get update && \
    apt-get install -qy gnupg curl libunwind8 \
                        gettext dotnet-sdk-2.0.2

RUN npm install -g \
    azure-functions-core-tools@core --unsafe-perm true
