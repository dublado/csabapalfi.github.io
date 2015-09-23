# My blog

Served by [Github Pages](https://pages.github.com/) and automatically built and deployed when commits are pushed GitHub.

Built with [Jekyll](http://jekyllrb.com/) and posts are written using [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/).

Styles are written in [Sass](http://sass-lang.com/) and given their small size they're embedded on all pages. Social icons (in SVG) are from [iconmonstr](http://iconmonstr.com/) and optimized with [svgo](https://github.com/svg/svgo).

Domain name registration and DNS hosting is handled by [AWS Route 53](https://aws.amazon.com/route53/). Naked domain redirects implemented using [AWS S3](https://aws.amazon.com/s3/). AWS resources are managed using an [AWS Cloudformation](https://aws.amazon.com/cloudformation/) template.

Easy local development was made possible by [Docker Compose](https://docs.docker.com/compose/) running the site in a container with sources mounted as a volume and automatic re-building on changes.
