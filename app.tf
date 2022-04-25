resource helm_release "app" {
  depends_on = [helm_release.ingress-nginx,helm_release.cert-manager,kubernetes_manifest.clusterissuer]
  name       = "app"
  chart      = "./outyet"
  timeout    = 900
  recreate_pods = true
  namespace = "default"
}