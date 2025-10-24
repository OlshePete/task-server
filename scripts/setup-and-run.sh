#!/bin/bash

echo "🚀 Настройка и запуск Task Server API..."

# Проверяем, что мы в правильной директории
if [ ! -f "package.json" ]; then
    echo "❌ Ошибка: запустите скрипт из корневой директории проекта"
    exit 1
fi

# Создаем директорию для базы данных
echo "📁 Создание директории для базы данных..."
mkdir -p database/prisma/database

# Останавливаем существующие контейнеры
echo "🛑 Остановка существующих контейнеров..."
docker-compose down

# Пересобираем образ
echo "🔨 Пересборка Docker образа..."
docker-compose build --no-cache

# Запускаем контейнер
echo "🚀 Запуск контейнера..."
docker-compose up -d

# Ждем немного и показываем логи
echo "⏳ Ожидание запуска..."
sleep 5

echo "📋 Логи контейнера:"
docker-compose logs

echo ""
echo "✅ Готово! API доступно по адресу:"
echo "   🌐 API: http://localhost:3000"
echo "   📚 Swagger UI: http://localhost:3000/api"
echo ""
echo "Для просмотра логов в реальном времени:"
echo "   docker-compose logs -f"
echo ""
echo "Для остановки:"
echo "   docker-compose down"
