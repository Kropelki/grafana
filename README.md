# tf-infra

Terraform-managed infrastructure for the project.

This repository configures **Grafana Cloud** data sources to connect with **InfluxDB** for weather data visualization.

```bash
terraform init
terraform plan -var-file=".tfvars"
terraform apply -var-file=".tfvars"
```

---

- [Grafana Terraform Provider Documentation](https://registry.terraform.io/providers/grafana/grafana/latest/docs)
- [InfluxDB Data Source Configuration](https://grafana.com/docs/grafana/latest/datasources/influxdb/configure-influxdb-data-source/)
