build: clean
	jekyll build

clean:
	rm -rf _site

server: clean
	jekyll server --watch

install:
	gem install jeykll jekll-assets sass rdiscount

publish: build
	git push