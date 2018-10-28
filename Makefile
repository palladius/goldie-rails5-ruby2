


run:
	bundle install
	rails server

run-docker:
	@echo TODO

install-from-scratch:
	rails new goldie-rails5-ruby2
	rails generate controller Welcome index about

