## Automating deployment on AWS EC2 instance using Packer, Ansible and Terraform

## About
This scripts uses packer to build an image and configures it with Ansible, then uses Terraform to spin up an EC2 instance on AWS with the image created by packer

#### Dependencies

1. These project uses [`pm2`](http://pm2.keymetrics.io/) for running the application in background process
2.  [`nginx`](https://www.nginx.com/) for reverse proxy
3. [`Packer`](https://packer.io/) For building the image
4. [`Ansible`](https://www.ansible.com/) For configuring the image
5. [`Terraform`](https://www.terraform.io/) For provisioning the infrastructure on AWS



### Setup environment varibles

>- To setup your environment variables used the .env.sample as a guide
>- export AWS_ACCESS_KEY_ID='your aws keys'
>- export AWS_SECRET_ACCESS_KEY='your aws secret'

### Decrypt the variables file

>- The variables.yml file is encrypted with ansible vault, to decrypt the file run
>- `ansible-vault decrypt variables.yml`
>- Enter the password haven

#### Instructions

You can get the script running in the following way:

1. Clone the repository and cd into it
   
	  ```
    git clone https://github.com/ekpangmichael/packer-ansible-terraform.git
    cd packer-ansible-terraform
    ```
2. To run the script, run
    ```
    bash deploy.sh
    ```

