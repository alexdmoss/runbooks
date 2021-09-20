---
title: "Application #2"
chapter: true
---

{{% notice tip %}}
This example service is showing a more complex example with nested groups and so on - reflecting a more complex service with many components that necessitates a bit more structure.
<br /><br />
This app is also business critical, so includes a bit more detail on the processes involved there.
{{% /notice %}}

---

# Service: Application-2

## Team Details

- Team Name: *your-team-name*
- Team Slack Shannel: [your-team-channel](#the-slack-channel)
- Service Slack Channel: [your-alerts-channel](#the-slack-channel)
- Service Catalogue: [service-catalogue-link](#the-service-catalogue)
- Team Location: UK _or maybe the building/floor_
- Product Owner: PO's name
- Delivery Lead: DL's name
- Group Email: if applicable

## What is Application-2?

It is a UI service that mainly serves Category Pages and Product pages. It also hosts some of the components that we use across the website via ESI. See [General Information](general-information/) section for more information what the app does.

## Live Issue Decision Process

Follow this decision flow in order to manage the triggered incident. Acknowledge the alert and then first check the following key support channels to see if an incident is already in progress:

1. [#topic-major-incident-comms](#the-slack-channel)
2. [#topic-ops-bridge](#the-slack-channel)
3. [#team-platform](#the-slack-channel)

**If a major incident hasn't already been triggered, and you think it is required trigger it before doing anything else.**

**Trigger it immediately using the 'run a play' button on the PagerDuty Incident.**

> Diagram of incident decision process was here - removed

## Useful Support Links

See [investigating issues](investigating-issues/) for details on how to debug live issues with this service.  

| System | URL | Additional URL |
| --- | --- | --- |
| Grafana Dashboards | [Link to 4GS dashboard](#link-goes-here) | [Link to custom dashboard]((#link-goes-here)) |
| Kibana Logging | [Link to saved queries](#link-goes-here) | [Link to visualisations](#link-goes-here) |
| New Relic Dashboards | [Link to Client Dashboard](#link-goes-here) | [Link to Server Dashboard](#link-goes-here) |
| PagerDuty | [Link to Service's open alerts](#link-goes-here) | [Link to Rota](#link-goes-here) |
| Monetate | [Link to active Experiences](#link-goes-here) | |
| Code | [Link to Gitlab Group](#link-goes-here) | |
| ServiceNow | [Link to Group's open INCs](#link-goes-here) | [Link to Group's CHGs](#link-goes-here) |
| Service Catalogue | [Link to Service on the SC](#link-goes-here) | |

---

## Runbook Sections

{{% children %}}
