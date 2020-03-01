{%- set defaults = salt['pillar.get']('tomcat') -%}
#1.安装openJdk-1.8.0
jdk-install:
  pkg.installed:
    - name: java-1.8.0-openjdk #rpm包安装不需要添加环境变量
#2.安装tomcat-9。0.31
tomcat-install:
  file.managed:
    - name: /usr/local/src/apache-tomcat-9.0.31.tar.gz
    - source: salt://source/apache-tomcat-9.0.31.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src && tar zxf apache-tomcat-9.0.31.tar.gz && mv apache-tomcat-9.0.31 /usr/local/ && ln -s /usr/local/apache-tomcat-9.0.31 /usr/local/tomcat
    - unless: test -L /usr/local/tomcat && test -d /usr/local/apache-tomcat-9.0.31
    - require:
      - file: /usr/local/src/apache-tomcat-9.0.31.tar.gz
tomcat-config:
  file.managed:
    - name: /usr/local/tomcat/conf/server.xml
    - source: salt://share/tomcat/server.xml.jinja
    - template: jinja
    - context: 
        vars: {{ defaults }}
    - user: root
    - group: root
    - mode: 644
war-install:
  cmd.run:
    - name: cd /usr/local/src && git clone https://github.com/Cube2020/spring-mvc-showcase.git && cd spring-mvc-showcase

