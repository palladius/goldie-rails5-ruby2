
APPNAME = ror5-gceregions
VERSION = $(shell cat VERSION)
#SHELL := /bin/bash


run:
	bundle install
	rails server -b 0.0.0.0 -p 8080

.env:
	cp .env.dist .env
	echo "EDIT AWAY! It wont work unless you do!"
	exit 42

routes:
	rails routes

docker-build:
	docker build -t $(APPNAME):v$(VERSION) . -f Dockerfile.rails 

docker-run: docker-build
	docker run -p 8080:8080 -it $(APPNAME):v$(VERSION) make run
docker-run-bash: docker-build
	docker run -p 8080:8080 -it $(APPNAME):v$(VERSION) bash

docker-push-to-gcp: docker-build
	./tag-and-push.sh $(APPNAME) $(VERSION)

run-docker:
	@echo TODO with pure docker, lets use docker composer now.
	# See https://github.com/pacuna/rails5-docker-alpine
	docker-compose build
	#docker-compose run --rm web bin/rails db:create
	docker-compose run --rm web bin/rails db:migrate
	docker-compose up -d

install-from-scratch:
	rails new goldie-rails5-ruby2
	rails generate controller Welcome index about license
	rails generate scaffold GceRegion name:string address:string description:text is_active:boolean
	rails generate scaffold GceZone   name:string is_active:boolean GceRegion:references

