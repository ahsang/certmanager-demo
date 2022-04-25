resource helm_release "app" {
  depends_on = [helm_release.ingress-nginx,helm_release.cert-manager,kubectl_manifest.clusterissuer]
  name       = "app"
  chart      = "./outyet"
  timeout    = 900
  recreate_pods = true
  namespace = "default"
  set {
    name = "ingress.hosts[0].host"
    value = var.subdomain
  }
  set {
    name = "ingress.tls.hosts[0]"
    value = var.subdomain
  }
}