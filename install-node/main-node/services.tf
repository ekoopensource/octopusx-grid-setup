  resource "helm_release" "data-service" {
    name       = "octopusx-data"
    chart      = "nodes/main-node/octopusx-data-chart"
    namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }