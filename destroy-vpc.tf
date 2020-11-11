  provider "aws" {
    version = ">= 2.28.1"
    region  = "eu-west-1"
  }

    terraform {
      required_version = ">= 0.12"
  }

      provider "random" {
      version = "~> 2.1"
  }

      provider "local" {
      version = "~> 1.2"
  }

      provider "null" {
      version = "~> 2.1"
  }

      provider "template" {
      version = "~> 2.1"
  }

  provider "kubernetes" {
  version = "~> 1.7"
  }




  variable "grid" {
    description = "Grid Name"
    # default     = "octopusx-grid"
  }

variable "region" {
  description = "Region"
    # default     = "octopusx-grid"
  }


data "terraform_remote_state" "grid" {
  backend = "local"

  config = {
  path = "states/grid/${var.grid}.state"

}
}

resource "null_resource" "grid_destroy" {
#
#  depends_on       = [terraform_remote_state.grid]


  provisioner "local-exec" {
  command = "./delete-vpc.sh ${var.region} ${data.terraform_remote_state.grid.outputs.vpc_id}"
  }

}

