
    provider "kubernetes" {

#  load_config_file       = "false"
#  host                   = data.terraform_remote_state.kube.outputs.cluster_endpoint
#  token                  = data.terraform_remote_state.kube.outputs.cluster_token
#  cluster_ca_certificate = base64decode(data.terraform_remote_state.kube.outputs.cluster_certificate_authority_data)
   config_path     ="kubeconfigs/kubeconfig_${var.grid}"
    }


    resource "kubernetes_namespace" "node" {
    metadata {
          annotations = {
         # name = "example-annotation"
          }

    labels = {
    grid = var.grid
    }

    name = var.namespace
    }
    }

