# flora website

This is the business for building the flora website.

It is Elm.

## get started
- clone it
- `> npm install`  (takes a little while)
- `> elm-package install`  (irritatingly breaks without doing this by hand first)

## build
- everything:
  - `> gulp build`
- just the JS
  - `> gulp elm`
- just the CSS
  - `> gulp css`

Files generated from the build end up in `site/gen/{js, css}`.

The directory `site/` contains what's actually required to deploy the site,
at the moment this is just the generated code and an `index.html` which
embeds it.

To have a look, use `gulp serve` or the standard `elm-reactor` should work.
