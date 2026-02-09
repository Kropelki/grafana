# grafana

This repository configures **Grafana Cloud** data sources to connect with **InfluxDB** for weather data visualization.

```bash
terraform init
terraform plan"
terraform apply"
```

---

- [Grafana Terraform Provider Documentation](https://registry.terraform.io/providers/grafana/grafana/latest/docs)
- [InfluxDB Data Source Configuration](https://grafana.com/docs/grafana/latest/datasources/influxdb/configure-influxdb-data-source/)

---

Install `terraform` on Linux Mint:

```sh
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(. /etc/os-release && echo "$UBUNTU_CODENAME") main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

---

Flow for updating Grafana dashboard:

1. Update the dashboard in Grafana Cloud UI and save
2. Run `./fetch_dashboard.sh`
3. Run `terraform plan` and expect "no changes"
4. Commit the updated dashboard JSON to Git

<!-- #TODO: do we really need Terraform at all? -->
