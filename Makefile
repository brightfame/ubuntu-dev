.PHONY: build run

build:
		docker build . -t brightfame/ubuntu-dev:16.04

run:
	 	docker run -ti -p 8080:8080 -p 50000:50000 robmorgan/jenkins2
