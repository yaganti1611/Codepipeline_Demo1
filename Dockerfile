FROM public.ecr.aws/p7z7y4b7/alpine:latest
FROM public.ecr.aws/p7z7y4b7/openjdk:latest

# Checking Java version
RUN java -version

# Fetching jetty distribution package
RUN wget -q -O /jetty.tar.gz "https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/10.0.0.beta0/jetty-distribution-10.0.0.beta0.tar.gz"

# Installing Jetty
RUN tar -xvf /jetty.tar.gz && rm /jetty.tar.gz && mv jetty-distribution-10.0.0.beta0 /opt/jetty

# Redirecting to Working Directory
WORKDIR /opt/jetty

# Copying War file to desired Jetty destination
COPY webapp.war /opt/jetty/webapp/

# Executing Jetty
CMD ["/opt/jetty/bin/jetty.sh", "run"]

# Exposing Port
EXPOSE 8080
