FROM debian
RUN apt update
RUN apt install curl -y
RUN apt install wget -y
RUN apt install unzip -y
RUN apt install procps -y
RUN apt install nginx -y
RUN apt install sudo -y
RUN echo "root:root" |  chpasswd
RUN mkdir /app
RUN addgroup --gid 10001 onegroup 
RUN adduser --disabled-password  --no-create-home --uid 10001 --ingroup onegroup oneuser 
RUN echo "oneuser:oneuser" | chpasswd
RUN usermod -aG sudo oneuser 
COPY sleep.sh /app/sleep.sh
RUN chmod -R 777 /app
RUN chown oneuser /app
CMD ["bash","/app/sleep.sh"]
USER 10001