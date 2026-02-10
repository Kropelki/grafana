variable "grafana_url" {
  description = "Grafana Cloud URL"
  type        = string
}

variable "grafana_auth_token" {
  description = "Grafana service account token"
  type        = string
  sensitive   = true
}

variable "influxdb_url" {
  description = "InfluxDB Cloud URL"
  type        = string
}

variable "influxdb_token" {
  description = "InfluxDB API token"
  type        = string
  sensitive   = true
}

variable "influxdb_org_id" {
  description = "InfluxDB organization ID"
  type        = string
}

variable "influxdb_bucket" {
  description = "InfluxDB bucket name"
  type        = string
  default     = "weather-data"
}

variable "turso_url" {
  description = "Turso database URL"
  type        = string
}

variable "turso_auth_token" {
  description = "Turso auth token"
  type        = string
  sensitive   = true
}
