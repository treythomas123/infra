# TODO: switch to this in Terraform 0.12:
# variable "subdomain_delegations" {
#   type = list(object({subdomain: string, name_servers: list(string)}))
#   description = "List of subdomains and corresponding nameservers for DNS delegation"
#   default = []
# }

variable "subdomain_delegations" {
  type = "list"
}
variable "subdomain_delegations_ns" {
  type = "list"
}
