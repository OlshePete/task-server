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
    chmod 777 /app/database/prisma/database

# Устанавливаем переменную окружения для базы данных
ENV DATABASE_URL="file:./database/prisma/database/task-server.db"

# Открываем порт 3000
EXPOSE 3000

# Запускаем приложение с инициализацией базы данных
CMD ["sh", "-c", "mkdir -p /app/database/prisma/database && chmod 777 /app/database/prisma/database && npx prisma migrate deploy --schema=./database/prisma/schema.prisma && node dist/src/main"]
