resource "kubernetes_namespace" "cert_manager" {
  metadata {
    annotations = {
      name = "cert-manager-annotation"
    }

    name = "cert-manager"
  }
}

resource "helm_release" "cert-manager" {
  depends_on = [kubernetes_namespace.cert_manager]
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  values = [
    <<RAW_DATA
ingressShim: 
  defaultIssuerName: "letsencrypt-stage"
  defaultIssuerKind: "ClusterIssuer"
  defaultIssuerGroup: "cert-manager.io"
resources:
  requests:
    cpu: 0.1
    memory: 200Mi
  limits:
    cpu: 0.1
    memory: 200Mi
    RAW_DATA
  ]
  set {
    name = "installCRDs"
    value = "true"
  }
}
