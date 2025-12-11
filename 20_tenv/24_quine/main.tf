terraform {
  required_version = "=1.3.2"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

#################################################
## Variables
#################################################

variable "output_path" {
  type    = string
  default = "./output"

  validation {
    condition     = startswith(var.output_path, "./") && (length(var.output_path) > 2)
    error_message = "Path has to start with './' and be longer than 2 characters."
  }
}

#################################################
## Locals
#################################################

locals {
  contents = fileset(".", "*.{tf,tfvars,md,gitignore,.terraform-version}")
}

#################################################
## Resources
#################################################

resource "local_file" "files" {
  for_each = local.contents
  content  = file(each.value)
  filename = join("/", [var.output_path, basename(each.value)])
}
