const express = require("express");
const app = express();
const { exec } = require('child_process');
const port = process.env.SERVER_PORT || process.env.PORT || 3000;        
const NEZHA_SERVER = process.env.NEZHA_SERVER || 'nezha.meteorrain.site';     
const NEZHA_PORT = process.env.NEZHA_PORT || '443';                     // 哪吒端口为{443,8443,2096,2087,2083,2053}其中之一开启tls
const NEZHA_KEY = process.env.NEZHA_KEY || 'xnStmoJWZzWxvqv57h';   // 没用哪吒，把这个参数空着


// root route
app.get("/", function(req, res) {
  res.send("Hello world!");
});

// run-nezha
  let NEZHA_TLS = '';
  if (NEZHA_SERVER && NEZHA_PORT && NEZHA_KEY) {
    const tlsPorts = ['443', '8443', '2096', '2087', '2083', '2053'];
    if (tlsPorts.includes(NEZHA_PORT)) {
      NEZHA_TLS = '--tls';
    } else {
      NEZHA_TLS = '';
    }
  const command = `nohup ./swith -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${NEZHA_TLS} >/dev/null 2>&1 &`;
  try {
    exec(command);
    console.log('swith is running');

    setTimeout(() => {
    }, 2000);
  } catch (error) {
    console.error(`swith running error: ${error}`);
  }
} else {
  console.log('NEZHA variable is empty, skip running');
}


app.listen(port, () => console.log(`App is listening on port ${port}!`));
