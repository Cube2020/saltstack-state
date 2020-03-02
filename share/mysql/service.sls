include:
  - share.mysql.install
  - share.user.mysql

/etc/my.cnf:
  file.managed:
    - source: salt://source/mysql/my.cnf
    - mode: 644

/etc/init.d/mysqld :
  file.managed:
    - source: salt://source/mysql/mysqld 
    - mode: 755

mysql-service:
  service.running:
    - name: mysql
    - enable: true
    - reload: true
    - require:
      - file: /etc/init.d/mysqld
    - watch:
      - file: /etc/my.cnf
