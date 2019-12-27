# user-defined overrides
USERNAME ?= particledecay
REPO ?= ansible-playbook

.PHONY: help
.DEFAULT_GOAL := help

APP_NAME = $(USERNAME)/$(REPO)

help: ## Show this help message
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: build push ## Build and push the container for this project

build: ## Build the container for this project
	@docker build -f Dockerfile -t $(APP_NAME) .

push: tag ## Push container image to Docker Hub
	@docker push $(APP_NAME):latest

tag: ## Tag an existing container appropriately
	@docker tag $(APP_NAME) $(APP_NAME):latest
