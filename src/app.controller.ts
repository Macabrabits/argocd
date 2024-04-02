import { Controller, Get, Req } from '@nestjs/common';
import { AppService } from './app.service';
import { ApiHeader } from '@nestjs/swagger';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get()
  @ApiHeader({
    name: 'fail',
    description: 'establish a percentage chance for the request to fail, usefull for testing rollout update',
  })
  getHello(@Req() request) {    
    return this.appService.getHello(parseInt(request.headers.fail));
  }
  @Get('info')
  info() {    
    return this.appService.getInfo();
  }
}
