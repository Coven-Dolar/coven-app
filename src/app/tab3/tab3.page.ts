import {Component, ViewChild} from '@angular/core';
import {IonInfiniteScroll} from '@ionic/angular';
import {ActivatedRoute, Router} from '@angular/router';
import {RequestAPI} from '../services/RequestAPI';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss']
})
export class Tab3Page {
  // @ts-ignore
  @ViewChild(IonInfiniteScroll) infiniteScroll: IonInfiniteScroll;

  noticias = [];
  request: boolean;
  private limit = 10;
  private offset = 0;

  constructor(
      private route: Router,
      private activatedRoute: ActivatedRoute,
      private http: RequestAPI,
  ) { }

  async ionViewDidEnter() {
    this.makeRequest();
  }

  abrirNoticia(url: string) {
    this.route.navigate(['/tabs/tab3/noticia', url]);
  }

  private makeRequest(): void {
    let url = this.activatedRoute.snapshot.paramMap.get('categoria');
    if (url !== null && url !== '') {
      url = 'blog/post/' + 'category/' + url + '/';
    } else {
      url = 'blog/post/';
    }

    this.http.get(url, {limit: this.limit, offset: this.offset}).subscribe((response: any) => {
      if (response.next != null) {
        const aux =  response.next.split('?');
        this.setCreatePaginator(aux[1]);
      } else {
        this.infiniteScroll.disabled = true;
      }
      for (const item of response.results) {
        this.noticias.push(item);
      }
    });
  }

  private setCreatePaginator(next: string): void {
    const aux = next.split('&');
    const offset = aux[1].split('=');
    this.offset = Number(offset[1]);
  }


  loadData(event) {
    setTimeout(() => {
      event.target.complete();
      this.makeRequest();
    }, 1000);
  }

  makeRefresh() {
    this.noticias = [];
    this.offset = 10;
    this.makeRequest();
  }

  toggleInfiniteScroll() {
    this.infiniteScroll.disabled = !this.infiniteScroll.disabled;
  }

}
