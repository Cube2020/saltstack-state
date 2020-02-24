{%- set defaults = salt['pillar.get']('nginx') -%}
nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
  file.managed:
    -name: /etc/nginx/nginx.conf:
    - source: salt://share/nginx/nginx.conf.jinja
    - template: jinja
    - context: 
        vars: {{ defaults }}
    - user: root
    - group: root
    - mode: 644
