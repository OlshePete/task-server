# Используем официальный Node.js образ
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости (включая dev зависимости для сборки)
RUN npm ci

# Копируем исходный код
COPY . .

# Генерируем Prisma Client
RUN npx prisma generate --schema=./database/prisma/schema.prisma

# Собираем приложение
RUN npm run build

# Создаем директорию для базы данных с правильными правами
RUN mkdir -p /app/database/prisma/database && \
    chmod 755 /app/database/prisma/database

# Устанавливаем переменную окружения для базы данных
ENV DATABASE_URL="file:./database/prisma/database/task-server.db"

# Копируем скрипт инициализации
COPY scripts/docker-entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Открываем порт 3000
EXPOSE 3000

# Запускаем скрипт инициализации
CMD ["/app/entrypoint.sh"]
