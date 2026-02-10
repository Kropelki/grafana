terraform {
  required_version = ">= 1.12.0"
  required_providers {
    grafana = {
      # https://registry.terraform.io/providers/grafana/grafana/latest/docs
      source  = "grafana/grafana"
      version = "~> 3.25.6"
    }
  }
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_auth_token
}

# https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source
# https://grafana.com/docs/grafana/latest/datasources/influxdb/configure-influxdb-data-source/#provisioning-examples
#
# Command to import existing InfluxDB datasource:
# terraform import grafana_data_source.influxdb "ber1znn8lplvke"
#
resource "grafana_data_source" "influxdb" {
  type = "influxdb"
  name = "weather-measurements"
  url  = var.influxdb_url

  json_data_encoded = jsonencode({
    version      = "SQL"
    dbName       = var.influxdb_bucket
    organization = var.influxdb_org_id
  })

  secure_json_data_encoded = jsonencode({
    token = var.influxdb_token
  })
}

# Turso datasource (requires the Turso Grafana plugin)
#
# Command to import existing Turso datasource:
# terraform import grafana_data_source.turso "aeusl4w6pt1xcf"
#
resource "grafana_data_source" "turso" {
  type = "yesoreyeram-infinity-datasource"
  name = "turso-infinity"
  url  = var.turso_url

  json_data_encoded = jsonencode({
    auth_method              = "bearerToken"
    customHealthCheckEnabled = false
    global_queries           = []
    oauthPassThru            = false
    pdcInjected              = true
  })

  secure_json_data_encoded = jsonencode({
    bearerToken = var.turso_auth_token
  })
}

#
# Command to import existing dashboard:
# terraform import grafana_dashboard.kropelki_dashboard "kaz9b7b"
#
resource "grafana_dashboard" "kropelki_dashboard" {
  config_json = file("dashboard.json")
  overwrite = true
}
