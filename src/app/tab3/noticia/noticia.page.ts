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
  request: boolean;
  constructor(
      private activatedRoute: ActivatedRoute,
      private http: RequestAPI,
  ) { }

  ngOnInit() {
    const url = this.activatedRoute.snapshot.paramMap.get('url');
    this.request = true;
    this.http.get('blog/post/' + url).subscribe( (response: any) => {
      this.noticia = response;
      this.request = false;
    });
  }
  ionViewDidEnter() {
    console.log('xxx');
  }
}
