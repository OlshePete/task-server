#!/bin/bash

echo "🚀 Быстрый запуск Task Server API"
echo "=================================="

# Проверяем, что Docker установлен
if ! command -v docker &> /dev/null; then
    echo "❌ Docker не установлен. Пожалуйста, установите Docker и попробуйте снова."
    exit 1
fi

# Проверяем, что Docker Compose установлен
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не установлен. Пожалуйста, установите Docker Compose и попробуйте снова."
    exit 1
fi

echo "✅ Docker и Docker Compose найдены"

# Останавливаем и удаляем существующие контейнеры
echo "🧹 Очистка существующих контейнеров..."
docker-compose down -v

# Удаляем существующий образ для пересборки
echo "🔄 Удаление старого образа..."
docker rmi test-server_task-server 2>/dev/null || true

# Собираем и запускаем контейнеры
echo "🏗️  Сборка и запуск контейнеров..."
docker-compose up --build -d

# Ждем, пока контейнер запустится
echo "⏳ Ожидание запуска сервера..."
sleep 10

# Проверяем статус контейнера
echo "📊 Проверка статуса контейнера..."
docker-compose ps

# Проверяем логи
echo "📋 Последние логи:"
docker-compose logs --tail=20

echo ""
echo "🎉 Готово! Сервер должен быть доступен по адресу: http://localhost:3000"
echo "📖 Для просмотра логов используйте: docker-compose logs -f"
echo "🛑 Для остановки используйте: docker-compose down"
