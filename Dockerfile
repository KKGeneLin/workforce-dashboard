Dockerfile
FROM zeabur/caddy-static
LABEL "language"="static"

COPY index.html /usr/share/caddy/
COPY Caddyfile /etc/caddy/

EXPOSE 8080
