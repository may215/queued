PREFIX=/usr/local
BINDIR=${PREFIX}/bin

all: build/queued

build:
	mkdir build

build/queued: build $(wildcard queued.go queued/*.go)
	go get -d
	go build -o build/queued

clean:
	rm -rf build

install: build/queued
	install -m 755 -d ${BINDIR}
	install -m 755 build/queued ${BINDIR}/queued

uninstall:
	rm ${BINDIR}/queued

test:
	go get -d
	cd queued; go test

.PHONY: install uninstall clean all test