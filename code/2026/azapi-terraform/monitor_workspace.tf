resource "azapi_resource" "monitor_workspace" {
  type      = "Microsoft.Monitor/accounts@${local.monitor_api_version}"
  name      = var.workspace_name
  location  = var.location
  parent_id = local.rg_id
  tags      = var.tags

  body = {
    properties = {
      publicNetworkAccess = "Enabled"
    }
  }

  response_export_values = ["properties.metrics.prometheusQueryEndpoint"]
}
