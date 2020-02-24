import { Component } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
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
      private activatedRoute: ActivatedRoute,
      private http: RequestAPI,
  ) { }

  async ionViewDidEnter() {
    let url = this.activatedRoute.snapshot.paramMap.get('categoria');
    if (url !== null) {
      url = 'blog/post/' + 'category/' + url;
    } else {
      url = 'blog/post/';
    }
    this.http.get(url).subscribe((response: any) => {
      this.noticias = response.results;
    });
  }

  abrirNoticia(url: string) {
    this.route.navigate(['/tabs/tab3/noticia', url]);
  }

}
