variable "profiles" {
  default = ["infrastructure", "payments", "opensource"]
}
locals {
  config = jsonencode({
    "profile": {
      "info_cache": templatefile("${path.module}/brave.tftpl", { test = "foo", profiles = var.profiles })
    }
  })
}


output "profiles" {
  value = local.config
}
