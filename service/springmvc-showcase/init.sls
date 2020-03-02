war-install:
  cmd.run:
    - name: cd /usr/local/src && git clone https://github.com/Cube2020/spring-mvc-showcase.git && cd spring-mvc-showcase && mvn clean package
    - require: 
      - pkg: maven
      - file: /usr/local/tomcat
