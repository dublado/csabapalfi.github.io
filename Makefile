install:
	gem install github-pages
	pip install cli53

dns:
	cli53 import palfi.me --file palfi.me.bind

start: kill
	jekyll serve --watch

start-detached: kill
	jekyll serve --detach

kill:
	pgrep -f jekyll | xargs kill

restart: stop start