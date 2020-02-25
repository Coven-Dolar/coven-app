import { Component } from '@angular/core';
import {RequestAPI} from '../services/RequestAPI';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  request: boolean;
  datos = [];
  today = new Date();
  constructor(
      private http: RequestAPI
  ) {
    setInterval( () => {
      this.today = new Date();
    }, 1000);
  }

  async ionViewDidEnter() {
    this.request = true;
    this.http.get('indicadores/mercados/nacionales/').subscribe( (response: any) => {
      this.datos = response;
      this.request = false;
    });
  }

}
