output "grafana_data_source_id" {
  description = "ID of the created InfluxDB data source"
  value       = grafana_data_source.influxdb.id
}
