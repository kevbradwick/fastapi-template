FROM python:3.10-slim

WORKDIR /app

RUN pip install --upgrade pip uvicorn poetry

COPY . .

RUN poetry export --without-hashes -f requirements.txt --output requirements.txt && \
  pip install -r requirements.txt

EXPOSE 80

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]