install:
	gem install github-pages
	pip install cli53

dns:
	cli53 import palfi.me --file palfi.me.bind

debug: kill
	jekyll serve --watch

run: kill
	jekyll serve --detach

kill:
	pgrep -f jekyll | xargs kill

restart: stop start