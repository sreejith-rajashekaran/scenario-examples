curl -fsSl https://kubevela.io/script/install.sh | bash

chmod +x /root/setup2.sh

vela install

mkdir -p KubeVelaManifest 

mv /root/app.yml KubeVelaManifest/app.yml
mv /root/enhanced-webservice.yml KubeVelaManifest/enhanced-webservice.yml
mv /root/secret.yml KubeVelaManifest/secret.yml

echo "Configuration moved again!"

