terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-terra-lab"
}

module "blog" {
  source    = "./modules/web-app"
  app_name  = "blog"
  namespace = "team-a"
  replicas  = 2
}

module "shop" {
  source    = "./modules/web-app"
  app_name  = "shop"
  namespace = "team-b"
  replicas  = 3
}

output "blog_service" {
  value = module.blog.service_name
}

output "shop_service" {
  value = module.shop.service_name
}
