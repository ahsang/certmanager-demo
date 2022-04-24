resource helm_release "app" {
  name       = "app"
  chart      = "./outyet"
  timeout    = 900
  recreate_pods = true
  namespace = "default"
}