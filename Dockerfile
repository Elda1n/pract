# Базовий образ
FROM python:3.11-slim

# Встановлення робочої директорії
WORKDIR /app

# Копіювання залежностей і встановлення їх
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіювання коду проєкту
COPY . .

# Відкриття порту
EXPOSE 5000

# Команда запуску
CMD ["python", "app.py"]
