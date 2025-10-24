# Task Server API

Простой REST API для управления задачами, созданный на NestJS с SQLite базой данных.

## Быстрый запуск с Docker

### 1. Клонирование и запуск
```bash
git clone <URL_РЕПОЗИТОРИЯ>
cd task-server
docker-compose up -d
```

### 2. Проверка работы
- API: http://localhost:3000
- Swagger UI: http://localhost:3000/api

## Доступные API endpoints

- **GET /tasks** - получить все задачи
- **POST /tasks** - создать новую задачу
- **GET /tasks/:id** - получить задачу по ID
- **PATCH /tasks/:id** - обновить задачу
- **DELETE /tasks/:id** - удалить задачу

## Примеры использования

### Создание задачи
```bash
curl -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Изучить API", "description": "Научиться работать с REST API"}'
```

### Получение всех задач
```bash
curl http://localhost:3000/tasks
```

## Docker команды

```bash
# Запуск
npm run docker:up

# Остановка
npm run docker:down

# Просмотр логов
npm run docker:logs
```

## Документация

- [Подробная инструкция по Docker](docs/docker-setup.md)
- [Swagger UI](http://localhost:3000/api) - интерактивное тестирование API

## Технологии

- **NestJS** - Node.js фреймворк
- **SQLite** - база данных
- **Prisma** - ORM
- **Swagger** - документация API
- **Docker** - контейнеризация

## Обучение

Этот проект идеально подходит для изучения:
- REST API разработки
- Работы с базами данных
- Docker контейнеризации
- Swagger документации
- TypeScript и NestJS