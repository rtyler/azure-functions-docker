
CONTAINER=rtyler/azure-functions:latest


all: Dockerfile
	docker build -t $(CONTAINER) .

push: all
	docker push $(CONTAINER)

.PHONY: all push
