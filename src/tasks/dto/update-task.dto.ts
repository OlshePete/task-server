import { ApiProperty } from '@nestjs/swagger';

export class UpdateTaskDto {
  @ApiProperty({
    description: 'Название задачи',
    example: 'Изучить NestJS',
    required: false,
  })
  title?: string;

  @ApiProperty({
    description: 'Описание задачи',
    example: 'Изучить основы NestJS и создать простое API',
    required: false,
  })
  description?: string;

  @ApiProperty({
    description: 'Статус выполнения задачи',
    example: true,
    required: false,
  })
  completed?: boolean;
}
