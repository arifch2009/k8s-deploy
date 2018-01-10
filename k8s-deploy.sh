#!/bin/sh

master=$1 

worker1=$2

worker2=$3


echo $master

echo ".......Running on the master node......."
scp install-pkg.sh reset-config.sh master-config.sh   root@$master:
ssh root@$master chmod +x *
ssh root@$master ./install-pkg.sh

ssh root@$master  ./reset-config.sh

echo "Initialiing the master node..."

tok=$( ssh root@$master kubeadm init | grep "kubeadm join" )


echo $tok


ssh root@$master ./master-config.sh


echo ".......Cluster Informqtion......"
ssh root@$master kubectl get nodes



echo  ".......Running on the 1st worker node......."

scp install-pkg.sh reset-config.sh   root@$worker1:

ssh root@$worker1 chmod +x *
ssh root@$worker1 ./install-pkg.sh

ssh root@$worker1  ./reset-config.sh

echo "Worker 1 joining the cluster..."

ssh root@$worker1 $tok 

echo ".......Cluster Informqtion......"
ssh root@$master kubectl get nodes


echo  ".......Running on the 2nd  worker node......."

scp install-pkg.sh reset-config.sh   root@$worker2:

ssh root@$worker2 chmod +x *
ssh root@$worker2 ./install-pkg.sh

ssh root@$worker2  ./reset-config.sh

echo "Worker 2 joining the cluster..."

ssh root@$worker2 $tok 

echo ".......Cluster Informqtion......"
ssh root@$master kubectl get nodes


