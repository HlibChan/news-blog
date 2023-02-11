import { Module } from '@nestjs/common';
import { NewsController } from './news.controller';
import { NewsService } from './news.sevice';

@Module({
  controllers: [NewsController],
  providers: [NewsService],
})
export class NewsModule {}
