From ubuntu:trusty
MAINTAINER hackcave

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive
# Update
RUN apt-get update

# Start editing
# Install package here for cache
RUN apt-get -y install supervisor postfix postfix-pcre sasl2-bin opendkim opendkim-tools

# Add files
ADD scripts/entrypoint.sh /opt/entrypoint.sh

# Run
CMD /opt/entrypoint.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
