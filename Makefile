.PHONY: build lint

build:
		docker build . -t brightfame/ubuntu-dev:16.04

lint:
		hadolint Dockerfile
