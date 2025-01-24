FROM debian

WORKDIR /home/choreouser

EXPOSE 3000

COPY files/* /home/choreouser/
RUN curl -o- https://fnm.vercel.app/install | bash
RUN fnm install 22
RUN apt-get update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x index.js swith web server &&\
    npm install

CMD [ "node", "index.js" ]

USER 10008
