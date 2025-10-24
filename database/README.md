# База данных SQLite с Prisma

Этот проект использует SQLite базу данных с Prisma ORM для управления данными.

## Структура

```
database/
├── prisma/
│   ├── schema.prisma          # Схема базы данных
│   ├── migrations/            # Миграции базы данных
│   └── database/
│       └── task-server.db     # Файл базы данных SQLite
├── generated/
│   └── prisma/                # Сгенерированный Prisma Client
└── prisma.config.ts           # Конфигурация Prisma
```

## Доступные команды

- `npm run prisma:generate` - Генерировать Prisma Client
- `npm run prisma:migrate` - Создать и применить миграцию
- `npm run prisma:deploy` - Применить миграции в продакшене
- `npm run prisma:studio` - Открыть Prisma Studio для просмотра данных
- `npm run prisma:reset` - Сбросить базу данных

## Модели

### Task
- `id` - Уникальный идентификатор (автоинкремент)
- `title` - Название задачи (обязательное)
- `description` - Описание задачи (опциональное)
- `completed` - Статус выполнения (по умолчанию false)
- `createdAt` - Дата создания
- `updatedAt` - Дата последнего обновления

## Использование

PrismaService доступен глобально в приложении через PrismaModule. Пример использования:

```typescript
import { PrismaService } from './prisma/prisma.service';

@Injectable()
export class MyService {
  constructor(private prisma: PrismaService) {}

  async getTasks() {
    return this.prisma.task.findMany();
  }

  async createTask(data: { title: string; description?: string }) {
    return this.prisma.task.create({ data });
  }
}
```
