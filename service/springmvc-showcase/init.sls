war-package:
  cmd.run:
    - name: cd /usr/local/src && git clone https://github.com/Cube2020/spring-mvc-showcase.git && cd spring-mvc-showcase && mvn clean package
    - require: 
      - pkg: maven
war-install:
  cmd.run:
    - name: cd /usr/local/tomcat/webapps/ && rm -rf * && cd /usr/local/src/spring-mvc-showcase/target && cp spring-mvc-showcase.war /usr/local/tomcat/webapps/
    - require:
      - file: /usr/local/src/spring-mvc-showcase/target/spring-mvc-showcase.war
tomcat-start:
  cmd.run:
    - name: cd /usr/local/tomcat/bin && ./startup.sh
