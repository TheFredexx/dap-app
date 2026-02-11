FROM python:3.12-slim

WORKDIR /app

# Instalar uv
RUN pip install uv

# Copiar metadatos y código
COPY pyproject.toml /app/
COPY src/ /app/src/

# Instalar dependencias del proyecto
RUN uv pip install --system .

EXPOSE 8000

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
