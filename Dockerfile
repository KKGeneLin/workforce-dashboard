FROM zeabur/caddy-static  
LABEL "language"="static"  
COPY index.html /usr/share/caddy/  
EXPOSE 8080  
