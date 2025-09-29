# Start from Debian Bookworm (or Bullseye)
FROM debian:bookworm

# Install required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# Make sure MariaDB directories exist and are owned by mysql user
RUN mkdir -p /var/lib/mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
    chmod 750 /var/lib/mysql /run/mysqld

# Expose MySQL port
EXPOSE 3306

# Copy your init script (to set root password, create db, etc.)
COPY ./init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

# Default command
ENTRYPOINT ["/usr/local/bin/init.sh"]
