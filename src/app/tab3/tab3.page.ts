import { Component } from '@angular/core';
import {Router} from '@angular/router';
import {RequestAPI} from '../services/RequestAPI';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss']
})
export class Tab3Page {
  noticias = [];
  constructor(
      private route: Router,
      private http: RequestAPI,
  ) {
    this.http.get('blog/post/').subscribe((response: any) => {
      this.noticias = response.results;
    });
  }
  async ionViewDidEnter() {
    console.log('ss');
  }

  abrirNoticia(url: string) {
    this.route.navigate(['/tabs/tab3/noticia', url]);
  }

}
