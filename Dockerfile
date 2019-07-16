FROM tomcat
MAINTAINER emily.s.dollete@accenture.com

RUN rm -rf $CATALINA_HOME/webapps/ROOT
ONBUILD COPY target/calculator-1.0.war $CATALINA_HOME/webapps/ROOT.war
