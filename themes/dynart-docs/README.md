# Dynart Docs

The **gopherlab** theme on the backgrounds of **docs.dynart.net**. Everything but the surfaces and
the header is gopherlab's - the layout, the type, the ink, the templates - so what is written below
about those is gopherlab's README, and holds here unchanged.

The surfaces are the Sphinx site's: its `_static/custom.css` over Read the Docs. The header shows
the Dynart logo alone: it is a wordmark, so the site's name is its alt text rather than a title
beside it. Without a logo the name is written out, as in gopherlab.

```
theme.ini                    five places: main, social, sidebar, home_top, footer
assets/style.css             the whole design, served at /assets/theme/style.css
dpress/layout.phtml          the reading column - a post, a page, an archive, the account screens
dpress/layout-home.phtml     the front page: the same columns plus the featured strip
dpress/content/list.phtml    the front page and the archives
dpress/content/single.phtml  a post
dpress/content/page.phtml    a page
partial/head.phtml           what both layouts share above the fold
partial/header.phtml         the brand, the social place, the menu bar
partial/footer.phtml         three columns of the footer place, then the small print
```

## The palette

Backgrounds from docs.dynart.net, ink from gopherlab.

| | | |
|---|---|---|
| page | `#1e1c1c` | a shade under the bars, so the bands still read as bands |
| bars | `#242121` | header, menu, footer - the docs site's navigation colour |
| content area | `#2d2a2a` | the docs site's content colour |
| borders | `#3d3939`, `#888` | frames, and the rule under a widget title - `#888` is the docs site's `<hr>` |
| callouts | blue, orange, red at a fifth | the docs site's admonitions, with gopherlab's cyan, orange and red text |
| button hover | `#00d8ff` | the logo's cyan |
| text | `#e2d9d9` | and `#7d7d7d` for meta - gopherlab's |
| headings | `#ffb86c` | Dracula orange - gopherlab's |
| links | `#fff600`, hover `#fffbc4` | the logo's yellow, and white-yellow under the pointer - what is left of them: the sidebar's other blocks, the footer |
| links in the text | `#ffb86c`, hover `#fffbc4` | the headings' orange, underlined |
| navigation links | `#fff`, hover `#fff600` | the menu, the documentation tree, the breadcrumb, previous / next |
| widget titles | `#fff600` | the logo's yellow, uppercase |

The logo is drawn 473px wide - 132px high - where gopherlab draws its square mark 84px wide; on a narrower screen it shrinks, proportions kept.
Code blocks follow the site's Code highlighting setting, not the theme - this site uses Monokai.

**The site is a box.** `--container` (1280px) caps the header, the menu bar, the content area and
the footer alike, all centred — so on a wide screen the page colour shows down both sides and
every band ends on the same edge. The bars are capped rather than bleeding to the viewport: a
full-width bar over a boxed body is the shape this design is not. Inside the box the inset is
`--pad` (32px, 16px on a phone) as padding, so one value decides how wide the site is.

**Nothing has a rounded corner.** `--radius` is `0` and is the only place that decides, so putting
the softness back is one line. The chrome carries no rules either — a bar meeting the content area
is the whole separation.

The menu marks a hover with a **1px rule above the item**, not with a panel behind it; the border
is there and transparent to begin with, so nothing shifts when it appears. A menu item with
children opens a dropdown on hover **and on `:focus-within`**, which is what makes a CSS-only menu
reachable from the keyboard.

Type: **Inter** for the body at 16px/1.5 and 17px/1.7 in an article, **Roboto Condensed** 700 for
every heading — but **not** the site's name or the menu bar, both of which take the body face, as
they do in the original. Both read correctly by accident while Roboto Condensed was not loading
and the headings stack fell through to the system UI face.

So `--display` is for: headings in content, the entry title, a table header, and the widget titles
in the sidebar and footer. Everything else is `--font`.

Roboto Condensed is **self-hosted**, two variable files covering 100–900 so every heading weight
comes out of one download. They sit in `assets/` and are served from the same URL as the
stylesheet, which is why a bare `url(roboto-condensed-latin.woff2)` resolves. `latin-ext` carries
the Hungarian ő and ű and has its own `unicode-range`, so a page without them never asks for that
file.

**No flash of the fallback face.** Two things together: the fonts are `<link rel="preload">`ed in
the head, so they start downloading with the stylesheet rather than after it has been parsed and
something has finally needed one; and `font-display` is **`optional`** rather than `swap` —
`swap` is what paints in the fallback and changes it a moment later. `optional` gives the font
about 100ms and then commits for the whole page load, so nothing ever moves. The trade is that a
genuinely slow first visit renders headings in the fallback for that page; after it, the font is
cached for a year and always wins.

