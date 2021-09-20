---
title: "slo-application-2-newrelic-alerts"
chapter: true
---

# PagerDuty Alert: Application-2 xxxx

**Summary:** The rules configured in NewRelic detected an anomaly

**Customer Impact:** customer has problems with their journey to buy something

**Actions:**

## Is there a bigger issue?

Join and check the following channels

- [#topic-major-incident-comms](https://link/to/channel)
- [#topic-ops-bridge](https://link/to/channel)
- [#team-platform](https://link/to/channel)

Read and gain and understand what is happening, so you have context, if there is a major incident(MI) in progress. Participate and add relevant notes. e.g. `Application-2 received a NewRelic alert at xx:xx`

If there is no MI, keep investigating the Application-2 issue.

You will need to determine if Application-2 is the cause of the problem or suffering symptoms because of a dependency issue.

## NewRelic False Alert?

Sometimes NewRelic Synthetics can have natural connection problems so just in case check the Script Log tab to see the exception. In case you conclude it is a false alert, we should just resolve the Pager Duty alert with a note on it.

False alerts can be triggered from new relic due to below reasons

- Synthetics issues
  - Synthetic script is failing due to not getting response from the Insights API
- New relic systems may be faulty. Check the latest [NewRelic status](https://status.newrelic.com/)

## Checking Application-2

### Rule in/out our application

Check the [4 golden signals dashboard](https://link/to/platform/dashboard)

Is there:

- A sustained drop in traffic and availability?
- Has latency risen?
- Is CPU usage growing?
- Is Memory saturation growing
- Has the number of replicas spiked up or down? Has it remained there?

Check the [NewRelic Synthetic Monitors page](https://link/to/newrelic) to find more details about the alert you just saw.

---

**Alert** | Application-2 | Basket | GetBasket Error Limit Breached | P3

- Go through the basket API [logs in Kibana](https://link/to/logs)
- Search for the errors
- Alternatively, we can check the error stacktrace in the new relic using [this link](https://link/to/newrelic)
- Report the error in #team-x slack channel if you see timeout errors

**Alert** | Application-2 | Product | GetProducts API Error Limit breached | P3

- Go through the Product API [logs in Kibana](https://link/to/logs)
- Search for the errors
- Report the errors in #team-x slack channel if you see timeout errors for product api calls
- Report the errors in #team-y in case errors are originated for rvi calls - see [logs here](https://link/to/specific/logs)
- Alternatively, we can check the error stacktrace in new relic using [this link](https://link/to/newrelic)

**Alert** | Application-2 | BFF | Timeout Errors Limit Breached | P3

- Search for "Socket closed" errors in Kibana using [this link](https://link/to/log/query)
- Report the issue in #team-x channel in office hours
- Raise an incident in ITIL_TOOL to the assignment group ANOTHER_TEAM. That will trigger an pager duty call to Website support team

**Alert** | Application-2 | BISN | Stock Notifications Error threshold Breached | P3

- Go through the [API logs](https://link/to/logs/query) in Kibana
- Search for the errors
- Alternatively, we can check the error stacktrace in the new relic using [this link](https://link/to/newrelic)
- Report the error in #team-z slack channel if you see any timeout errors

**Alert** | Application-2 | Drop in Transaction Limit Breached | P3

**In PagerDuty** this will be reported as:

`[application-2] Error [Runbook] (Alert | Application-2 | Drop in Transaction Limit Breached | P3 violated Application-2 | Drop in Transaction Limit Breached | P3)`

Orders drop can be impacted by the UI if there is a problem displaying the Add to Basket button or by poor response times in DEPENDENCY_A.

- Go to [Ops Monitoring Dashboard](https://link/to/newrelic) in NewRelic and see how severe is the drop.
- In Golden Signals, select a bigger range (e.g. 2 days) to have a sense if something our of ordinary happened, for example, if there was a Live Load Test that created a big number of orders.
- Search for the errors in Kibana dashboards. Check [our runbook](/application-2/) for the right URLs.
- Report the error in #topic-x slack channel if the alert is not clear in 10 minutes or so.
