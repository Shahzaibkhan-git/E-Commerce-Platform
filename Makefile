.PHONY: up down logs ps rebuild check clean

PYTHON ?= $(if $(wildcard .venv/bin/python),$(CURDIR)/.venv/bin/python,python3)

up:
	docker compose up --build

down:
	docker compose down

logs:
	docker compose logs -f

ps:
	docker compose ps

rebuild:
	docker compose down
	docker compose up --build

check:
	docker compose config > /dev/null
	@echo "docker compose config: ok"
	for svc in user catalog cart order payment notification; do \
	  echo "=== $$svc-service ==="; \
	  (cd services/$$svc-service && $(PYTHON) manage.py check); \
	done

clean:
	docker compose down -v
