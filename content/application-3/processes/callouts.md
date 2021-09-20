---
title: "Calling out Team X or responding to a call out"
menuTitle: "Callouts and incidents"
---

### Start Here

When you receive notification of an incident by phonecall, push notification, SMS or Slack, you should:

1. Acknowlege the incident, using Slack or Pager Duty.
1. It is very likely that Ops Bridge will try to contact you via [#topic-ops-bridge](https://link/to/ops/channel) about the incident if they have noticed a problem. They may also create their own incident.

> **_NOTE:_**  Ops Bridge might ask you for an update on the incident. It is reasonable to tell them that you are still investigating the problem and have yet to decide on a course of action. But update them as soon as you know how you plan to proceed.

1. Read the alert details in the Pager Duty app, Pager Duty website, or Slack.
1. Check in Slack on #comm-online whether there is already an ongoing incident being handled that could be the case of the alert.
   * If so, then join the conversation there or in the incident channel (if one has been created)
   * If not, then continue to step 5
1. Read the runbook and triage the issue.
   * If the issue doesn't require a Major Incident (MI) or immediate action, follow the steps [for a non-major incident here](#steps-for-a-non-major-incident).
   * Otherwise, the incident must be escalated to a Major Incident. Follow the steps [for a Major Incident](#steps-for-a-major-incident).
1. If the incident(s) was caused by a deployment then you should update the incident(s) with the change that caused it:
   * Go to the incident and click on the "Related Records" tab.
   * Fill in the "Caused by Change" field with the change number e.g. CHG012345.

To call out Team A or report an incident that impacts application-3, see [Calling out Team A or reporting an incident that impacts application-3](#calling-out-team-a-or-reporting-an-incident-that-impacts-application-3).

---

### Steps for a Major Incident

> **_NOTE:_**  If you can quickly resolve an issue then it's not worth raising a Major Incident but make sure you are communicating with Ops Bridge on [#topic-ops-bridge](https://link/to/ops/channel). Ops Bridge may have already escalated the alert to a major issue.

1. Escalate to a major incident. This will assign a Major Incident Manager and start the communication process with the business.
   * Pager Duty app: open the incident and select 'Run a Play' from the settings menu on the top right, then 'Declare a Major Incident'.
   * [PagerDuty][https://link/to/pagerduty]: select 'Run a Play / Declare a Major Incident' at the top of the incident.
2. Contact Ops Bridge on [#topic-ops-bridge](https://link/to/channel) to let them know you have declared a Major Incident. Ops Bridge will create a Group Hangout and Slack channel for the Major Incident and should add you to them. All further discussion regarding the Major Incident should take place in the Group Hangout - but feel free to say you will be muting to investigate the problem.
3. Determine the cause of the problem using metrics, logs and any other means of gathering evidence. Determine what intervention, if any, is best. Present your information back to the Hangout or the Slack channel in the format:
   * `Summary of what we know about the problem:`
   * `Proposed intervention or alternative interventions:`
   * `Likelihood of resolution:`
   * `Level of risk involved in proposed intervention:`
   * `Estimate of time to resolve:` (to save being asked repeatedly)
4. Carry out the agreed intervention and monitor its effect. You will need to raise an emergency change to cover the change but the MI manager may raise it for you and it's OK to raise it the following day. Ideally, when you make a change, use the normal [release process][releasing].
5. All being well, use Pager Duty or Slack to resolve the incident. Fill out the resolution notes carefully because they can be very useful in the major incident review.
6. Update [#team-a](https://link/to/channel) with anything the team will need to know. For example, if you'll be asleep or there is work the team needs to carry out in the morning.

---

### Steps for a non-major incident

1. Change the incident priority to a P3 - even if the incident resolves itself, to prevent follow-up communications
2. Add a note to the incident to explain the situation.
3. Update #team-a with anything the team will need to know.
4. Deal with the problem in the morning/next business day.

---

### Calling out Team A or reporting an incident that impacts application-3

If the application-3 service is impacted for any reason there must be an incident in ITIL_TOOL_OF_EVIL. If no alert has automatically raised an incident, raise one against the application-3 service yourself. If you need to call out Team A for any other problem, you should also raise an incident.

Use Pager Duty to raise the incident, as follows:

* Pager Duty app: Use the settings menu on the top right of the home screen and select 'New Incident...'. Fill in the service as 'application 3', enter a name and description and set the priority appropriately (likely P2).
* [PagerDuty][https://link/to/pagerduty]: Use the green 'New Incident' button in the top right of the home screen. Fill in the service as 'application-3', enter a name and description and set the priority appropriately (likely P2).

This creates the incident in Service Now with the details below:

| Field                         | Value                          |
| ----------------------------- | ------------------------------ |
| Configuration Item (CI Group) | `CI_FOR_APPLICATION_3_SERVICE` |
| Assignee Group                | `NAME_OF_TEAM`                 |

The Pager Duty incident will contain a link to the incident.

### Resolving or downgrading an incident

Once service is restored, you can resolve the incident. If the service is restored before you can react to it, resolve it.

After the incident has been resolved reduce the PagerDuty priority to P5 and the respective incident to a Priority 5 as well (Set Impact = Low, Urgency = Low).

### Raising a data issue incident

If there is an issue being caused by a data problem, contact #team-y to get them to raise an incident and resolve the problem.

### Contacting incident managers

During the day, contact the incident management team on their Slack channel, `#team-incident-management`. During the night, they may not see messages in this channel, so you should raise a major incident to contact them. When they are responding to a major incident, they do monitor this channel, even during the night.

[PagerDuty]: https://link/to/pagerduty
[releasing]: /application-3/processes/build-and-deployment/

### Duty Managers

For assistance with escalation, general advice or just if-all-else-fails:

* Office hours (09:00-17:30) - #team-online-dm
* Out of hours (17:30 - 09:00) - request Online Duty Manager callout via #topic-ops-bridge
