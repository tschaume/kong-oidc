FROM kong:1.5.1-alpine

USER root
ENV LUA_PATH /usr/local/share/lua/5.1/?.lua;/usr/local/kong-oidc/?.lua;;

RUN apk add --no-cache git
RUN luarocks install kong-response-size-limiting
RUN luarocks install kong-log-google

COPY . /usr/local/kong-oidc
RUN luarocks install /usr/local/kong-oidc/kong-oidc-1.1.0-0.rockspec

USER kong
