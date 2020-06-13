import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {RequestAPI} from '../../services/RequestAPI';

@Component({
  selector: 'app-noticia',
  templateUrl: './noticia.page.html',
  styleUrls: ['./noticia.page.scss'],
})
export class NoticiaPage implements OnInit {
  public noticia: any;
  public request: boolean;
  private previousUrl: string;

  constructor(
      private activatedRoute: ActivatedRoute,
      private http: RequestAPI,
  ) { }

  ngOnInit() {
    this.makeRequest();
  }

  private makeRequest(): void {
    const url = this.activatedRoute.snapshot.paramMap.get('url');
    this.request = true;
    this.http.get('blog/post/' + url).subscribe( (response: any) => {
      this.noticia = response;
      this.request = false;
    });
  }

  makeRefresh() {
    this.makeRequest();
  }

}
