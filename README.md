# Task Server API

Простой REST API для управления задачами, созданный на NestJS с SQLite базой данных.

## Быстрый запуск с Docker

### 1. Клонирование и запуск (рекомендуется)

**Для Ubuntu/Linux/macOS:**
```bash
git clone <URL_РЕПОЗИТОРИЯ>
cd task-server
chmod +x start.sh
./start.sh
```

**Для Windows:**
```powershell
git clone <URL_РЕПОЗИТОРИЯ>
cd task-server
.\start.ps1
```

### 2. Ручной запуск
```bash
git clone <URL_РЕПОЗИТОРИЯ>
cd task-server

# Запускаем контейнер (база данных создастся автоматически)
docker-compose up --build -d
```

> **✅ Проблема с базой данных решена!** База данных теперь создается автоматически при первом запуске контейнера.

### 3. Проверка работы
- API: http://localhost:3000
- Swagger UI: http://localhost:3000/api

### 4. Просмотр логов (если есть проблемы)
```bash
docker-compose logs -f
```

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
# Полная настройка и запуск (рекомендуется для первого запуска)
npm run docker:setup

# Обычный запуск
npm run docker:up

# Пересборка и запуск (при проблемах)
npm run docker:rebuild

# Остановка
npm run docker:down

# Просмотр логов
npm run docker:logs
```

## Документация

- [Подробная инструкция по Docker](docs/docker-setup.md)
- [Инструкция для Ubuntu](UBUNTU_SETUP.md) - пошаговая настройка на Ubuntu
- [Swagger UI](http://localhost:3000/api) - интерактивное тестирование API

## Технологии

- **NestJS** - Node.js фреймворк
- **SQLite** - база данных
- **Prisma** - ORM
- **Swagger** - документация API
- **Docker** - контейнеризация

## Решение проблем

### Ошибка "Unable to open the database file"
Эта проблема решена в текущей версии! База данных теперь создается автоматически при запуске контейнера.

Если проблема все еще возникает:

1. **Используйте скрипт быстрого запуска:**
   ```bash
   # Linux/macOS
   ./start.sh
   
   # Windows
   .\start.ps1
   ```

2. **Или очистите все и пересоберите:**
   ```bash
   docker-compose down -v
   docker-compose up --build -d
   ```

3. **Проверьте логи:**
   ```bash
   docker-compose logs -f
   ```

### Порт 3000 занят
Измените порт в `docker-compose.yml`:
```yaml
ports:
  - "3001:3000"  # Внешний порт:внутренний порт
```

## Обучение

Этот проект идеально подходит для изучения:
- REST API разработки
- Работы с базами данных
- Docker контейнеризации
- Swagger документации
- TypeScript и NestJS