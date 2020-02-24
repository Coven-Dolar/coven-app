import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {RequestAPI} from '../../services/RequestAPI';

@Component({
  selector: 'app-ultimas-noticias',
  templateUrl: './ultimas-noticias.component.html',
  styleUrls: ['./ultimas-noticias.component.scss'],
})
export class UltimasNoticiasComponent implements OnInit {
  slideOpts = {
    initialSlide: 0,
    speed: 400
  };
  noticias = [];
  constructor(
      private route: Router,
      private http: RequestAPI,
  ) { }

  ngOnInit() {
    this.http.get('blog/post/').subscribe( (response: any) => {
      console.log(response);
      this.noticias = response.results;
    });
  }
  abrirNoticia(url: string) {
    this.route.navigate(['/tabs/tab3/noticia', url]);
  }

}
