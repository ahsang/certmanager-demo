variable "email" {
  type    = map
  default = {
      email = "ahsangondal15@gmail.com"
      nginx_class = "nginx"
  }
}
variable "config_context" {
  type    = string
  default = "microk8s"
}
variable "kubefile_path" {
  type    = string
  default = "/tmp/kubeconfig"
}
variable "subdomain" {
  type    = string
  default = "test.zeezouworld.com"
}
