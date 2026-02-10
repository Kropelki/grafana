output "grafana_data_source_id" {
  description = "ID of the created InfluxDB data source"
  value       = grafana_data_source.influxdb.id
}

output "grafana_turso_data_source_id" {
  description = "ID of the created Turso data source"
  value       = grafana_data_source.turso.id
}
