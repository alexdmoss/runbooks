---
title: "Third Party Support"
menuTitle: "Third Party Support"
weight: 40
---

{{% notice tip %}}
It's important to include details on how to contact third party services that you depend on.
{{% /notice %}}

Third Party Thing hosts the clusters that provide our Very Important Service.

## Status Page

Status page can be found here: [https://link/to/status/](https://link/to/status/).

## Raising a Support Ticket

Third Party provide support here: [https://link/to/support](https://link/to/support).

Only designated people can raise a support ticket with Third Party. Currently, they are:

* List of people + email addresses here

To add/remove users from this list please contact Someone's Name.

> It may be appropriate to include more info here if not very intuitive - e.g. key account info to include, type of service to select from options, and perhaps screenshots to guide also

---

## What are the norms

* During normal trading periods each cluster will have 3 nodes as shown in the above screenshot. During Peak periods we may scale up to 6 nodes per cluster.
* Our CPU usage is relatively low and are usually around 30%.
* Latency is usually under 10ms.

## Things to watch out for

* If the CPU usage on any node goes above 80% we will start seeing significant impact on response times. If it goes above 90% it is very likely that we will be seing a significant number of requests timing out.
* In the Advanced dashboard there is a graph called "Cgroup CPU Performance" and it shows how much the Cgroup is throttling. If there is frequent throttling this could cause slowdowns or timeouts as well.

## Possible actions

There is only a few things we can do ourselves if there is an issue effecting the clusters.

* [Restart a cluster] -  If a node is showing high memory or CPU usage but not receiving more requests then it may be worth trying to restart the cluster.
* [Scale up the cluster]. - If a node is showing high CPU usage then you might want to consider scaling up the cluster. This will at least buy you some time to investigate what is causing the increase in CPU usage while reducing the impact of the increased load on the cluster.
* [Disable Leg] - If a region is not working properly you may also want to stop sending traffic to it. This won't cause it to create a new node so the respective leg will have less capacity.
* [Raise a support ticket] - in any case it is always useful to let Third Party Support know that something unusual has happened.

[Restart a cluster]: /application-3/processes/restart-third-party-service/
[Scale up the cluster]: /application-3/processes/scaling-third-party/
[Disable Leg]: /application-3/processes/disable-leg/
[Raise a support ticket]: /application-3/third-party-support/
