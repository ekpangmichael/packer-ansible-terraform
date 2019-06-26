#!/bin/sh
destroy(){
 cd terraform
 terraform destroy -auto-approve 
}

main(){
  destroy
}
main