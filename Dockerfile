FROM tomcat
MAINTAINER emily.s.dollete@accenture.com

RUN rm -rf D:/homesite/wwwroot/webapps/ROOT
ONBUILD COPY target/calculator-1.0.war D:/homesite/wwwroot/webapps/ROOT.war
