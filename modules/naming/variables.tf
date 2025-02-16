variable "svc_name" {
  description = "name of the Service"
  type        = string
}

variable "application_name" {
  description = "name of the Application"
}

variable "region" {
  description = "name of the default region"
}

variable "environment" {
  description = "Environment (dev, test, prod)"
}

variable "svc_shorthand" {
  description = "used to derive the resource name"
  default = {
    "Virtual Network"        = "vnet"
    "Resource Group"         = "rg"
    "Private Endpoint"       = "pe"
    "Network Security Group" = "nsg"
    "Subnet"                 = "sb"
    "Kubernetes Cluster"     = "kc"
  }
}

variable "region_shorthand" {
  description = "used to derive the resource name"
  default = {
    eastus = "use"
  }
}

variable "env_shorthand" {
  description = "Environment (dev, test, prod)"
  default = {
    dev  = "dev"
    test = "tst"
    prod = "prd"
  }
}
