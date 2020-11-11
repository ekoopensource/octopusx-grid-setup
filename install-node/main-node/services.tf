  resource "helm_release" "data-service" {
    name       = "octopusx-data"
    chart      = "nodes/main-node/octopusx-data-chart"
    namespace  = var.namespace
    create_namespace =  true
  }