resource "kubectl_manifest" "clusterissuer" {
  depends_on = [helm_release.cert-manager]
  yaml_body = templatefile("${path.module}/templates/clusterissuer.yaml", var.email)
}