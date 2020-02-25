include:
  - share.mysql.dependency
  - share.mysql.cmake
mysql-install:
  file.managed:
   - name: /user/local/salt/mysql-boost-5.7.19.tar.gz
   - source: salt://source/mysql/mysql-boost-5.7.19.tar.gz

  cmd.run:
   - name: cd /user/local/salt && tar zxf mysql-boost-5.7.19.tar.gz && cd mysql-5.7.19 && /usr/local/bin/cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/usr/local/mysql/data -DWITH_BOOST=./boost/boost_1_59_0 -DSYSCONFDIR=/etc -DENABLED_LOCAL_INFILE=1 -DEXTRA_CHARSETS=all -DEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci && make && make install && cd /usr/local/mysql && mkdir data && chown -R mysql:mysql .
   - creates: /usr/local/mysql
