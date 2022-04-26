resource helm_release "app" {
  depends_on = [helm_release.ingress-nginx,helm_release.cert-manager,kubectl_manifest.clusterissuer]
  name       = "app"
  chart      = "./app-chart"
  timeout    = 900
  recreate_pods = true
  namespace = "default"
  values = [
<<RAW_VALUES
ingress:
  enabled: true
  annotations: 
    nginx.ingress.kubernetes.io/rewrite-target: /$1
    certmanager.k8s.io/cluster-issuer: "letsencrypt-prod"
    certmanager.k8s.io/acme-challenge-type: http01
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: "true"
  hosts:
    - host: ${var.subdomain}
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls: 
    - secretName: app-tls
      hosts:
        - ${var.subdomain}
RAW_VALUES
  ]
}