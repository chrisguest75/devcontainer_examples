terraform {
  required_version = "=1.1.5"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

#################################################
## Variables
#################################################

variable "records_file" {
  type    = string
  default = "./dns/test_records.json"
  # validation {
  #   condition     = fileexists(var.records_file)
  #   error_message = "Input filepath does not exist"
  # }
}

variable "out_path" {
  type    = string
  default = "./files"
}

#################################################
## Locals
#################################################

locals {
  json_records = jsondecode(file(var.records_file))
  records_data = local.json_records.records


}

data "local_file" "headers" {
  filename = "./dns/header.txt"
}

#################################################
## Resources
#################################################

resource "local_file" "file" {
  for_each = { for record in local.records_data : format("%s.%s", record.name, record.type) => record }
  content  = format("%s\n%s\n%s\n%s\n%s\n%s", data.local_file.headers.content, each.value.name, each.value.ttl, each.value.type, each.value.zoneid, join(",", each.value.records))
  filename = format("%s/%s.%s", var.out_path, each.value.name, each.value.type)
}

output "records_data" {
  value = local.records_data
}

# TODO: List the files
#output files {
#    value = local.records_data
#}