
  data "terraform_remote_state" "kube" {
    backend = "local"

    config = {
    path = "states/grid/${var.grid}.state"
  }
  }

  provider "helm" {
    kubernetes {

  load_config_file       = "false"
  host                   = data.terraform_remote_state.kube.outputs.cluster_endpoint
  token                  = data.terraform_remote_state.kube.outputs.cluster_token
  cluster_ca_certificate = base64decode(data.terraform_remote_state.kube.outputs.cluster_certificate_authority_data)
    }
  }