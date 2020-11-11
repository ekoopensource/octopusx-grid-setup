
    variable "registry_server" {
        description = "Registry server"

    }


        variable "registry_username" {
        description = "Registry Username"

    }



        variable "registry_password" {
        description = "Registry password"

    }




        resource "kubernetes_secret" "docker_config" {
    metadata {
    name = "dockerregistrycred"
    namespace = var.namespace
    }

    data = {
    ".dockerconfigjson" = <<DOCKER
    {
      "auths": {
        "${var.registry_server}": {
          "auth": "${base64encode("${var.registry_username}:${var.registry_password}")}"
        }
      }
    }
    DOCKER
    }

    type = "kubernetes.io/dockerconfigjson"
  }