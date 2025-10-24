import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';

@Injectable()
export class AppService {
  constructor(private prisma: PrismaService) {}

  getHello(): string {
    return 'Hello World!';
  }

  async getTasks() {
    return this.prisma.task.findMany();
  }

  async createTask(title: string, description?: string) {
    return this.prisma.task.create({
      data: {
        title,
        description,
      },
    });
  }
}
