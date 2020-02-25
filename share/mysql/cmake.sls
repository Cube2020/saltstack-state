cmake-install:
  file.managed:
    - name: /user/local/salt/cmake-2.8.10.2.tar.gz
    - source: salt://share/mysql/cmake-2.8.10.2.tar.gz

  cmd.run:
    - name: cd /user/local/salt && tar -xzvf cmake-2.8.10.2.tar.gz && cd /user/local/salt/cmake-2.8.10.2 && ./configure && make && make install
    - creates: /user/local/salt/cmake-2.8.10.2
