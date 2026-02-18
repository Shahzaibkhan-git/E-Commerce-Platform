# Scalable E-Commerce Platform (Django Microservices)

A Docker-based microservices e-commerce backend built with Django and Celery.

## Services

- `user-service`
- `catalog-service`
- `cart-service`
- `order-service`
- `payment-service`
- `notification-service`

## Infrastructure

- PostgreSQL (one DB per service)
- RabbitMQ (Celery broker)
- Redis (Celery result backend)
- Docker Compose for local orchestration

## Current Status

### Done

- Microservice folders created for all 6 services.
- Django project scaffold created in each service.
- Health endpoint (`/health/`) available in each service.
- Celery configured in each service (`celery.py`, tasks, worker containers).
- Docker Compose wiring completed (apps + workers + DBs + Redis + RabbitMQ).
- Service-level Dockerfiles added for all services.
- Environment-based settings added with `USE_SQLITE` toggle.
- CI workflow added (`.github/workflows/ci.yml`).
- Repository structure/docs prepared (`docs/`, `gateway/`, `infra/`, `services/README.md`).

### Pending

- Implement business APIs:
  - user auth/profile
  - catalog CRUD/listing
  - cart operations
  - order lifecycle
  - payment processing
  - notifications
- Add serializers, permissions, and request validation.
- Add integration tests for end-to-end checkout flow.
- Add API gateway routing config (NGINX/Traefik).
- Add observability stack (metrics/log dashboards) and deployment manifests.

## Repository Structure

```text
services/                # All Django microservices (each with own Dockerfile)
infra/                   # Shared infra notes/assets
docs/                    # Documentation
gateway/                 # API gateway configs (to be added)
.github/workflows/       # CI workflows
docker-compose.yml       # Local orchestration
```

## Quick Start

1. Copy env template:

```bash
cp .env.example .env
```

2. Build and run:

```bash
docker compose up --build
```

Or with make:

```bash
make up
```

3. Verify health endpoints:

- `http://localhost:8001/health/`
- `http://localhost:8002/health/`
- `http://localhost:8003/health/`
- `http://localhost:8004/health/`
- `http://localhost:8005/health/`
- `http://localhost:8006/health/`

4. RabbitMQ management UI:

- `http://localhost:15673` (guest/guest)

## Celery Test (Example)

```bash
docker compose exec user-service python manage.py shell -c "from core.tasks import ping_task; r=ping_task.delay('user-service'); print(r.get(timeout=10))"
```

## Local DB Mode

- `USE_SQLITE=True` in `.env` for quick local SQLite mode.
- `USE_SQLITE=False` for PostgreSQL mode (recommended for Docker/microservices).

## Useful Commands

```bash
make ps
make logs
make check
make down
```
