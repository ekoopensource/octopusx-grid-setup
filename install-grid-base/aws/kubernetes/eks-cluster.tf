
  variable "cluster_name" {
    description = "Grid Name"

  }



module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = var.cluster_name
  cluster_version = "1.17"
  subnets      = module.vpc.private_subnets
  write_kubeconfig =  true
  config_output_path  = "kubeconfigs/"
  kubelet_extra_args  = "--node-labels=node.kubernetes.io/lifecycle=spot"

  tags = {
    Environment = "sandbox"

  }

  vpc_id = module.vpc.vpc_id

  node_groups_defaults = {
  ami_type  = "AL2_x86_64"
  disk_size = 10
  additional_tags = {
  Name = "${var.cluster_name}-managed-node-eks"
  }
  }

    # Managed Node Groups
  node_groups = {
  managed-workers-01 = {
  desired_capacity = 1
  max_capacity     = 2
  min_capacity     = 1

  instance_type = "t2.medium"
  k8s_labels = {
  Environment = "staging"
  NodeType    = "managed"
  }
  }
  }


  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.medium"
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      bootstrap_extra_args          = "--enable-docker-bridge true"
    },
    {
      name                          = "worker-group-2"
      instance_type                 = "t2.medium"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 2
      bootstrap_extra_args          = "--enable-docker-bridge true"
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}




  output "cluster_token" {
  value       = data.aws_eks_cluster_auth.cluster.token
  description = "Cluster  token"

  }

  output "cluster_endpoint" {
  value       = data.aws_eks_cluster.cluster.endpoint
  description = "Cluster  endpoint"

  }


  output "cluster_certificate_authority_data" {
  value       = data.aws_eks_cluster.cluster.certificate_authority.0.data
  description = "Cluster  CA"

  }