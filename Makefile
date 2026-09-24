.PHONY: init up down ps logs ch clean

ENV_FILE := .env

init:  ## create shared network and .env
	@docker network inspect data-platform >/dev/null 2>&1 || docker network create data-platform
	@test -f .env || (cp .env.example .env && echo "Created .env - edit the secrets")
up:
	docker compose --env-file $(ENV_FILE) up -d
down:
	docker compose --env-file $(ENV_FILE) down
ps:
	docker compose --env-file $(ENV_FILE) ps
logs:  ## make logs s=clickhouse
	docker compose --env-file $(ENV_FILE) logs -f $(s)
ch:    ## open a ClickHouse SQL shell
	docker compose --env-file $(ENV_FILE) exec clickhouse sh -c 'clickhouse-client -u $$CLICKHOUSE_USER --password $$CLICKHOUSE_PASSWORD'
clean: ## stop AND delete all data
	docker compose down -v
