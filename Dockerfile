FROM al3xos/nginx-with-prometheus:1.8
COPY config/default.conf /etc/nginx/conf.d/
COPY app/www/ /app/
