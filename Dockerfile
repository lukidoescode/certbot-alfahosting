FROM ubuntu:jammy

RUN mkdir /etc/letsencrypt
RUN mkdir /etc/certbot-alfahosting

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm ./google-chrome-stable_current_amd64.deb

COPY target/x86_64-unknown-linux-gnu/release/certbot-alfahosting /usr/bin/certbot-alfahosting

VOLUME [ "/etc/letsencrypt", "/etc/certbot-alfahosting" ]

CMD [ "/usr/bin/certbot-alfahosting" ]
