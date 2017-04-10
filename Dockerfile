FROM node:7.0

# Surpress Upstart errors/warning
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Install software requirements
RUN npm install -g node-gyp

# Install Supervisor
RUN apt-get update && \
apt-get install -y supervisor

# Copy supervisor config
ADD conf/supervisord.conf /etc/supervisord.conf

# copy start script
ADD scripts/start.sh /usr/bin/start.sh

# Expose Ports (example: 80)
EXPOSE 80

# run start script
CMD ["/bin/bash"]