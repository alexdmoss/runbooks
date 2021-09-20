---
title: "Anticipated failure scenarios"
---

Last Updated: DD MMM 2021

This document gives information on things that could go wrong with Application-2 offering.

## General

This section covers scenarios which can occur to many of the aspects in the system. Please see [Upstream & Downstream Dependencies](/dependencies/) for details on the structure of the system. We define upstream/downstream this way: https://reflectoring.io/upstream-downstream/

### k8s/pods

Both the API and UI server run in pods within k8s. We could have issues related to the pod failing or some sort of k8s related issues. In this case, it is unlikely limited to us as we make use of the microservice template and we should reach out to the platform team for support.

### Networking related

We do not connect directly to our consumers, rather they connect to us through a variety of layers.

```txt
+--------------------+
|                    |
|      Consumer      |
|                    |
+----------+---------+
           |
           |
           |
           v
+----------+---------+
|                    |
|     Edge Thing     |
|                    |
+----------+---------+
           |
           |
           |
           v
+----------+---------+
|                    |
|       GCP LB       |
|                    |
+----------+---------+
           |
           |
           |
           v
+----------+---------+
|                    |
|        NGINX       |
|                    |
+----------+---------+
           |
           |
           v
+----------+---------------+
|                          |
|           Pods           |
|                          |
|  +--------------------+  |
|  |                    |  |
|  |      Traefik       |  |
|  |                    |  |
|  +----------+---------+  |
|             |            |
|             |            |
|             v            |
|  +----------+---------+  |
|  |                    |  |
|  |   API / UI Server  |  |
|  |                    |  |
|  +--------------------+  |
|                          |
+--------------------------+
```

When a request comes in, it hits Edge Thing which provides routing and DDoS protection. If we suspect an issue there, we can reach out to them at #team-x

It then goes to the Platform-provided load balancers which uses the [Google Load Balancer](https://cloud.google.com/load-balancing) + NGINX Ingress Controller to direct traffic to our pods. Each pod has a Treafik sidecar which filters requests to the API or UI Server. It is possible to check both Load Balancer information and Traefik and it is documented in [Diagnosing Network Issues](/networkdiags/).

### Resource starvation

Should the CPU or Memory of the pod run out, the pod can stop responding to requests. The best is to just bounce the boxes, which you can easily do with the `k` script in our [Ops Repo](https://link/to/repo).

## API

> It then goes on to describe various scenarios relating to dependencies, data issues, auth-n/auth-z failures, things specific to Mobile Apps or Email, and so on
