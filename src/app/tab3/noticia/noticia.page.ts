import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-noticia',
  templateUrl: './noticia.page.html',
  styleUrls: ['./noticia.page.scss'],
})
export class NoticiaPage implements OnInit {
  private url: string;
  constructor(
      private activatedRoute: ActivatedRoute,
  ) { }

  ngOnInit() {
    this.url = this.activatedRoute.snapshot.paramMap.get('url');
  }
  ionViewDidEnter() {
    console.log('xxx');
  }
}
