FROM jboss/wildfly

# Replace app.war with the name of your war file. Deployed app is available on port 8080
ADD app.war /opt/jboss/wildfly/standalone/deployments/

# Add management user. Management console is on localhost:9990
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
