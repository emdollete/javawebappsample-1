FROM tomcat
MAINTAINER emily.s.dollete@accenture.com

RUN rm -rf D:/home/site/wwwroot/webapps/ROOT
ONBUILD COPY target/calculator-1.0.war D:/home/site/wwwroot/webapps/ROOT.war
