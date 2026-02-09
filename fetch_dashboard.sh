source .env

(
	curl -s \
		-H "Authorization: Bearer $GLSA_TOKEN" \
		"https://kropelki.grafana.net/api/dashboards/uid/$DASHBOARD_UID" \
		| jq '.dashboard | del(.id, .uid, .version, .iteration)'
) > dashboard.json
# Strip Grafana-managed fields so Terraform sees a stable desired state
# instead of runtime metadata that causes diffs or broken dashboards.

# Some formatting
jq --tab --indent 4 . dashboard.json | sponge dashboard.json

# TODO: read this https://grafana.com/docs/grafana/latest/as-code/infrastructure-as-code/terraform/dashboards-github-action/
