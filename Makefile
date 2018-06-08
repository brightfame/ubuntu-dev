.PHONY: build run

build:
		docker build . -t brightfame/ubuntu-dev

run:
	 	docker run -ti -p 8080:8080 -p 50000:50000 robmorgan/jenkins2
