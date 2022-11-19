FROM mosstech/nginx-with-prometheus:1.1
COPY config/default.conf /etc/nginx/conf.d/
COPY app/www/ /app/
