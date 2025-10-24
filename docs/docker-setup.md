# Запуск Task Server в Docker

Это руководство поможет джуну быстро развернуть и запустить Task Server API в Docker контейнере.

## Предварительные требования

- Docker Desktop установлен и запущен
- Git для клонирования репозитория

## Быстрый запуск

### 1. Клонирование репозитория
```bash
git clone <URL_РЕПОЗИТОРИЯ>
cd task-server
```

### 2. Запуск с помощью Docker Compose (рекомендуется)
```bash
# Запуск в фоновом режиме
docker-compose up -d

# Или с просмотром логов
docker-compose up
```

### 3. Проверка работы
- API: http://localhost:3000
- Swagger UI: http://localhost:3000/api

## Альтернативный способ (без Docker Compose)

### 1. Сборка образа
```bash
docker build -t task-server .
```

### 2. Запуск контейнера
```bash
docker run -p 3000:3000 task-server
```

## Доступные команды

### Docker Compose команды
```bash
# Запуск в фоновом режиме
npm run docker:up

# Остановка
npm run docker:down

# Просмотр логов
npm run docker:logs

# Перезапуск
docker-compose restart
```

### Docker команды
```bash
# Сборка образа
npm run docker:build

# Запуск контейнера
npm run docker:run
```

## Тестирование API

После запуска контейнера можно тестировать API:

### 1. Создание задачи
```bash
curl -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Изучить Docker", "description": "Научиться работать с Docker"}'
```

### 2. Получение всех задач
```bash
curl http://localhost:3000/tasks
```

### 3. Получение задачи по ID
```bash
curl http://localhost:3000/tasks/1
```

### 4. Обновление задачи
```bash
curl -X PATCH http://localhost:3000/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{"completed": true}'
```

### 5. Удаление задачи
```bash
curl -X DELETE http://localhost:3000/tasks/1
```

## Swagger UI

Откройте браузер и перейдите на http://localhost:3000/api для интерактивного тестирования API.

## Структура проекта

```
task-server/
├── src/                    # Исходный код приложения
├── database/               # База данных SQLite
├── docs/                   # Документация
├── Dockerfile             # Конфигурация Docker
├── docker-compose.yml     # Конфигурация Docker Compose
├── .dockerignore          # Исключения для Docker
└── package.json           # Зависимости и скрипты
```

## Возможные проблемы и решения

### Проблема: Порт 3000 уже занят
**Решение**: Измените порт в docker-compose.yml или остановите другое приложение на порту 3000

### Проблема: Ошибка при сборке
**Решение**: Убедитесь, что Docker Desktop запущен и у вас есть интернет-соединение

### Проблема: База данных не сохраняется
**Решение**: Убедитесь, что папка `./database/prisma/database` существует и имеет права на запись

## Остановка и очистка

### Остановка контейнера
```bash
docker-compose down
```

### Удаление образа
```bash
docker rmi task-server
```

### Полная очистка
```bash
docker-compose down --volumes --remove-orphans
docker rmi task-server
```

## Полезные команды для разработки

```bash
# Просмотр запущенных контейнеров
docker ps

# Просмотр логов конкретного контейнера
docker logs <CONTAINER_ID>

# Вход в контейнер для отладки
docker exec -it <CONTAINER_ID> sh

# Просмотр использования ресурсов
docker stats
```

## Обучение джуна

Этот сервис идеально подходит для обучения джуна работе с API:

1. **REST API** - все основные HTTP методы (GET, POST, PATCH, DELETE)
2. **Swagger документация** - интерактивное тестирование
3. **База данных** - работа с SQLite через Prisma ORM
4. **Docker** - современный способ развертывания
5. **TypeScript** - типизированный код
6. **NestJS** - популярный фреймворк для Node.js

Джун может изучать:
- Структуру API
- Работу с базой данных
- Docker контейнеризацию
- Swagger документацию
- RESTful архитектуру
