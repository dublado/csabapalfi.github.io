install:
	gem install github-pages

start: stop
	jekyll serve --watch

stop:
	pgrep -f jekyll | xargs kill
