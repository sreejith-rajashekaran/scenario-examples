curl -fsSl https://kubevela.io/script/install.sh | bash

vela install

mkdir -p KubeVelaManifest


mv /root/app.yaml /root/KubeVelaManifest/app.yaml

