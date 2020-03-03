rpn-install:
  cmd.run:
    - name: cd /srv/salt && wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm && rpm -ivh mysql-community-release-el7-5.noarch.rpm
mysql-install:
  pkg.installed:
    - name: mysql-server
mysql-chown:
  cmd.run:
    - name: chown mysql:mysql -R /var/lib/mysql && mysqld --initialize
mysql-start:
  service.running:
    - name: mysqld
    - enabled: true
    - reload: true
    
