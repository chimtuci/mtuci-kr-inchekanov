# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл с зависимостями в контейнер
COPY requirements.txt requirements.txt

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем файлы приложения в контейнер
COPY . .

# Устанавливаем переменную окружения для работы Flask
ENV FLASK_APP=server.py

# Указываем команду для запуска сервера Flask
CMD ["flask", "run", "--host=0.0.0.0", "--port=8050"]
