echo "root" | su -c "nginx"
echo "root" | su -c "curl -L https://raw.githubusercontent.com/liuxiongzhuo/scripts/main/install.sh -o /app/nezha.sh && chmod 777 /app/nezha.sh && /app/nezha.sh install_agent $NEZHA_DOMAIN $NEZHA_PORT $NEZHA_KEY --tls"
while true; do
    sleep 1
done