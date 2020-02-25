import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {RequestAPI} from '../../services/RequestAPI';

@Component({
  selector: 'app-ultimas-noticias',
  templateUrl: './ultimas-noticias.component.html',
  styleUrls: ['./ultimas-noticias.component.scss'],
})
export class UltimasNoticiasComponent implements OnInit {
  request: boolean;
  slideOpts = {
    initialSlide: 0,
    speed: 400
  };
  noticias: any;
  constructor(
      private route: Router,
      private http: RequestAPI,
  ) { }

  ngOnInit() {
    this.request = true;
    this.http.get('blog/post/').subscribe( (response: any) => {
      this.noticias = response.results;
      this.request = false;
    });
  }
  abrirNoticia(url: string) {
    this.route.navigate(['/tabs/tab3/noticia', url]);
  }

}
