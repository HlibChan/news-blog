import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { News, NewsService } from './news.sevice';
import { CommentsService } from '../comments/comments.service';
import { renderNewsAll } from '../views/news/allNews';
import { renderTemplate } from '../views/template';
import { NewsPage } from '../views/news/news';
import { CommentListView } from '../views/news/comments/comments';

@Controller('news')
export class NewsController {
  constructor(
    private readonly newsService: NewsService,
    private readonly commentService: CommentsService,
  ) {}

  @Get('/')
  @HttpCode(200)
  allNewsView() {
    const news = this.newsService.allNews();
    const content = renderNewsAll(news);
    return renderTemplate(content, {
      title: 'News list',
      description: 'news',
    });
  }

  @Get('/:id')
  @HttpCode(200)
  getNewsView(@Param('id') idOrig: string): string {
    const id = parseInt(idOrig);
    const news = this.newsService.find(id);
    const comments = this.commentService.find(id) || [];
    const readyComments = CommentListView(comments);
    const readyNews = NewsPage(news, readyComments);
    return renderTemplate(readyNews, {
      title: `News #${id}`,
      description: 'news',
    });
  }

  @Get('/api/all')
  @HttpCode(200)
  allNews(): News[] {
    return this.newsService.allNews();
  }

  @Get('/api/:id')
  @HttpCode(200)
  get(@Param('id') idOrig: string): News {
    const id = parseInt(idOrig);
    const news = this.newsService.find(id);
    const comments = this.commentService.find(id);
    return {
      ...news,
      comments,
    };
  }

  @Put('/api')
  edit(@Body() news: News): News[] {
    return this.newsService.edit(news);
  }

  @Post('/api')
  @HttpCode(200)
  create(@Body() news: News): News[] {
    return this.newsService.create(news);
  }

  @Delete('/api/:id')
  @HttpCode(200)
  delete(@Param('id') idOrig: string): string {
    const id = parseInt(idOrig);
    const isRemoved = this.newsService.remove(id);
    return isRemoved ? 'News have been removed' : 'Incorrect if';
  }
}
