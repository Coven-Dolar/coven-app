import { Component } from '@angular/core';
import {RequestAPI} from '../services/RequestAPI';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {
  datos = [];
  request: boolean;
  today = new Date();
  constructor(
      private http: RequestAPI
  ) {
    setInterval( () => {
      this.today = new Date();
    }, 1000);
  }

  async ionViewDidEnter() {
    this.makeRequest();
  }

  private makeRequest(): void  {
    this.request = true;
    this.http.get('indicadores/mercados/internacionales/').subscribe( (response: any) => {
      this.datos = response;
      this.request = false;
    });
  }

  refreshMarket() {
    this.makeRequest();
  }

}
