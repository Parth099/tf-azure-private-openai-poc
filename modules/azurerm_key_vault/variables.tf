variable "name" {
	description = "The name of the Key Vault."
	type        = string
}

variable "location" {
	description = "The location/region where the Key Vault is created."
	type        = string
}

variable "resource_group_name" {
	description = "The name of the resource group in which to create the Key Vault."
	type        = string
}

variable "is_private" {
	description = "Boolean flag to determine if the Key Vault should be private."
	type        = bool
}

variable "keys" {
	description = "A list of keys to be created in the Key Vault."
	type        = list(string)
}