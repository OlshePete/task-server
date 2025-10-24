# Быстрый запуск Task Server API
Write-Host "🚀 Быстрый запуск Task Server API" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green

# Проверяем, что Docker установлен
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Docker не установлен. Пожалуйста, установите Docker и попробуйте снова." -ForegroundColor Red
    exit 1
}

# Проверяем, что Docker Compose установлен
if (-not (Get-Command docker-compose -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Docker Compose не установлен. Пожалуйста, установите Docker Compose и попробуйте снова." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker и Docker Compose найдены" -ForegroundColor Green

# Останавливаем и удаляем существующие контейнеры
Write-Host "🧹 Очистка существующих контейнеров..." -ForegroundColor Yellow
docker-compose down -v

# Удаляем существующий образ для пересборки
Write-Host "🔄 Удаление старого образа..." -ForegroundColor Yellow
docker rmi test-server_task-server 2>$null

# Собираем и запускаем контейнеры
Write-Host "🏗️  Сборка и запуск контейнеров..." -ForegroundColor Yellow
docker-compose up --build -d

# Ждем, пока контейнер запустится
Write-Host "⏳ Ожидание запуска сервера..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Проверяем статус контейнера
Write-Host "📊 Проверка статуса контейнера..." -ForegroundColor Cyan
docker-compose ps

# Проверяем логи
Write-Host "📋 Последние логи:" -ForegroundColor Cyan
docker-compose logs --tail=20

Write-Host ""
Write-Host "🎉 Готово! Сервер должен быть доступен по адресу: http://localhost:3000" -ForegroundColor Green
Write-Host "Для просмотра логов используйте: docker-compose logs -f" -ForegroundColor Cyan
Write-Host "Для остановки используйте: docker-compose down" -ForegroundColor Cyan
