FROM mysql:5.6

ADD my.cnf /etc/mysql/my.cnf

# Write Permission
RUN usermod -u 1000 mysql && chown mysql.mysql /var/run/mysqld/

EXPOSE 3306
VOLUME ["/data"]
