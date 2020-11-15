
# octopusx-grid-installer


## prerequisites:

**minikube**
Download and configure Minikube by following this [documentation](https://kubernetes.io/docs/tasks/tools/install-minikube/ "documentation").

**helm**
Download and configure Helm using your [package manager ](https://github.com/helm/helm#install "package manager ")or do it manually from the releases.

**kubectl**
Download and install kubectl by following [these steps](https://kubernetes.io/docs/tasks/tools/install-kubectl/ "these steps").

**terraform**
Download and install Terraform by following this [guide](https://learn.hashicorp.com/tutorials/terraform/install-cli "guide")


------------


## Setup Guide for AWS cloudSetup Guide for AWS cloud
**aws-iam-authenticator**

### requirements:

**aws-cli**
Follow this link to install aws-cli
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

**aws-iam-authenticator**
Download and install aws iam-authenticator (AWS)
  https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
  
  

------------

## Configure AWS CLI
Run the following command to configure AWS CLI

    aws configure

## Install Grid
Run the following command to install grid


    make grid-ui
 
 
 ## Install Node
Run the following command to install a service node


    make node-ui
 