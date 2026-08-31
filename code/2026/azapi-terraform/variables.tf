variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region (e.g. eastus)"
}

variable "workspace_name" {
  type        = string
  description = "Name of the Azure Monitor Workspace"
}

variable "grafana_name" {
  type        = string
  description = "Name of the Azure Managed Grafana instance"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}
