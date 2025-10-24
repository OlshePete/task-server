import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiBody,
} from '@nestjs/swagger';
import { TasksService } from './tasks.service';
import { CreateTaskDto } from './dto/create-task.dto';
import { UpdateTaskDto } from './dto/update-task.dto';

@ApiTags('tasks')
@Controller('tasks')
export class TasksController {
  constructor(private readonly tasksService: TasksService) {}

  @Post()
  @ApiOperation({ summary: 'Создать новую задачу' })
  @ApiBody({ type: CreateTaskDto })
  @ApiResponse({
    status: 201,
    description: 'Задача успешно создана',
    schema: {
      example: {
        id: 1,
        title: 'Изучить NestJS',
        description: 'Изучить основы NestJS и создать простое API',
        completed: false,
        createdAt: '2023-01-01T00:00:00.000Z',
        updatedAt: '2023-01-01T00:00:00.000Z',
      },
    },
  })
  create(@Body() createTaskDto: CreateTaskDto) {
    return this.tasksService.create(createTaskDto);
  }

  @Get()
  @ApiOperation({ summary: 'Получить все задачи' })
  @ApiResponse({
    status: 200,
    description: 'Список всех задач',
    schema: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          id: { type: 'number', example: 1 },
          title: { type: 'string', example: 'Изучить NestJS' },
          description: { type: 'string', example: 'Описание задачи' },
          completed: { type: 'boolean', example: false },
          createdAt: { type: 'string', example: '2023-01-01T00:00:00.000Z' },
          updatedAt: { type: 'string', example: '2023-01-01T00:00:00.000Z' },
        },
      },
    },
  })
  findAll() {
    return this.tasksService.findAll();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Получить задачу по ID' })
  @ApiParam({ name: 'id', description: 'ID задачи (число)' })
  @ApiResponse({
    status: 200,
    description: 'Задача найдена',
    schema: {
      example: {
        id: 1,
        title: 'Изучить NestJS',
        description: 'Изучить основы NestJS и создать простое API',
        completed: false,
        createdAt: '2023-01-01T00:00:00.000Z',
        updatedAt: '2023-01-01T00:00:00.000Z',
      },
    },
  })
  @ApiResponse({
    status: 404,
    description: 'Задача не найдена',
  })
  findOne(@Param('id') id: string) {
    return this.tasksService.findOne(id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Обновить задачу' })
  @ApiParam({ name: 'id', description: 'ID задачи (число)' })
  @ApiBody({ type: UpdateTaskDto })
  @ApiResponse({
    status: 200,
    description: 'Задача успешно обновлена',
    schema: {
      example: {
        id: 'uuid-string',
        title: 'Изучить NestJS',
        description: 'Изучить основы NestJS и создать простое API',
        completed: true,
        createdAt: '2023-01-01T00:00:00.000Z',
        updatedAt: '2023-01-01T00:00:00.000Z',
      },
    },
  })
  @ApiResponse({
    status: 404,
    description: 'Задача не найдена',
  })
  update(@Param('id') id: string, @Body() updateTaskDto: UpdateTaskDto) {
    return this.tasksService.update(id, updateTaskDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Удалить задачу' })
  @ApiParam({ name: 'id', description: 'ID задачи (число)' })
  @ApiResponse({
    status: 200,
    description: 'Задача успешно удалена',
    schema: {
      example: {
        id: 1,
        title: 'Изучить NestJS',
        description: 'Изучить основы NestJS и создать простое API',
        completed: false,
        createdAt: '2023-01-01T00:00:00.000Z',
        updatedAt: '2023-01-01T00:00:00.000Z',
      },
    },
  })
  @ApiResponse({
    status: 404,
    description: 'Задача не найдена',
  })
  remove(@Param('id') id: string) {
    return this.tasksService.remove(id);
  }
}
