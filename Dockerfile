FROM debian
RUN apt update
RUN apt install curl -y
RUN apt install wget -y
RUN apt install unzip -y
RUN apt install procps -y
RUN apt install nginx -y
COPY ./sleep.sh .
CMD ["bash","./sleep.sh;"]