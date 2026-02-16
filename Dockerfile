FROM zeabur/caddy-static  
LABEL "language"="static"  
COPY index.html /usr/share/caddy/  
# 配置 Caddy 快取策略  
RUN cat > /etc/caddy/Caddyfile <<'EOF'  
:8080 {  
  # 禁止 index.html 被快取 - 每次都重新下載  
  @html {  
    path /index.html  
  }  
  header @html Cache-Control "no-cache, no-store, must-revalidate"  
  header @html Pragma "no-cache"  
  header @html Expires "0"  
  # 其他靜態資源可以長期快取  
  @static {  
    path /assets/*  
    path *.js  
    path *.css  
    path *.woff*  
    path *.ttf  
    path *.eot  
    path *.svg  
    path *.png  
    path *.jpg  
    path *.jpeg  
    path *.gif  
    path *.webp  
    path *.ico  
  }  
  header @static Cache-Control "public, max-age=31536000, immutable"  
  # 根路徑重定向到 index.html（SPA 路由）  
  try_files {path} /index.html  
  file_server  
}  
EOF  
EXPOSE 8080  
