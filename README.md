# [My blog](https://csabapalfi.github.io)

Built with [Jekyll](http://jekyllrb.com/) and posts are written using [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/).

## Deployment

Served by [Github Pages](https://pages.github.com/) and automatically built and deployed when commits are pushed to GitHub. Github also takes care of SSL when using their github.io domain.

## CSS

Styles are written in [Sass](http://sass-lang.com/) and given their small size they're embedded on all pages. Social icons (in SVG) are from [iconmonstr](http://iconmonstr.com/) and optimized with [svgo](https://github.com/svg/svgo).

## DNS

Redirects (from my older domains) are implemented using AWS [S3](https://aws.amazon.com/s3/) and [Route 53](https://aws.amazon.com/route53/). AWS resources are managed using [Terraform](https://terraform.io/).

## Local development

To make sure to have the exact same environment as github:

install rbenv
  * `brew install rbenv`
  * add `eval "$(rbenv init -)"` to your shell profile

use the same ruby version
```sh
RUBY_VERSION=$(curl https://raw.githubusercontent.com/github/pages-gem/master/.ruby-version)
rbenv install $RUBY_VERSION
rbenv local $RUBY_VERSION
```

install github pages gem

```
gem install github-pages
```
