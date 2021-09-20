---
title: "Scaling Resources"
---

## Scaling Component Instances

To temporarily increase or decrease the capacity of a service, scale its pods in Kubernetes as follows:

```sh
kubectl scale --replicas=6 deployment/name-of-service -n=our-namespace
```

:warning: `microservice-A` and `microservice-B` can not be scaled using this method because they are using horizontal pod autoscaling (HPA) which manages the scaling.

> The next time the service is deployed, Gitlab CI will set the number of replicas in the new deployment to the value in the Gitlab CI configuration.

To make a permanent change, change the appropriate `REPLICAS` value in the Gilab CI configuration file, `<service's gitlab repo>/.gitlab-ci.yml`.

## Scaling for Live Load Test

We regularly run a Live load test that simulates traffic for a peak period. To make it easier to scale to the appropriate level we have created GitLab jobs that will do this. The jobs can be found [here](https://link/to/pipeline).

## Scaling CPU and RAM

Scaling the number of pods is our preferred means of scaling the capacity of our service. But there may be reasons for scaling the CPU and/or RAM available to each instance too.

To change the CPU or memory available to each container, edit the Kubernetes yaml configuration for that component. This lives in the corresponding source repository under `/kubernetes`.

For example:

```yaml
resources:
  requests:
    memory: "512Mi"
    cpu: "1000m"
  limits:
    memory: "1536Mi"
    cpu: "1000m"
```

Our JVM-based components (all of them, that is) adjust their heap usage depending on these container settings.
