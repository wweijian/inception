FROM    debian:oldstable
RUN     apt update && apt upgrade -y && apt install -y nginx
COPY    conf/default /etc/nginx/sites-available/
CMD     ["nginx", "-g", "daemon off;"]

# docker run -it debian:oldstable bash
# cat /etc/debian_version
# cat /etc/os-release