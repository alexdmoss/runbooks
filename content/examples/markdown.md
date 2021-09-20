---
title: Markdown Syntax
---

{{% notice note %}}
Tweaked after copying from https://learn.netlify.com/en/cont/markdown/ which is itself taken from http://learn.getgrav.org/content/markdown.
{{% /notice %}}

See Table of Contents (next to the breadcrumb navigation at the top) to jump to the relevant section.

---

## Why Markdown?

Basically, it's quick and simple to write, using simple syntax that is easily converted into something that's straight-forward to read and navigate. It also becomes straight-forward to store, compare and change over time.

In comparison to something like authoring in HTML, some of the key benefits are:

1. Markdown is simple to learn, with minimal extra characters so it's also quicker to write content.
2. There are less chance of errors when writing in markdown due to the simple syntax.
3. It keeps the content and the visual display separate, so you cannot mess up the look of your site.
4. You can write in any text editor or Markdown application you like.

This site uses Hugo to render, which in recent versions uses the [Goldmark](https://github.com/yuin/goldmark) renderer.

---

{{% notice tip %}}
What follows are examples of how the most common markdown syntax is styled by this site, so you can more easily select/copy what you need
{{% /notice %}}

---

## Headings

Headings from `h1` through `h5` are constructed with a `#` for each level:

```markdown
# h1 Heading
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
```

Renders to:

# h1 Heading

## h2 Heading

### h3 Heading

#### h4 Heading

##### h5 Heading

---

## Body Copy

Body copy written as normal, plain text will be wrapped with `<p></p>` tags in the rendered HTML.

So this body copy:

```markdown
Lorem ipsum dolor sit amet, graecis denique ei vel, at duo primis mandamus. Et legere ocurreret pri, animal tacimates complectitur ad cum. Cu eum inermis inimicus efficiendi. Labore officiis his ex, soluta officiis concludaturque ei qui, vide sensibus vim ad.
```

renders to this:

Lorem ipsum dolor sit amet, graecis denique ei vel, at duo primis mandamus. Et legere ocurreret pri, animal tacimates complectitur ad cum. Cu eum inermis inimicus efficiendi. Labore officiis his ex, soluta officiis concludaturque ei qui, vide sensibus vim ad.

### Bold

For emphasizing a snippet of text with a heavier font-weight - the following snippet of text is **rendered as bold text**.

```markdown
**rendered as bold text**
```

renders to:

**rendered as bold text**

### Italics

For emphasizing a snippet of text with italics.

The following snippet of text is _rendered as italicized text_.

```markdown
_rendered as italicized text_
```

renders to:

_rendered as italicized text_

### Strikethrough

In markdown you can also do strikethroughs.

```markdown
~~Strike through this text.~~
```

Which renders to:

~~Strike through this text.~~

### Horizontal Rules

The HTML `<hr>` element is for creating a "thematic break" between paragraph-level elements. In markdown, you can create a `<hr>` with `---` on its own line, as follows:

---

The use of `___` and `***` are also supported, but `---` is the convention.

### Blockquotes

For quoting blocks of content from another source within your document.

Add `>` before any text you want to quote.

```markdown
> **Fusion Drive** combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.
```

Renders to:

> **Fusion Drive** combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.

Blockquotes can also be nested:

```markdown
> Donec massa lacus, ultricies a ullamcorper in, fermentum sed augue. Nunc augue augue, aliquam non hendrerit ac, commodo vel nisi.
>
> > Sed adipiscing elit vitae augue consectetur a gravida nunc vehicula. Donec auctor odio non est accumsan facilisis. Aliquam id turpis in dolor tincidunt mollis ac eu diam.
>
> Mauris sit amet ligula egestas, feugiat metus tincidunt, luctus libero. Donec congue finibus tempor. Vestibulum aliquet sollicitudin erat, ut aliquet purus posuere luctus.
```

Renders to:

> Donec massa lacus, ultricies a ullamcorper in, fermentum sed augue. Nunc augue augue, aliquam non hendrerit ac, commodo vel nisi.
>
> > Sed adipiscing elit vitae augue consectetur a gravida nunc vehicula. Donec auctor odio non est accumsan facilisis. Aliquam id turpis in dolor tincidunt mollis ac eu diam.
>
> Mauris sit amet ligula egestas, feugiat metus tincidunt, luctus libero. Donec congue finibus tempor. Vestibulum aliquet sollicitudin erat, ut aliquet purus posuere luctus.

### Lists

#### Unordered

A list of items in which the order of the items does not explicitly matter.

You may use any of the following symbols to denote bullets for each list item:

```markdown
* valid bullet
- valid bullet
+ valid bullet
```

For example

```markdown
- Lorem ipsum dolor sit amet
- Consectetur adipiscing elit
- Integer molestie lorem at massa
- Facilisis in pretium nisl aliquet
- Nulla volutpat aliquam velit
  - Phasellus iaculis neque
  - Purus sodales ultricies
  - Vestibulum laoreet porttitor sem
  - Ac tristique libero volutpat at
- Faucibus porta lacus fringilla vel
- Aenean sit amet erat nunc
- Eget porttitor lorem
```

Renders to:

- Lorem ipsum dolor sit amet
- Consectetur adipiscing elit
- Integer molestie lorem at massa
- Facilisis in pretium nisl aliquet
- Nulla volutpat aliquam velit
  - Phasellus iaculis neque
  - Purus sodales ultricies
  - Vestibulum laoreet porttitor sem
  - Ac tristique libero volutpat at
- Faucibus porta lacus fringilla vel
- Aenean sit amet erat nunc
- Eget porttitor lorem

#### Ordered

A list of items in which the order of items does explicitly matter.

```markdown
1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa
4. Facilisis in pretium nisl aliquet
5. Nulla volutpat aliquam velit
6. Faucibus porta lacus fringilla vel
7. Aenean sit amet erat nunc
8. Eget porttitor lorem
```

Renders to:

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa
4. Facilisis in pretium nisl aliquet
5. Nulla volutpat aliquam velit
6. Faucibus porta lacus fringilla vel
7. Aenean sit amet erat nunc
8. Eget porttitor lorem

{{% notice tip %}}
If you just use `1.` for each number, Markdown will still automatically number each item
{{% /notice %}}

---

## Code

### Inline code

Wrap inline snippets of code with `` ` ``.

```markdown
In this example, `<section></section>` should be wrapped as **code**.
```

Renders to:

In this example, `<section></section>` should be wrapped with **code**.

The "copy to clipboard" icon will automatically appear when the snippet is above a certain number of characters.

### Indented code

Or indent several lines of code by at least four spaces, as in:

<pre>
    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code
</pre>

Renders to:

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code

### Block code "fences"

Use "fences"  ```` ``` ```` to block in multiple lines of code.

<pre>
```
Sample text here...
```
</pre>

```txt
Sample text here...
```

### Syntax highlighting

GFM, or "GitHub Flavored Markdown" also supports syntax highlighting - and this is built into the theme too using the highlight.js package. To activate it, simply add the file extension of the language you want to use directly after the first code "fence", e.g. ` ```js `, and syntax highlighting will automatically be applied in the rendered HTML. For example, to apply syntax highlighting to JavaScript code:

<pre>
```js
grunt.initConfig({
  assemble: {
    options: {
      assets: 'docs/assets',
      data: 'src/data/*.{json,yml}',
      helpers: 'src/custom-helpers.js',
      partials: ['src/partials/**/*.{hbs,md}']
    },
    pages: {
      options: {
        layout: 'default.hbs'
      },
      files: {
        './': ['src/templates/pages/index.hbs']
      }
    }
  }
};
```
</pre>

Renders to:

```js
grunt.initConfig({
  assemble: {
    options: {
      assets: 'docs/assets',
      data: 'src/data/*.{json,yml}',
      helpers: 'src/custom-helpers.js',
      partials: ['src/partials/**/*.{hbs,md}']
    },
    pages: {
      options: {
        layout: 'default.hbs'
      },
      files: {
        './': ['src/templates/pages/index.hbs']
      }
    }
  }
};
```

Most common languages should be supported - if not then there are options to replace the existing JS include with the ones you need, see [here](https://highlightjs.org/).

---

## Tables

Tables are created by adding pipes as dividers between each cell, and by adding a line of dashes (also separated by bars) beneath the header. Note that the pipes do not need to be vertically aligned.

```markdown
| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |
```

Renders to:

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

### Aligned text

Adding a colon on the right side of the dashes below any heading will right align text for that column.

```markdown
| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |
```

| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

---

## Links

### Basic link

```markdown
[Assemble](http://assemble.io)
```

Renders to (hover over the link, there is no tooltip):

[Assemble](http://assemble.io)

### Add a title

```markdown
[Upstage](https://github.com/upstage/ "Visit Upstage!")
```

Renders to (hover over the link, there should be a tooltip):

[Upstage](https://github.com/upstage/ "Visit Upstage!")

### Named Anchors

Named anchors enable you to jump to the specified anchor point on the same page. For example, each of these chapters:

```markdown
# Table of Contents
  * [Chapter 1](#chapter-1)
  * [Chapter 2](#chapter-2)
  * [Chapter 3](#chapter-3)
```

will jump to these sections:

```markdown
## Chapter 1 <a id="chapter-1"></a>
Content for chapter one.

## Chapter 2 <a id="chapter-2"></a>
Content for chapter one.

## Chapter 3 <a id="chapter-3"></a>
Content for chapter one.
```

---

## Comments

Comments should be HTML compatible and are invisible on the site when rendered.

```html
<!--
This is a comment
-->
```

You should see **nothing** below:

<!--
This is a comment
-->

---

## Images

Images have a similar syntax to links but include a preceding exclamation point.

```markdown
![Alt text](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")
```

![Alt text](https://octodex.github.com/images/stormtroopocat.jpg?width=30pc "The Stormtroopocat")

The title for the image is optional, just like normal links.

### Alternative usage: note images

Like links, Images also have a footnote style syntax

```markdown
![Alt text][id]
```

![Alt text][id]

With a reference later in the document defining the URL location:

```md
[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"
```

[id]: https://octodex.github.com/images/dojocat.jpg?width=30pc  "The Dojocat"

Note that this makes the image appear where its original reference was - even if these were placed at the top or the bottom of the file.

### Resizing image

Add HTTP parameters `width` and/or `height` to the link image to resize the image. Values are CSS values (default is `auto`).

```markdown
![Minion](https://octodex.github.com/images/minion.png?width=20pc)
```

![Minion](https://octodex.github.com/images/minion.png?width=20pc)

```markdown
![Minion](https://octodex.github.com/images/minion.png?height=50px)
```

![Minion](https://octodex.github.com/images/minion.png?height=50px)

```markdown
![Minion](https://octodex.github.com/images/minion.png?height=50px&width=200px)
```

![Minion](https://octodex.github.com/images/minion.png?height=50px&width=200px)

### Add CSS classes

Add a HTTP `classes` parameter to the link image to add CSS classes. `shadow`and `border` are available but you could define other ones.

```markdown
![stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg?classes=border,shadow)
```

![stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg?width=40pc&classes=border,shadow)
