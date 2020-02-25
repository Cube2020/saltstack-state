cmake-install:
  file.managed:
    - name: /mnt/cmake-2.8.10.2.tar.gz
    - source: salt://share/mysql/cmake-2.8.10.2.tar.gz

  cmd.run:
    - name: cd /mnt && tar -xzvf cmake-2.8.10.2.tar.gz && cd /mnt/cmake-2.8.10.2 && ./configure && make && make install
    - creates: /mnt/cmake-2.8.10.2
