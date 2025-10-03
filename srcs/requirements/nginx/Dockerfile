FROM debian:bookworm

# -- install packages
RUN  apt update -y && apt upgrade -y && \
     apt install -y nginx openssl

# -- generate SSL certificate
#      x509 certificate, -nodes means no password required
#      valid for a year, subj: certificate details
RUN  mkdir -p /etc/nginx/ssl && \
     openssl req -x509 -nodes \
     -days 365 \
     -keyout /etc/nginx/ssl/self-sign.key \
     -out /etc/nginx/ssl/self-sign.crt \
	 -subj "/CN=wjhoe.42.fr"
    #  -subj "/CN=${DOMAIN_NAME}"

# -- NGINX directories
RUN mkdir -p /var/www/wordpress /var/run/nginx && \
    chmod 755 /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress

# -- copy config 
COPY conf/nginx.conf /etc/nginx/nginx/nginx.conf

# -- "daemon off" ensures the container stays alive
CMD ["nginx", "-g", "daemon off;"]