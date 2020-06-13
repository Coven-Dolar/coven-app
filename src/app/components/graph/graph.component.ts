import {Component, Input, OnInit} from '@angular/core';
import {GoogleChartInterface} from 'ng2-google-charts/google-charts-interfaces';
import {RequestAPI} from '../../services/RequestAPI';
import {Events} from '../../services/events';
import {forEach} from '@angular-devkit/schematics';

@Component({
  selector: 'app-graph',
  templateUrl: './graph.component.html',
  styleUrls: ['./graph.component.scss'],
})
export class GraphComponent implements OnInit {
  @Input() market = '';
  @Input() typeMarket = '';
  private selectedDay: number;

  public options: any;
  public lineChart: GoogleChartInterface;
  public showGraph: boolean;


  constructor(
      private http: RequestAPI,
      private event: Events,
  ) { }

  ngOnInit() {
    this.showGraph = false;
    this.selectedDay = 7;
    this.options = [
      { val: '7 Días', isChecked: true },
      { val: '15 Días', isChecked: false },
      { val: '1 Mes', isChecked: false },
      { val: '6 Meses', isChecked: false },
    ];

    this.event.subscribe(this.market, (data: any) => {
      this.searDataGraph();
    });
  }

  private configGraph(data: any) {

    this.showGraph = true;
    this.lineChart = {
      chartType: 'LineChart',
      dataTable: data,
      options: {
        focusTarget: 'category',
        role: ['tooltip', 342],
        fontSize: 8,
        height: '100%',
        pointSize: 3,
        width: '100%',
        legend: { position: 'bottom' },
        chartArea: { left: 40, top: 10, width: '100%', height: '75%' },
        colors: ['orange'],
      }
    };
  }

  setSelectOption(select: string) {
    this.showGraph = false;
    const novoOpcoes = this.options;

    for (const key in novoOpcoes) {
      if (novoOpcoes.hasOwnProperty(key)) {
        const element = novoOpcoes[key];
        if (element.val === select) {
          novoOpcoes[key] = {val: element.val, isChecked: true};
        } else {
          novoOpcoes[key] = {val: element.val, isChecked: false};
        }
      }
    }
    this.options = novoOpcoes;
    switch (select) {
      case '7 Días':
        this.selectedDay = 7;
        break;
      case '15 Días':
        this.selectedDay = 15;
        break;
      case '1 Mes':
        this.selectedDay = 30;
        break;
      case '6 meses':
        this.selectedDay = 180;
        break;
    }

    this.searDataGraph();
  }

  private searDataGraph() {
    this.http.get('indicadores/data/' + this.typeMarket + '/' + this.market + '/', {days: this.selectedDay}).subscribe( (response: any) => {
      const array = [];
      if (response.length > 1) {
        for (const item of response) {
          array.push([item.date, item.value]);
        }
        setTimeout(() => {
          this.configGraph(array);
        }, 200);
      } else {
        this.showGraph = true;
      }
    });
  }


}
