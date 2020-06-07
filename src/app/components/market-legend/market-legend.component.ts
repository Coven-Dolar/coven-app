import {Component, Input, OnInit} from '@angular/core';
import {RequestAPI} from '../../services/RequestAPI';

@Component({
  selector: 'app-market-legend',
  templateUrl: './market-legend.component.html',
  styleUrls: ['./market-legend.component.scss'],
})
export class MarketLegendComponent implements OnInit {
  @Input() market: string;
  legend: any;

  constructor(
      private http: RequestAPI
  ) { }

  ngOnInit() {
    console.log(this.market);
    this.legend = [];
    this.http.get('indicadores/mercados/leyenda/' + this.market  + '/').subscribe( (response: any) => {
      this.legend = response;
      console.log(this.market);
      console.log(response);

    });
  }

}
