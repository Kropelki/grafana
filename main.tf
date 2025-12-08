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

resource "grafana_dashboard" "kropelki_dashboard" {
  config_json = file("dashboard.json")
  overwrite = true
}
