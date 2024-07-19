NAME = omouren/external-var-dumper-viewer
VERSION = 2.0

.PHONY: all build release

all: build

build:
	docker build -t $(NAME):$(VERSION) .

release:
	docker push $(NAME):$(VERSION)

