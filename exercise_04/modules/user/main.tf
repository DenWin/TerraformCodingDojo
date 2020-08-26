
variable "group"         { }
variable "users"         { }

locals {
  lines = [for user in var.users: "${user}: some text\n"]
}

resource local_file "directory" {
  filename  = "txt_output/${var.group}.txt"
  content   = join("", local.lines)
}
