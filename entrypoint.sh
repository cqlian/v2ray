#echo -e "$CONFIG_JSON" > config.json
#if [ "$CERT_PEM" != "$KEY_PEM" ]; then
#  echo -e "$CERT_PEM" > cert.pem
#  echo -e "$KEY_PEM"  > key.pem
#fi

echo  "$V2ray_ver" 
cd /v2ray
wget -O v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v"$V2ray_ver"/v2ray-linux-64.zip
unzip v2ray.zip 
if [ ! -f "v2ray" ]; then
  mv /v2ray/v2ray-v$VER-linux-64/v2ray .
  mv /v2ray/v2ray-v$VER-linux-64/v2ctl .
  mv /v2ray/v2ray-v$VER-linux-64/geoip.dat .
  mv /v2ray/v2ray-v$VER-linux-64/geosite.dat .
fi

cp -f /config.json .
echo -e "$CONFIG_JSON" > config.json
#chmod -R rw /v2ray
chmod +x v2ray v2ctl
./v2ray
