resource "kubernetes_manifest" "clusterissuer" {
  depends_on = [helm_release.cert-manager]
  manifest = yamldecode(templatefile("${path.module}/templates/clusterissuer.yaml", var.email))
}