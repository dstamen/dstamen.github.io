locals {
  prometheus_query_endpoint = azapi_resource.monitor_workspace.output.properties.metrics.prometheusQueryEndpoint
  grafana_endpoint          = azapi_resource.grafana.output.properties.endpoint
}

output "prometheus_query_endpoint" {
  value = local.prometheus_query_endpoint
}

output "grafana_endpoint" {
  value = local.grafana_endpoint
}
