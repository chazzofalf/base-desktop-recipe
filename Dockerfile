FROM chazzofalf/with-user-docker-recipe
ENV DEBIAN_FRONTEND="noninteractive"
ENV DEBIAN_FRONTEND=""
RUN apt-get install -yq ssh xrdp icewm
RUN mkdir /etc/docker-user-setup.d/.ssh
COPY secure_authorized_keys.sh /etc/docker-user-setup-scripts.d
COPY setup_ssh.sh /etc/docker-prelogin-foreground.d
COPY start_x_services.sh /etc/docker-prelogin-foreground.d
RUN chmod +x /etc/docker-user-setup-scripts.d/secure_authorized_keys.sh
RUN chmod +x /etc/docker-prelogin-foreground.d/setup_ssh.sh
RUN chmod +x /etc/docker-prelogin-foreground.d/start_x_services.sh
