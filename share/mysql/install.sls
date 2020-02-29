include:
  - share.mysql.dependency
  - share.mysql.cmake
mysql-install:
  file.managed:
   - name: /mnt/mysql-boost-5.7.19.tar.gz
   - source: salt://source/mysql/mysql-boost-5.7.19.tar.gz
  cmd.run:
#  - name: cd /mnt && tar zxf mysql-boost-5.7.19.tar.gz && cd mysql-5.7.19 && /usr/local/bin/cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/usr/local/mysql/data -DWITH_BOOST=./boost/boost_1_59_0 -DSYSCONFDIR=/etc -DENABLED_LOCAL_INFILE=1 -DEXTRA_CHARSETS=all -DEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci && make && make install && cd /usr/local/mysql && mkdir data && chown -R mysql:mysql .
   - name: cd /mnt && tar zxf mysql-boost-5.7.19.tar.gz && cd mysql-5.7.19 && /usr/local/bin/cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
                                                                                                        -DMYSQL_DATADIR=/usr/local/mysql/data \
                                                                                                        -DSYSCONFDIR=/etc \
                                                                                                        -DWITH_MYISAM_STORAGE_ENGINE=1 \
                                                                                                        -DWITH_INNOBASE_STORAGE_ENGINE=1 \
                                                                                                        -DWITH_MEMORY_STORAGE_ENGINE=1 \
                                                                                                        -DWITH_READLINE=1 \
                                                                                                        -DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock \
                                                                                                        -DMYSQL_TCP_PORT=3306 \
                                                                                                        -DENABLED_LOCAL_INFILE=1 \
                                                                                                        -DWITH_PARTITION_STORAGE_ENGINE=1 \
                                                                                                        -DEXTRA_CHARSETS=all \
                                                                                                        -DDEFAULT_CHARSET=utf8 \
                                                                                                        -DDEFAULT_COLLATION=utf8_general_ci && make && make install && cd /usr/local/mysql && mkdir data && chown -R mysql:mysql .
   - creates: /usr/local/mysql
