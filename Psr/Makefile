libpsr-log.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Psr libpsr-log

libpsr-log:
	bpc -v \
		-c bpc.conf  \
		-l psr-log \
		--input-file src.list

install-libpsr-log:
	cd Psr && bpc -l psr-log --install
