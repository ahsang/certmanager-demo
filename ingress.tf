resource helm_release "ingress-nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  timeout    = 900
  recreate_pods = true
  namespace = "default"

  values = [
  <<RAW_VALUES
controller:
  resources:
    limits:
      cpu: 0.6
      memory: 1Gi
    requests:
      cpu: 0.6
      memory: 1Gi
  RAW_VALUES
  ]
}
