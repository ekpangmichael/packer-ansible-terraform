#!/bin/sh
source .env
echo "cd.. into packer folder"

# cd into packer folder and run the packer.json file
cd packer 
 packer build packer.json

# cd into the terraform folder and run the terraform file 
 cd ..
 cd terraform
 echo " cd.. into terraform folder"
 terraform init 
 terraform apply -auto-approve 