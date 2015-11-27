# [My blog](https://csabapalfi.github.io)

Built with [Jekyll](http://jekyllrb.com/) and posts are written using [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/).

## Deployment

Served by [Github Pages](https://pages.github.com/) and automatically built and deployed when commits are pushed to GitHub. Github also takes care of HTTPS when using their github.io domain.

## CSS

Styles are written in [Sass](http://sass-lang.com/) and given their small size they're embedded on all pages. Social icons (in SVG) are from [iconmonstr](http://iconmonstr.com/) and optimized with [svgo](https://github.com/svg/svgo).

## DNS

Domain redirects implemented using [AWS S3](https://aws.amazon.com/s3/). AWS resources are managed using an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template.

## Local development

Easy local development was made possible by [Docker Compose](https://docs.docker.com/compose/) running the site in a container with sources mounted as a volume and automatic re-building on changes.
