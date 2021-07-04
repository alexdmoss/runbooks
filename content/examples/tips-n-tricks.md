---
title: "Tips & Tricks"
---

## Ordering Sections

Use the `weight:` property to control the order of things - in `_index.md` this will affect the sections, in pages it will affect the order within the section.

If you prefer to order by page title instead, you can change the setting in `config.yaml` under `params:`.

---

## Useful Front Matter

```yaml
menuTitle:              # can override the sidemenu title. Very useful where your actual title is long and you want a shorter one to not wrap
disableToc: "false"     # turns off the Table of Contents up by the breadcrumbs at the top
hidden: false           # hides the page from the sidebar menu (but still creates it for linking to elsewhere)
enableGitInfo: true     # show last commit message, or not. Defaulted to on
```

In _index.md (i.e. a chapter/section page) - will ensure that the menu stays open on the left, always:

```yaml
alwaysopen: true
```

---

## Image Tricks

Add ?width=Npx and ?height=Npx on end of markdown, like so:

```md
![GCP](images/gcp.png?height=150px&classes=shadow)
```

Can also specify ?classes=border or ?classes=shadow (customise your CSS to add other options)

---

## Awesome Fonts & Icons

These are available - see here for free tier which can be used: https://fontawesome.com/icons?d=gallery&m=free

Syntax is e.g. `I <i class="fas fa-heart"></i> GCP` which gives ... I <i class="fas fa-heart"></i> GCP

---

## Shortcodes

See the ones built into the original theme [here](https://learn.netlify.com/en/shortcodes/). Additional ones are included within `./src/themes/runbooks/layouts/shortcodes/`.

### Notices

The notice shortcode is really useful for eye-catching callouts, like warnings. The syntax is as follows:

```md
{{%/* notice note */%}}
Notice goes here - and **markdown** is supported within
{{%/* /notice */%}}
```

There are a number of colours to choose from - replace `note` (blue) with `info` (orange), `tip` (green) or `warning` (red):

{{% notice note %}}
Note notice. Noiiiice!
{{% /notice %}}

{{% notice info %}}
Info notice. Inspirational!
{{% /notice %}}

{{% notice tip %}}
Tip notice. Tasty!
{{% /notice %}}

{{% notice warning %}}
Warning notice. Wowzer!
{{% /notice %}}

### Links to Child Pages

Good to include on chapter landing (`_index.md`) pages:

```md
{{%/* children */%}}
```

### Adding Buttons

This syntax will produce buttons:

```md
{{%/* button href="<url-to-link-to>" icon="fas fa-download" */%}}A Download Link with icon{{%/* /button */%}}
```

{{% button href="https://www.google.com/" icon="fas fa-download" %}}A Download Link{{% /button %}}

### Expand / Spoiler Tags

```md
{{%/*expand "Click to show Hidden Content" */%}}Here is some additional text hidden behind an expansion dropdown{{%/* /expand */%}}
```

{{% expand "Click to show Hidden Content" %}}
Here is some additional text hidden behind an expansion dropdown
{{% /expand %}}

---

## Flowcharts, Simple Diagrams, etc

It is possible to draw simple diagrams, like Flowcharts, Sequence Diagrams and good ol' GANTT charts if you desire, using the Mermaid plugin. Rather than reproduce the guide here, see this page for more detail on how: https://learn.netlify.com/en/shortcodes/mermaid/. 

Their first example to confirm it works is shown here:

```md
{{%/*mermaid align="left"*/%}}
graph LR;
    A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
{{%/* /mermaid */%}}
```

{{%mermaid align="left"%}}
graph LR;
    A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
{{% /mermaid %}}

---

## Emoji

Are enabled - use the syntax `:emoji-name:`, e.g. :smile: [Emoji Cheatsheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/).

## GitInfo

Will be added automatically for "default" documents, because enableGitInfo is set in config.yaml. the config for this is in the theme - `./src/themes./runbooks/layout/_default/single.html`
