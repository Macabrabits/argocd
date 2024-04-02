import { HttpException, HttpStatus, Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(failPercentChance?:number): string {
    const random = Math.random()*100
    if(random < failPercentChance) 
      throw new HttpException("Failed!", HttpStatus.INTERNAL_SERVER_ERROR)
    
    return `Hello World! Green!!`;
  }
  getInfo(){
    return process.env
  }
}