Two details in the preload that look like noise and are not. `crossorigin` is required even
though the file is on this very origin, because a font is always fetched in CORS mode and a
preload without it is a second, unusable download. And the preload URL carries **no `?v=`** —
`$theme->url($file, false)` — because the `url()` inside the stylesheet has none either, and two
spellings of one file is two downloads with the preload matching neither.

Inter is not shipped — the body falls back to the system UI face. It is the same two `@font-face`
blocks whenever it is wanted.

**Bump `version` in `theme.ini` after editing the stylesheet.** Assets are served
`immutable, max-age=1y` and the version is the whole cache buster, so without a bump a browser
that has the old file keeps it.

## The two layouts

`layout-home.phtml` is the front page and `layout.phtml` is everything else. They share the same
two columns — 70.3125% / 29.6875% from 768px, the original's proportions — and differ in one
thing: the front page has the **featured strip** on top of them.

The strip is markup no other page has, which is what makes this two files rather than one file
with an `if` in it. `content/list.phtml` fills a `featured` block and the home layout prints it
above the columns, because the strip is wider than the column the content is in.

Its split is **60/40, deliberately not the 70/30 of the columns under it**: the large card is a
picture and wants less width than a column of prose, and the four small ones want more than a
sidebar. Their text still lands on the sidebar's left edge — the thumbnails sit out to the left
of it, which is what the original does.

The surface is worth knowing: `#282a36` is on the **whole content area**, not on the article. So a
post is text on the page it belongs to rather than a card floating on a background, and a listing
sits on the same surface as the sidebar beside it.

**A category or a tag reads like a post**, which is a decision expressed by *not* writing
`layout-archive.phtml`: with no file for that kind, the resolution falls back to `layout.phtml`.

## The places

| Place | Drawn by | For |
|---|---|---|
| `main` | both, in the bar under the header | the site's menu |
| `social` | both, in the header | a menu of GitHub / YouTube / X links, **drawn as marks** |
| `sidebar` | both | recent posts, categories, a Ko-fi block |
| `home_top` | **the front page only** | anything that belongs there and nowhere else |
| `footer` | both, in three columns above the copyright bar | categories, support, whatever else |

`home_top` is the point worth knowing: a place only one layout renders is a place that only
appears there. No visibility rule, nothing to configure.

The original's footer is a single copyright bar — its theme has a widget area and the site leaves
it empty. Here the three columns render only when the `footer` place has something in it, so an
empty place gives you the original's bar exactly.

## The social icons

`dpress/menu.phtml` overrides the CMS's, and for the `social` place only it swaps the label for a
mark. **The URL decides**, not a field on the item: an external-address item pointing at
`github.com` gets the GitHub mark, and `www.` or a subdomain still matches. A host it does not
know keeps its label, so adding a Mastodon link is not a broken header — it is a text link until
somebody adds a path for it, in the one array at the top of that template.

The label lives on as `aria-label` and `title`, because a mark says nothing to a screen reader.
The paths use `fill="currentColor"`, so an icon takes the colour of the link it sits in and the
hover state costs no second rule.

Icons are Font Awesome Free (CC BY 4.0) — the same marks the original site serves.

## Featured posts

Tag a post `featured` and it goes to the top of the front page — one large card and up to four
small ones — and is left out of the list below, because pinned *and* repeated four rows down reads
as a bug. The tag is the `featured_tag` setting, so it can be renamed or emptied.

Below 1025px the four small cards are hidden and the large one stands alone, which is what the
original does.

**A featured post need not have a picture.** The large card puts its title *over* the image, so
with no image it puts it in a panel of its own instead — `has-image` on the card decides which,
and without it an absolutely positioned overlay would leave a card with no height, which is a post
that has silently vanished from the front page. The same for the small cards: no picture, no
thumbnail column.

A post whose picture is in the **media bin** counts as having none. `MediaService::findByIds()`
skips soft-deleted items, the same rule the site logo follows — something somebody put in the bin
should leave the page rather than wait for a purge. Restore it from the media screen and the card
takes its picture back.

## The list of posts

A card is the picture and the words in **two columns, 40% and the rest**, above 1025px; below
that the picture sits on top. A post with no picture gives the words the whole width rather
than an empty column — `has-image` on the card decides, the same way the featured cards do.

**The lead is cut off by the stylesheet, not by the server.** Four lines, and the browser writes
the `…` itself at the exact point the text stops fitting, which no server-side count of
characters can do — a line of prose is not a fixed number of them. Two reasons it has to be the
stylesheet: `lead_html` is HTML, so counting through it would take a tag off mid-word; and a post
written with **no `---` separator is all lead**, so without a limit the front page prints whole
articles. To show more or less of each post, change `-webkit-line-clamp` on `.post-lead`.

