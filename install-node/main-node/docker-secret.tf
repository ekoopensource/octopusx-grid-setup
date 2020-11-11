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