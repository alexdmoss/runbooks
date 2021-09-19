---
title: "01. Runbook Master Template"
menuTitle: "Template: Runbook"
---

{{% notice note %}}
A default template to use with runbooks to help with consistency, as well as inspiration on what to include
{{% /notice %}}

---

## Confirm the Problem

### Dashboards

#### Dashboard X

Dashboard X shows blah blah and can be found [here](https://link/to/eg/grafana/dashboard-x).

#### Dashboard Y

Dashboard Y shows blah blah and can be found [here](https://link/to/eg/grafana/dashboard-y).

### Diagnostic Commands

#### Command X

```sh
some command to find X
```

#### Command Y

```sh
some command to validate Y is running
```

---

## Resolution Options

### Option X

Try updating X with the following commands:

```sh
some command to update X
```

### Option Y

e.g. If all other options have failed, put up the holding page and prepare for [DR](https://link/to/DR/plan).

---

## Notes

While diagnosing and fixing the incident/issue, you may want to make notes. We recommend doing that in your `<insert e.g. alert channel in Slack>` so they can be easily reviewed the next day for follow up actions.
