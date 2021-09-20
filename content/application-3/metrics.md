---
title: "Monitoring"
menuTitle: "Monitoring"
weight: 60
---

The Application-3 components report detailed metrics that show their health and state to [Prometheus](https://prometheus.io/) and provide dashboards in [Grafana](https://grafana.com/).

| Flex                                              | Prod                         |
| ------------------------------------------ | ----------------------------------- |
| [Flex Prometheus][flex-prometheus]         | [Prod Prometheus][prod-prometheus]  |
| [Flex Grafana][flex-grafana]               | [Prod Grafana][prod-grafana]        |
| [Flex Dashboards][flex-dashboards]         | [Prod Dashboards][prod-dashboards]  |

#### Dashboards

Detailed Grafana dashboards for all services and dependencies (GCP & Third Party) can be found here:

| Environment | System/Feature           | Location                                                         |
| ----------- | ------------------------ | ---------------------------------------------------------------- |
| prod        | OUR KEY DASHBOARD        | [Key Dashboard](https://link/to/main/custom/dashboard)           |
|             | ANOther Custom Dashboard | [Another Custom Dashboard](https://link/to/another/dashboard)    |

#### Other status and monitoring links

- [Third Party Cloud Console][third-party-cloud-console]. Links to monitoring clusters and kibana for all deployments (flex/prod). Requires access to Application-3 secrets
- [Third Party Status][third-party-cloud-status]
- [Google Cloud Status][google-cloud-status]

[flex-prometheus]: https://link/to/nonprod/prometheus
[prod-prometheus]: https://link/to/prod/prometheus
[flex-grafana]: https://link/to/non-prod/grafana
[prod-grafana]: https://link/to/prod/grafana
[flex-dashboards]: https://link/to/nonprod/dashboards/folder
[prod-dashboards]: https://link/to/prod/dashboards/folder
[third-party-cloud-status]: https://link/to/thirdparty/status
[third-party-cloud-console]: https://link/to/thirdparty/console
[google-cloud-status]: https://status.cloud.google.com/
