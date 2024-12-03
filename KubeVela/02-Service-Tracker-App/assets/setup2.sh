curl -fsSl https://kubevela.io/script/install.sh | bash

vela install

mkdir -p KubeVelaManifest


mv /root/app.yaml /root/KubeVelaManifest/app.yaml
mv /root/enhanced-webservice.yaml /root/KubeVelaManifest/enhanced-webservice.yaml
mv /root/secret.yaml /root/KubeVelaManifest/secret.yaml
