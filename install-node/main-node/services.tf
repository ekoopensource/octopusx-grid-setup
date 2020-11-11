  resource "helm_release" "mysql-service" {
    name       = "octopusx-mysql"
    chart      = "nodes/main-node/octopusx-mysql-chart"
    namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }

  resource "helm_release" "rabbitmq-service" {
  name       = "octopusx-rabbitmq"
  chart      = "nodes/main-node/octopusx-rabbitmq-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }



  resource "helm_release" "sonarqube-service" {
  name       = "octopusx-sonarqube"
  chart      = "nodes/main-node/octopusx-sonarqube-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }



  resource "helm_release" "phpmyadmin-service" {
  name       = "octopusx-phpmyadmin"
  chart      = "nodes/main-node/octopusx-phpmyadmin-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }



