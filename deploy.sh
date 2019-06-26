#!/bin/sh
source .env
packer_build() {
echo "cd.. into packer folder"
# cd into packer folder and run the packer.json file
cd packer 
packer build packer.json
}
terraform_apply() {
# cd into the terraform folder and run the terraform file 
 cd ..
 echo " cd.. into terraform folder"
 cd terraform
 terraform init 
 terraform apply -auto-approve 
}
main(){
packer_build
terraform_apply
}

main