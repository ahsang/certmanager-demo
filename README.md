#certmanager-demo

##Requirements
- microk8s installed with dns and metallb enabled
- kubectl setup and current context set to microk8s

The objective of the project is to deploy a [test-app](https://github.com/ahsang/golang-cicd) via a [helm chart] (https://github.com/ahsang/certmanager-demo/tree/master/app-chart). The app can be accessed after the subdomain (defaults to test.zeezouworld.com) DNS A record is pointed to the nginx ingress service external ip.

The project install an nginx-ingress via helm to serve as a proxy.
Moreover, certmanager is installed along with a letsencrupt cert issuer to auto generate certificates for any ingress created.

Please refer to vars.tf and create a input.tfvars file to provide custom values.