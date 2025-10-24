# Инструкция для Ubuntu

## Быстрый запуск на Ubuntu

### 1. Установка Docker (если не установлен)

```bash
# Обновляем пакеты
sudo apt update

# Устанавливаем Docker
sudo apt install -y docker.io docker-compose

# Добавляем пользователя в группу docker (чтобы не использовать sudo)
sudo usermod -aG docker $USER

# Перезагружаемся или выполняем:
newgrp docker
```

### 2. Клонирование и запуск

```bash
# Клонируем репозиторий
git clone <URL_РЕПОЗИТОРИЯ>
cd task-server

# Делаем скрипт исполняемым и запускаем
chmod +x start.sh
./start.sh
```

### 3. Альтернативный запуск (если скрипт не работает)

```bash
# Простой запуск
docker-compose up --build -d

# Проверка статуса
docker-compose ps

# Просмотр логов
docker-compose logs -f

# Остановка
docker-compose down
```

### 4. Проверка работы

- API: http://localhost:3000
- Swagger UI: http://localhost:3000/api

### 5. Тестирование API

```bash
# Проверка главной страницы
curl http://localhost:3000

# Создание задачи
curl -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Моя задача", "description": "Описание задачи"}'

# Получение всех задач
curl http://localhost:3000/tasks
```

## Решение проблем

### Если Docker требует sudo
```bash
sudo usermod -aG docker $USER
newgrp docker
# или перезагрузитесь
```

### Если порт 3000 занят
Измените порт в `docker-compose.yml`:
```yaml
ports:
  - "3001:3000"  # Внешний порт:внутренний порт
```

### Если контейнер не запускается
```bash
# Очистка и пересборка
docker-compose down -v
docker-compose up --build -d

# Просмотр логов
docker-compose logs -f
```
