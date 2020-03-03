rpn-install:
  cmd.run:
    - name: cd /srv/salt && wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm && rpm -ivh mysql-community-release-el7-5.noarch.rpm
mysql-install:
  pkg.installed:
    - name: mysql-server
mysql-chown:
  cmd.run:
    - name: chown root:root -R /var/lib/mysql && mysqld --initialize --user=root
mysql-start:
  service.running:
    - name: mysqld
    - enable: true
    - reload: true
    
