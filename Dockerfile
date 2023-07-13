FROM alpine:latest
RUN apk update \
    && apk add nginx
RUN mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf.bkp
COPY index.html /var/www/
COPY my_srv.conf /etc/nginx/http.d/
RUN chown -hR nginx:www-data /var/www/*
EXPOSE 80
ENTRYPOINT nginx -g 'daemon off;'

