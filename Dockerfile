FROM debian
RUN apt update
RUN apt install curl -y
RUN apt install wget -y
RUN apt install unzip -y
RUN apt install procps -y
RUN apt install nginx -y
COPY ./sleep.sh .
RUN uaddgroup --gid 10008 onegroup &&\
adduser --disabled-password  --no-create-home --uid 10008 --ingroup onegroup oneuser &&\
usermod -aG sudo oneuser &&\
CMD ["bash","./sleep.sh;"]
USER 10008