import { ApiProperty } from '@nestjs/swagger';

export class CreateTaskDto {
  @ApiProperty({
    description: 'Название задачи',
    example: 'Изучить NestJS',
  })
  title: string;

  @ApiProperty({
    description: 'Описание задачи',
    example: 'Изучить основы NestJS и создать простое API',
    required: false,
  })
  description?: string;
}
