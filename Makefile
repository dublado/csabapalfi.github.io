start:
	jekyll serve --watch --detach
	rm -rf $(BOXEN_SOCKET_DIR)/blog
	socat UNIX-LISTEN:$(BOXEN_SOCKET_DIR)/blog,fork TCP:localhost:4000 &

stop:
	pgrep -f jekyll | xargs kill
	pgrep -f "socat.*/blog" | xargs kill

restart: stop start