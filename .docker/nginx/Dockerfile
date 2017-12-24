# DOCS https://hub.docker.com/_/nginx/
FROM nginx

# environment files
ENV NGINX_HOSTNAME=monitoring.dev
ENV NGINX_PORT=80
ENV NGINX_STATIC_FILES=/www/static
# NGINX_PROXY_PASS_HOST should be the web service name in docker-compose.yml
ENV NGINX_PROXY_PASS_HOST=web


# copying nginx proxy template to the conf.d file
COPY conf/django.conf.template /etc/nginx/conf.d/django.conf.template

# removing default conf file
RUN rm -rf /etc/nginx/conf.d/default.conf

# creating a new default conf file from template and environment variables
RUN envsubst "`printf '${%s} ' $(bash -c "compgen -A variable")`" < /etc/nginx/conf.d/django.conf.template > /etc/nginx/conf.d/default.conf

# DEBUG
# RUN nginx -g 'daemon off;'
# RUN ls /etc/nginx/conf.d/
# RUN cat /etc/nginx/conf.d/default.conf
