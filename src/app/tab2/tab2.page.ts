import { Component } from '@angular/core';
import {RequestAPI} from '../services/RequestAPI';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  public request: boolean;
  public datos = [];
  public today = new Date();
  public items: any = [];

  constructor(
      private http: RequestAPI
  ) {
    setInterval( () => {
      this.today = new Date();
    }, 1000);

    this.items = [
      { expanded: false },
      { expanded: false },
      { expanded: false },
      { expanded: false },
      { expanded: false },
      { expanded: false },
      { expanded: false },
      { expanded: false },
      { expanded: false }
    ];
  }

  async ionViewDidEnter() {
    this.makeRequest();
  }

  private makeRequest(): void {
    this.request = true;
    this.http.get('indicadores/mercados/nacionales/').subscribe( (response: any) => {
      this.datos = response;
      for (const item of this.datos) {
        item['expanded'] = false;
      }
      this.request = false;
    });
  }

  refreshMarket() {
    this.makeRequest();
  }

  expandItem(item): void {
    if (item.expanded) {
      item.expanded = false;
    } else {
      this.datos.map( (listItem: any) => {
        if (item == listItem) {
          listItem.expanded = !listItem.expanded;
        } else {
          listItem.expanded = false;
        }
        return listItem;
      });
    }
  }

}
