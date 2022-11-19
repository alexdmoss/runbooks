FROM mosstech/nginx-with-prometheus:1.1
COPY config/default.conf config/redirects.include /etc/nginx/conf.d/
COPY www/ /app/
