---
title: "Application #1"
chapter: true
---

{{% notice tip %}}
This example service (with real details redacted) was selected as an illustration of a single general runbook covering a small (but v important!) microservice.
<br /><br />
I particularly like the clarity that their upstreams and downstreams are described (a diagram would enhance this, of course), and concise advice on responding to the various alerts (platform built-in and custom ones they've created).
<br /><br />
I've deliberately left much of the alert detail in place to showcase some of the standard ones we've selected to provide to **all** services on our platform, regardless of what they do.
{{% /notice %}}

---

# Service: Application-1

## Team Details

- Team Name: *your-team-name*
- Team Slack Shannel: [your-team-channel](#the-slack-channel)
- Service Slack Channel: [your-alerts-channel](#the-slack-channel)
- Service Catalogue: [service-catalogue-link](#the-service-catalogue)
- Team Location: UK _or maybe the building/floor_
- Product Owner: PO's name
- Delivery Lead: DL's name
- Group Email: if applicable

## Service Information

- This stateless microservice returns html by transforming raw json data for the requested content page. The service sits behind Service X and has two downstream dependencies:
  1. Content SaaS - A Content Management System (CMS) containing editorial data e.g. pages, templates, components etc.
  2. A.N.Other Service Z - containing product data

### Service Endpoints

| Deployment | Endpoint URL |
| --- | --- |
| Stubs        | https://stubs.link/to/my/endpoint |
| Integration  | https://integration.link/to/my/endpoint |
| Prod         | https://prod.link/to/my/endpoint |

---

### Service Clients

#### Client 1

> Client 1 is ... and depends on this service to ... It is business critical.

#### Client 2

> Client 2 is ... and depends on this service to ... It can tolerate downtime due to a cached copy of the data, but freshness becomes a concern after X minutes

---

### Service Dependencies:

#### CaaS

> SERVICE_NAME depends on Content SaaS - a third party CMS for data about ... Without it, this service cannot function

#### Service Z

> SERVICE_NAME also depends on A.N.Other Service Z. It relies on this for any relevant product data for this content page. Without it, content is still returned, just missing this information

---

## Active Alerts

[Link to key dashboard showing currently active alerts in Prometheus AlertManager for this service](https://link/goes/here)

## Service Monitoring

Metrics including CPU, Memory, Response codes and Latency are available in Grafana.

> Links to some dashboards here

### Service Monitoring - Dependencies

> Links to some custom dashboards here for their dependencies

### Service Logs

> Links to saved queries in Kibana here

---

## Diagnostic Tools

### How to kill pods

> Instructions on how to connect to the cluster and manually kill a faulty pod

---

## Service Alerts

{{% notice tip %}}
These sub-headings are linked to directly from the Alerts that go into the team's Slack Channel / PagerDuty notification
{{% /notice %}}

### content-renderer microservice has all pods down

- **Name:** `services.content.ENV_NAME-content-renderer.all-pods-unavailable`
- **Description:** Triggers when all Kubernetes pods are unavailable for more than 5 minutes. Despite all pods being down if previous pods had served up the resource (e.g. a page) successfully, the response will keep getting served from the downstream cache for next 24 hours
- **Action:** The Kubernetes cluster should automatically replace the unavailable pods. If symptoms persist, check deployment events with `kubectl describe deployment ENV_NAME-content-renderer` to see why Kubernetes is not been able to bring the pods up. If symptom persists, contact #team-x to investigate further
- **Impact:** Medium

### Pod restarting in a loop (Pod restart loop)

- **Name:** `platform.pod-restart-loop`
- **Description:** It's an SLO alert and triggers when a pod has restarted more than 1 times in the last 8m
- **Action:** This event requires deeper analysis if not caused by Platform team doing some maintenance/upgrade work. If symptom persists, contact #team-x to investigate further
- **Impact:** Low

**Note:** The downstream caching service running with only one or two pods has been tested without significantly impacting customer experience. Pages returned by the service are cached with 10 minutes TTL. Even when the cache TTL is expired, it will still serve the cached pages for next 24 hours, if it cannot successfully get a latest copy from the content renderer.

### 5xx errors for ENV_NAME-content-renderer in content

- **Name:** `slo-content.ENV_NAME-content-renderer.5xx-errors`
- **Description:** It's an SLO alert and triggers when the percentage of 5xx errors have been over 0.05% of the total requests for over 2 minutes.
- **Action:** If symptom persists, contact #team-x to investigate further
- **Impact:** High

### Prod zero traffic for content-renderer in content

- **Name:** `slo-content.ENV_NAME-content-renderer.zero-traffic`
- **Description:** It's an SLO alert and triggers when the service has not received any traffic for over 60m. No action needed if this is due to low traffic hours like 00:00 to 06:00.
- **Action:** If symptom persists, contact #team-x to investigate further
- **Impact:** Low

### Content renderer service: Latency increase in response times

- **Name:** `services.content.ENV_NAME-content-renderer.high-latency`
- **Description:** Triggers when response time latency increases.
- **Action:** Keep an eye on the usage since it could be due to heavy traffic spike or system warm up. If symptom persists, contact #team-x to investigate further
- **Impact:** Low

---

## Alerts for Dependencies

{{% notice tip %}}
These alerts represent custom ones that this team have created to warn on issues with their dependencies. A strong indicator of good operability!
{{% /notice %}}

### Content renderer service receiving 5xx errors from _third-party-thing_

- **Name:** `services.content.ENV_NAME-content-renderer.caas-5xx-errors`
- **Alert:** Triggers when service received 5xx errors from our SaaS provider. This error indicates that something is wrong with XXXX. Contact Team Y on #their-slack-channel to further investigate. Until it recovers, service will keep serving contents from its cache for next 24 hours
- **Action:** If symptom persists, contact #their-slack-channel to investigate further
- **Impact:** Medium

### Content renderer service receiving 5xx errors from Product API

- **Name:** `services.content.ENV_NAME-content-renderer.product-variants-5xx-errors`
- **Alert:** Triggers when service received 5xx errors from the Product API. This error indicates that something is wrong with Service Z. Until the API recovers, Service A will keep serving contents from its cache for next 24 hours
- **Action:** If symptom persists, contact #team-z to investigate further
- **Impact:** Medium

---

## Other Runbooks

{{% children %}}
