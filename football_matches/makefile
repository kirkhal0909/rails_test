start:
	docker-compose up -d

build:
	cp .example.env .env
	docker-compose up --build -d

stop:
	docker-compose down

db_init:
	docker-compose exec app rails db:create db:migrate db:seed

console:
	docker-compose exec app rails console

test:
	docker-compose exec -e "RAILS_ENV=test" app bundle exec rspec
