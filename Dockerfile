FROM node:8-stretch as node

RUN npm install -g \
    azure-functions-core-tools@core --unsafe-perm true

FROM microsoft/dotnet:sdk

COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /root/.azurefunctions /root/.azurefunctions

EXPOSE 7071
