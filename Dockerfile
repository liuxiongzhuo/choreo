FROM debian
RUN apt update
RUN apt install curl -y
RUN apt install wget -y
RUN apt install unzip -y
RUN apt install procps -y
RUN apt install nginx -y
RUN mkdir /app
COPY sleep.sh /app/sleep.sh
RUN addgroup --gid 10008 onegroup 
RUN adduser --disabled-password  --no-create-home --uid 10008 --ingroup onegroup oneuser 
RUN usermod -aG sudo oneuser 
CMD ["bash","/app/sleep.sh"]