from celery import shared_task


@shared_task
def ping_task(service_name: str) -> dict:
    return {"service": service_name, "status": "ok"}
