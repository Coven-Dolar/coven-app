import {Component, ElementRef, ViewChild} from '@angular/core';
import {RequestAPI} from '../services/RequestAPI';
import {GraphComponent} from '../components/graph/graph.component';
import {Events} from '../services/events';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  // @ts-ignore
  @ViewChild(GraphComponent) Graph: GraphComponent;
  public request: boolean;
  public datos = [];
  public today = new Date();

  constructor(
      private http: RequestAPI,
      private event: Events,
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
        break;
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
      this.event.publish(item.nombre, '');
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
