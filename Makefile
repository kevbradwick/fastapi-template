app_name := app

.PHONY: fmt
fmt:
	poetry run autoflake --ignore-init-module-imports --remove-all-unused-imports --verbose --remove-unused-variables -r -i app/*
	poetry run isort .
	poetry run black .

.PHONY: runserver
runserver:
	poetry run uvicorn app.main:app --reload

.PHONY: docker-image
docker-image:
	docker build -t $(app_name):latest .