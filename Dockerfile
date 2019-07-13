FROM python:3

# Install gosu
RUN apt-get update && \
    apt-get install -y gosu \
    # Install VNC
    x11vnc xvfb

# Setup VNC
ENV DISPLAY :20
EXPOSE 5920

# Add user app
RUN groupadd --gid "911" -r app \
    && useradd -u "911" -r -g app -d /usr/src/app -c "Docker Image User" app \
    && mkdir /usr/src/app

# Adding entrypoint.
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN ln -s usr/local/bin/docker-entrypoint.sh

# Registering entrypoint.
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Making directory for app
RUN mkdir /app
WORKDIR /app

# Copying all of the code to directory.
COPY ./src /app

# Adding execution permission to run script.
RUN chmod +x /app/run.sh

# And run it.
CMD [ "/app/run.sh" ]
