---
title: "01. Runbook Master Template"
menuTitle: "Template: Runbook"
---

{{% notice note %}}
A default template to use with runbooks to help with consistency and inspiration on what to include
{{% /notice %}}

---

## Confirm the Problem

### Dashboards

#### Dashboard X

Dashboard X shows blah blah and can be found [here](www.some-dashboard1-link.com).

#### Dashboard Y

Dashboard Y shows blah blah and can be found [here](www.some-dashboard2-link.com).

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

e.g. If all other options have failed, put up the holding page and prepare for [DR](www.some-dr-plan-link.com).

---

## Notes

While diagnosing and fixing the incident/issue, you may want to make notes. We recommend doing that in your service or team slack channel so they can be easily reviewed the next day for follow up actions.
