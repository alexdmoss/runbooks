# runbooks

A template site for hosting service runbooks, using a modified version of the [Hugo Learn Theme](https://themes.gohugo.io/themes/hugo-theme-learn/) which is itself based on [Netlify's Grav Learn Theme](http://learn.getgrav.org/).

---

## Installation

Most things are handled via CI, but the domain registration requires a bit of manual _(I think, I've never looked too closely at automating this)_ site verification. This is straight-forward - the required TXT record is set for `alexos.dev`, verified [here](https://www.google.com/webmasters/verification/verification?domain=alexos.dev) to allow this command to succeed: `gcloud app domain-mappings create runbooks.alexos.dev`.

## Things To Customise

- Stuff in `./content/` is where your main content goes, of course. It can also be used to override things like your favicon, logo, etc.
- Google Analytics Tag (if you wish!): `./src/themes/runbooks/layouts/partials/custom-footer.html`

## To Do

- [x] Strip out unnecessary features / streamline
- [x] Get it up and running somewhere
- [ ] Grab some content from work runbooks and redact
- [ ] Page to showcase features - and update Theme README to link to these
  - [ ] Markdown
  - [ ] Nested nav
  - [ ] Image options
  - [ ] git snippets
  - [ ] screen cap
  - [ ] Mermaid
- [ ] Dark mode switching needs a look - base on Principles site instead
- [ ] All the CSS files ...
- [ ] Simplify some of the things to customise so all in one place - e.g. Slack Channel link
