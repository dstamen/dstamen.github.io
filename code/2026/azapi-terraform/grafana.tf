resource "azapi_resource" "grafana" {
  type      = "Microsoft.Dashboard/grafana@${local.grafana_api_version}"
  name      = var.grafana_name
  location  = var.location
  parent_id = local.rg_id
  tags      = var.tags

  identity {
    type = "SystemAssigned"
  }

  body = {
    sku = {
      name = "Standard"
    }
    properties = {
      grafanaMajorVersion = "10"
      publicNetworkAccess = "Enabled"
      grafanaIntegrations = {
        azureMonitorWorkspaceIntegrations = [
          {
            azureMonitorWorkspaceResourceId = azapi_resource.monitor_workspace.id
          }
        ]
      }
    }
  }

  response_export_values = ["properties.endpoint"]
}