**Read more is always there**, whether or not the lead was cut. Somebody who has read the whole
lead still needs the way in, and it is not obvious to everybody that the title is a link. It
carries the post title in an `.sr-only` span, because a page of links that all read "Read more"
tells a screen reader nothing about where any of them goes.

> The original does this the other way round — WordPress cuts the excerpt at a word count and
> puts *Read more* inline after the `…`, and shows neither when the excerpt was short enough.

## Signing in and out

The header shows the account name and **Log out** when somebody is signed in, and *Log in* (plus
*Register*, when registration is open) when nobody is. The logout is a `<form method="post">` and
not a link, because `/logout` is POST only: a link that ends a session can be followed by a
prefetcher, a crawler, or an `<img>` somebody planted on another page, and the visitor is simply
signed out. It is styled to read as a link so the header does not gain a button.

## A picture beside a list

A paragraph holding **nothing but an image**, immediately followed by a list, floats the image and
runs the list beside it — an avatar and a row of contact links, which is what the About page is.

```markdown
![avatar](media#48)

- [{{ icon('github', style='brands') }} GitHub](https://github.com/goph-R)
- [{{ icon('twitch', style='brands') }} Twitch](https://www.twitch.tv/g0phr)
```

The shape *is* the selector — `p:has(> img:only-child):has(+ ul)` — because markdown cannot put a
class on anything, so the only handle a stylesheet gets is the structure the author wrote. It is a
layout rather than a table on purpose: a table would be announced as one to a screen reader and,
with `overflow-x: auto`, would scroll sideways on a phone. This stacks below 700px instead.

That list loses its bullets, gets a 1em indent of its own and no margin — it is a list for the
sake of being a list of things, not one somebody is counting through. Those three are outside
the media query, because they are what the list *is* rather than how it sits beside the
picture.

The cost is a false positive: a post where a lone image happens to be followed by a bullet list
would float too. Nothing on the site does today.

## Icons

Font Awesome Free 6.7.2 is in `assets/`, **repacked**: the asset route serves a flat folder, so the
stylesheet's `../webfonts/` paths are bare file names, and the `.ttf` fallbacks are gone because
every browser that runs this site reads woff2. Nothing else is changed, and the licence banner is
where Font Awesome put it (icons CC BY 4.0, fonts SIL OFL 1.1, code MIT).

```
assets/fontawesome.css            73 KB
assets/fa-solid-900.woff2        155 KB   the main set
assets/fa-brands-400.woff2       116 KB   github, youtube, x, rust
assets/fa-regular-400.woff2       25 KB   the outline variants
assets/fa-v4compatibility.woff2    5 KB   only for FA4 class names
```

A font is downloaded when a rule uses it, so a page with two brand icons on it fetches
`fa-brands-400` and nothing else. `head.phtml` links the stylesheet only when the file is there,
so removing these five files leaves a working theme rather than a page of 404s.

In a template: `<i class="fa-brands fa-github"></i>`. In a post, page or block:
`{{ icon('github', style='brands') }}` — raw HTML in markdown is stripped, so the shortcode is the
way in. See `docs/shortcodes.md` §8.

**To upgrade**, re-pack rather than hand-edit: take `css/all.min.css` and the four `webfonts/*.woff2`
from the release, drop the `,url(…ttf) format("truetype")` from each `src`, and rewrite
`url(../webfonts/` to `url(`.

## Post links

`route_url($post_path.$post['slug'])`, never `route_url('/post/'.…)`. Where a post lives is the
`post_path` setting — `/post/the-slug` or `/the-slug` — and `$post_path` is the prefix, handed to
every template. Hardcoding the old shape still works, because the other one answers with a 301; it
just makes every link on the page a redirect.

## Previews

`content/single.phtml` and `content/page.phtml` each begin with one line that draws the CMS's
preview bar. The editor's **Preview** button renders the unsaved boxes through this theme, so
without that line a preview would look exactly like the live page — a good way to publish
something by accident. It draws nothing on a normal page view.

## What the original has and this does not

Honest list, so nothing is a surprise later:

- **Comments**, and the comment count on a card. That is the Disqus plugin — see
  `docs/comments.md` in dpress.
- **Post navigation** — the previous/next post links under an article. There is no query for the
  adjacent post yet.
- **Search**, which the original has in its menu bar.
- The author bio box and the featured image on a single post are **deliberately** absent — the
  original hides both in its own custom CSS.
