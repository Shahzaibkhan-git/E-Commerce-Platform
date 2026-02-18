# Services Layout

Each folder in `services/` is an independent Django microservice.

## Current Services

- `user-service`
- `catalog-service`
- `cart-service`
- `order-service`
- `payment-service`
- `notification-service`

## Per-Service Standard Structure

Each service should keep this layout:

```text
<service>-service/
  manage.py
  requirements.txt
  Dockerfile
  core/
    views.py
    urls.py
    models.py
    tasks.py
  <service>_service/
    settings.py
    urls.py
    celery.py
    __init__.py
```

This keeps every service self-contained for local development and container builds.
