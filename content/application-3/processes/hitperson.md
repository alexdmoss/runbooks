---
title: "Hitperson Duties and Processes"
menuTitle: "Hitperson Duties"
---

{{% notice tip %}}
Hitperson is the term we use for the engineer responding to queries during office hours. This helps other members of the team focus on other tasks without needing to keep an eye on the team's "front door" for requests for assistance (and operational response).
{{% /notice %}}

### Who?

All developers and QAs are on the rota, which is maintained in PagerDuty. See [schedule][PagerDuty Schedule].

### When?

08:00 to 18:00 Monday to Friday on a weekly rotating basis.

### What?

- Respond to any alerts, following the [callouts] process. You will receive a notification through PagerDuty, as well as in the [#svc-application-3] channel. Call on other team members as necessary for support.
- Act as the "front door" to the team Slack channel, [#team-a].
  - Respond with an emoji on the thread so other team members and the reporter know you're looking into it.
  - You might not know the answer, but you should perform the initial triage and bring in other team members as required.
- Monitor the [Key Overview Dashboard] throughout the day for any performance issues or unusual activity. In the morning, check back overnight.
- Check [#svc-application-3] in the morning for any failed jobs and act upon them as necessary.
- Monitor the team inbox application-3-service@yourdomain.com
  - Check throughout the week
  - Note any emails about delayed processes etc that might cause alerts or issues with processes on our side
  - File emails into the relevant month/year folder
- [Deploy our services][deploying] throughout the week, following this process. The Ready to deploy column has a WIP limit of 3. Don't let the column build up - aim to release daily if possible.

[#svc-application-3]: https://link/to/svc/channel
[#team-a]: https://link/to/team/channel
[Key Overview Dashboard]: https://link/to/dashboard
[PagerDuty Schedule]: https://link/to/pagerduty/schedule
[deploying]: /application-3/processes/build-and-deployment/
[callouts]: /application-3/processes/callouts/
