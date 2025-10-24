#!/bin/sh

echo "🚀 Запуск Task Server API..."

# Проверяем, что директория для базы данных существует
if [ ! -d "/app/database/prisma/database" ]; then
    echo "📁 Создание директории для базы данных..."
    mkdir -p /app/database/prisma/database
    chmod 755 /app/database/prisma/database
fi

# Проверяем переменную окружения
if [ -z "$DATABASE_URL" ]; then
    echo "❌ Ошибка: DATABASE_URL не установлена"
    exit 1
fi

echo "🔧 DATABASE_URL: $DATABASE_URL"

# Инициализируем базу данных
echo "🗄️  Инициализация базы данных..."
npx prisma migrate deploy --schema=./database/prisma/schema.prisma

if [ $? -eq 0 ]; then
    echo "✅ База данных успешно инициализирована"
else
    echo "❌ Ошибка при инициализации базы данных"
    exit 1
fi

# Проверяем, что файл базы данных создался
if [ ! -f "/app/database/prisma/database/task-server.db" ]; then
    echo "❌ Ошибка: файл базы данных не создался"
    exit 1
fi

echo "✅ Файл базы данных найден: /app/database/prisma/database/task-server.db"

# Запускаем приложение
echo "🚀 Запуск приложения..."
exec node dist/src/main
