# Tasks API

Контроллер для управления задачами с полным CRUD функционалом.

## Маршруты

### GET /tasks
Получить все задачи
- **Ответ**: Массив задач, отсортированный по дате создания (новые сверху)

### GET /tasks/:id
Получить задачу по ID
- **Параметры**: `id` - UUID строки задачи
- **Ответ**: Объект задачи
- **Ошибки**: 404 если задача не найдена

### POST /tasks
Создать новую задачу
- **Тело запроса**:
  ```json
  {
    "title": "string",      // обязательное
    "description": "string" // опциональное
  }
  ```
- **Ответ**: Созданная задача с UUID

### PATCH /tasks/:id
Обновить задачу
- **Параметры**: `id` - UUID строки задачи
- **Тело запроса**:
  ```json
  {
    "title": "string",        // опциональное
    "description": "string",  // опциональное
    "completed": boolean      // опциональное
  }
  ```
- **Ответ**: Обновленная задача
- **Ошибки**: 404 если задача не найдена

### DELETE /tasks/:id
Удалить задачу
- **Параметры**: `id` - UUID строки задачи
- **Ответ**: Удаленная задача
- **Ошибки**: 404 если задача не найдена

## Модель Task

```typescript
{
  id: string;          // UUID
  title: string;       // Название задачи
  description?: string; // Описание (опционально)
  completed: boolean;   // Статус выполнения
  createdAt: Date;     // Дата создания
  updatedAt: Date;     // Дата обновления
}
```

## Примеры использования

### Создание задачи
```bash
curl -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Новая задача", "description": "Описание задачи"}'
```

### Получение всех задач
```bash
curl http://localhost:3000/tasks
```

### Получение задачи по ID
```bash
curl http://localhost:3000/tasks/{uuid}
```

### Обновление задачи
```bash
curl -X PATCH http://localhost:3000/tasks/{uuid} \
  -H "Content-Type: application/json" \
  -d '{"completed": true}'
```

### Удаление задачи
```bash
curl -X DELETE http://localhost:3000/tasks/{uuid}
```
