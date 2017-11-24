echo "Script to install docker.........................."


sudo apt-get update


sudo apt-get install -y docker.io


sudo docker version 



echo "Docker has been installed successfully.............."




echo "Kubernetes is installing........................."

sudo apt-get update && apt-get install -y apt-transport-https

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list

deb http://apt.kubernetes.io/ kubernetes-xenial main

EOF

sudo apt-get update

sudo apt-get install -y kubelet kubeadm kubectl


sudo kubectl version


echo "Kubernetes has been installed............................"

