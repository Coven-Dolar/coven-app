import {Component, ElementRef, ViewChild} from '@angular/core';
import {RequestAPI} from '../services/RequestAPI';
import {GraphComponent} from '../components/graph/graph.component';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  public request: boolean;
  public datos = [];
  public today = new Date();
  public dataGraph = [
    ['10-12 05:50', 'Histórico'],
    ['10-12 05:10',     9824],
    ['10-12 05:30',      9910],
    ['10-12 05:40',  9924],
    ['10-12 05:50', 9894],
    ['10-13 06:00',    9884],
    ['10-13 05:10',     9824],
    ['10-13 05:30',      9910],
    ['10-13 05:40',  9924],
    ['10-13 05:50', 9894],
    ['10-1· 06:00',    9884]
  ];

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
      this.searDataGraph(item.nombre);
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

  private searDataGraph(market: string) {
      this.http.get('indicadores/data/nacional/' + market, {days: 7}).subscribe( (response: any) => {

    });
  }

}
