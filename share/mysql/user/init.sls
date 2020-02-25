mysql:
  group.present:
    - gid: 27
  user.present:
    - uid: 27
    - gid: 27
    - shell: /sbin/nologin
    - home: /usr/local/haproxy
    - createhome: false
