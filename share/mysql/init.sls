include:
  - share.mysql.install
  - share.mysql.user.init

#/etc/my.cnf:
#  file.managed:
#    - source: salt://share/mysql/my.cnf
#    - mode: 644

#/etc/init.d/mysqld :
#  file.managed:
#    - source: salt://share/mysql//mysqld 
#    - mode: 755

mysql-service:
  service.running:
    - enable: true
    - reload: true
#    - require:
#      - file: /etc/init.d/mysqld
#    - watch:
#      - file: /etc/my.cnf
