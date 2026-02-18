# Project Structure

```text
E-Commerce-Platform/
  .github/workflows/          # CI
  docs/                       # Documentation
  gateway/                    # API gateway configs (next phase)
  infra/                      # Shared infra assets
  services/                   # All microservices
  docker-compose.yml          # Local orchestration
  .env.example                # Environment template
  README.md                   # Project overview
```

## Design Rule

- One service = one Django project + one database + one worker.
- No direct cross-database access between services.
- Inter-service async work should go through Celery broker queues.
