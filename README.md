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
## Build Machine Image

- To build the AMI cd into the packer foler, source your `.env`file (make sure you have provided your AWS keys on the .env file) and run `packer.json`
## Provisioning EC2 instance with the AMI you created

- From your AWS [console](https://console.aws.amazon.com/ec2/v2/home) (ensure you're in the same region the image was created), click on Services at the top menu and select EC2.
- Navigate to the left hand menu, under IMAGES, click on AMI.
- From the list of images presented to you, identify the image you just created and select it. Click on launch.
- Choose an instance type, and then choose Next: Configure Instance Details. t2.micro will be selected by default since the image was built with this instance_type.
- Click Next: Add Storage
- Click Next: Add Tags
- Add tags (optional) and proceed to create security group.
- In the port range column, input the port your app is running on.
- Set the source IP to 0.0.0.0/0 to allow traffic from all sources.
- Click "Review and Launch" to review your settings.
- Then click launch.
- Select an existing key pair or create a new key pair, select the acknowledge agreement box, and then choose Launch Instances.
- Navigate to EC2 dashboard and click on instances to view the instance you just created.
- Click on the instance from the list presented.
- Copy the IP address and past it in your browser URL to access the application.

