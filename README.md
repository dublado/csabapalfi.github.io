
Built using [Jekyll](http://jekyllrb.com/).

Social icons (in SVG) from [iconmonstr](http://iconmonstr.com/) and optimized with [svgo](https://github.com/svg/svgo).

DNS name registration and hosting with AWS Route 53. Naked domain redirects implemented using AWS S3. Setup using AWS CloudFormation.

Site is built when pushing to gh-pages branch on GitHub and automatically deployed to [Github Pages](https://pages.github.com/).

Local development only requires Docker as the site can be built and served from a container. Docker Compose encapsulates the volume mount and port forwarding configuration.
