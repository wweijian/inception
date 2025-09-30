FROM    debian:oldstable
RUN     apt update && apt upgrade -y && apt install -y \
        nginx \
        openssl
COPY    conf/default /etc/nginx/sites-available/
RUN     mkdir -p /etc/ssl/certs /etc/ssl/private
RUN     openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/self-sign.key \
        -out /etc/ssl/certs/self-sign.cert \
        -subj "/CN=wjhoe.42.fr"
EXPOSE  443
CMD     ["nginx", "-g", "daemon off;"]

# docker run -it debian:oldstable bash
# cat /etc/debian_version
# cat /etc/os-releae
