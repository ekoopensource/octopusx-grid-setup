  resource "helm_release" "mysql-service" {
    name       = "octopusx-mysql"
    chart      = "nodes/service-node/octopusx-mysql-chart"
    namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }


  resource "helm_release" "redis-service" {
  name       = "octopusx-redis"
  chart      = "nodes/service-node/octopusx-redis-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }


  resource "helm_release" "phpmyadmin-service" {
  name       = "octopusx-phpmyadmin"
  chart      = "nodes/service-node/octopusx-phpmyadmin-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }





  resource "helm_release" "access-service" {
  name       = "octopusx-access"
  chart      = "nodes/service-node/octopusx-access-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }





  resource "helm_release" "auth-service" {
  name       = "octopusx-auth"
  chart      = "nodes/service-node/octopusx-auth-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }





  resource "helm_release" "data-service" {
  name       = "octopusx-data"
  chart      = "nodes/service-node/octopusx-data-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }





  resource "helm_release" "domain-service" {
  name       = "octopusx-domain"
  chart      = "nodes/service-node/octopusx-domain-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }





  resource "helm_release" "profile-service" {
  name       = "octopusx-profile"
  chart      = "nodes/service-node/octopusx-profile-chart"
  namespace  = var.namespace
    #create_namespace =  true

  depends_on = [kubernetes_secret.docker_config,kubernetes_namespace.node]
  }





