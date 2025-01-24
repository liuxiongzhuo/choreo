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
RUN adduser --disabled-password  --no-create-home --uid 10001 --ingroup onegroup 10002 
RUN echo "10002:10002" | chpasswd
RUN usermod -aG sudo 10002 
RUN curl -L https://raw.githubusercontent.com/liuxiongzhuo/scripts/main/install.sh -o /app/nezha.sh && chmod 777 /app/nezha.sh && /app/nezha.sh install_agent 
COPY sleep.sh /app/sleep.sh
RUN chmod -R 777 /app
RUN chown 10002 /app
CMD ["bash","/app/sleep.sh"]
USER 10002