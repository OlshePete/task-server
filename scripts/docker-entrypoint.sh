#!/bin/sh

echo "🚀 Запуск Task Server API..."

# Проверяем переменную окружения
if [ -z "$DATABASE_URL" ]; then
    echo "❌ Ошибка: DATABASE_URL не установлена"
    exit 1
fi

echo "🔧 DATABASE_URL: $DATABASE_URL"

# Создаем директорию для базы данных с правильными правами
echo "📁 Создание директории для базы данных..."
mkdir -p /app/database/prisma/database
chmod 777 /app/database/prisma/database

# Проверяем, что директория создалась
if [ ! -d "/app/database/prisma/database" ]; then
    echo "❌ Ошибка: не удалось создать директорию для базы данных"
    exit 1
fi

echo "✅ Директория для базы данных создана: /app/database/prisma/database"

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
    echo "📋 Содержимое директории:"
    ls -la /app/database/prisma/database/
    exit 1
fi

echo "✅ Файл базы данных найден: /app/database/prisma/database/task-server.db"

# Проверяем права доступа к файлу базы данных
echo "🔐 Проверка прав доступа к файлу базы данных..."
ls -la /app/database/prisma/database/task-server.db

# Запускаем приложение
echo "🚀 Запуск приложения..."
exec node dist/src/main
