FROM kong:1.5.1-alpine

USER root
ENV LUA_PATH /usr/local/share/lua/5.1/?.lua;/usr/local/kong-oidc/?.lua;;

RUN apk add --no-cache git
RUN luarocks install kong-response-size-limiting
RUN luarocks install kong-log-google

COPY . /kong-oidc
RUN cd /kong-oidc && luarocks make

USER kong
