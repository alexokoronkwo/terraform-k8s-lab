module "payments" {
  source    = "./modules/web-app"
  app_name  = "payments"
  namespace = "team-c"
  replicas  = 2
}
