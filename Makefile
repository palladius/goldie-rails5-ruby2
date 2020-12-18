


run:
	bundle install
	rails server -b 0.0.0.0 -p 8080

routes:
	rails routes

docker-build:
	docker build -t gceregions

docker-run: docker-build

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

