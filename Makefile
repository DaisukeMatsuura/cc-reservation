up:
	docker compose up -d
build:
	docker compose build --no-cache --force-rm
stop:
	docker compose stop
down:
	docker compose down --remove-orphans
destroy:
	docker compose down --rmi all --volumes --remove-orphans
web:
	docker compose exec web ash
app:
	docker compose exec app bash
db:
	docker compose exec db bash
migrate:
	docker compose exec app php artisan migrate
fresh:
	docker compose exec app php artisan migrate:fresh --seed
seed:
	docker compose exec app php artisan db:seed
restart:
	@make down
	@make up
setup-first:
	cp .env.example .env
	docker compose up -d --build
	docker compose exec app composer install
	docker compose exec app cp .env.example .env
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan storage:link
	docker compose exec app chmod -R 777 storage bootstrap/cache
	@make fresh