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

## Repository Structure

```text
services/                # All Django microservices
infra/docker/            # Shared Docker templates
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
