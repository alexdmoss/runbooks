---
title: "Alerts"
chapter: true
---

## Alerts

The alerts configured to Application-2 are the standard alerts provided by default by the platform.

More information about monitoring and alerts can be found [here](https://link/to/more/docs)

## Standard Alerts

These alerts are the predefined ones for any service on PLATFORM_NAME. If they are not required, or if you wish to vary the alerting criteria necessary to trigger them, you can edit the [service definition base yaml](https://link/to/config/in/git) and create some **microservice_alert_overrides** for the relevant microservice(s).

---

### slo-application-2.prod-browse.5xx-errors

Check new [5xx Alert page](/application-2/alerts/slo-application-2.prod-browse.5xx-errors/)

---

### slo-application-2.prod-browse.service-availability

**Summary:** Service pods are not available

**Customer Impact:** Errors

**Actions:**

- Use Grafana to confirm when traffic stopped and consider any linked events such as releases that may have caused this.
- Check for other alerts in PagerDuty that may be linked - the issue may be out of our control. In particular, look at Platform and AN_OTHER_DEPENDENCY, as well as #topic-major-incidents in Slack.
- A recent release may have caused an issue - consider a rollback to the previous version.

---

### slo-application-2.prod-browse.pod-oom-kills

**Summary:** The service's pods have restarted as they have run out of memory - the number of pods and resources should be re-evaluated.

**Customer Impact:** Errors, slow responses

**Actions:**

- Analyse the Kubernetes resources to understand the reason the for restarts.
- Look in Grafana dashboard for memory profile changes to understand how rapidly the memory is spiking.
- Look in Kibana for further information, errors in particular.
- Consider either scaling up number of pods or increasing memory for pods.
- A release may have significantly degraded performance and spinning up more pods may fix it temporarily. Consider a rollback to the previous release.

---

### slo-application-2.prod-browse.zero-traffic

**Summary:** Service pods are not handling traffic.

**Customer Impact:** Our service will not be returning product pages.

**Actions:**

- Use Grafana to confirm when traffic stopped and consider any linked events such as releases that may have caused this. This may be a release by DEPENDENCY_X, or another of our dependencies.
- Look in Kibana for further correlating information, errors in particular.
- Check also for other alerts in PagerDuty that may be linked - the issue may be out of our control. In particular, look at Platform, as well as #topic-major-incidents in Slack for non PagerDuty services - this would include _LIST_OF_OTHER_SERVICE_DEPENDENCIES_ and Router services that sit above the product service.
- A recent release may have caused an issue - consider a rollback to the previous version.

**Note:** If traffic is expected to be zero e.g. because the % split to the NEW_SERVICE has been paused in Monetate, then you should silence the alert for a day or two and arrange a team meeting in the team calendar before the silence is due to expire to discuss whether or not the silence should be extended.
