import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {RequestAPI} from '../../services/RequestAPI';

@Component({
  selector: 'app-noticia',
  templateUrl: './noticia.page.html',
  styleUrls: ['./noticia.page.scss'],
})
export class NoticiaPage implements OnInit {
  noticia: any;

  constructor(
      private activatedRoute: ActivatedRoute,
      private http: RequestAPI,
  ) { }

  ngOnInit() {
    const url = this.activatedRoute.snapshot.paramMap.get('url');
    console.log(url);
    this.http.get('blog/post/' + url).subscribe( (response: any) => {
      console.log(response);
      this.noticia = response;
    });
  }
  ionViewDidEnter() {
    console.log('xxx');
  }
}
