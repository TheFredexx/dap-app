FROM python:3.12-slim

WORKDIR /app

# Instalar uv
RUN pip install uv

# Copiar código
COPY src/ /app/src/

# Instalar dependencias necesarias con uv
RUN uv pip install --system fastapi uvicorn

EXPOSE 8000

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
