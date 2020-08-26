variable "tenant_id"        { }
variable "subscription_id"  { }
variable "client_id"        { }
variable "client_secret"    { }

variable "enabled"          { default=true }
variable "hub_names"        { default = "hubname" }

variable "user-types"       { type = map(object({ group = string, users = set(string) })) }

locals {
  routes = [
      {
        address_prefixes = ["10.0.3.0/24"]
        next_hop_ip_address = "10.0.200.4"
      },

      {
        address_prefixes = ["10.0.4.0/24"]
        next_hop_ip_address = "10.0.200.5"
      }
  ]
}
