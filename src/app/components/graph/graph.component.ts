import { Component, OnInit } from '@angular/core';
import {GoogleChartInterface} from 'ng2-google-charts';

@Component({
  selector: 'app-graph',
  templateUrl: './graph.component.html',
  styleUrls: ['./graph.component.scss'],
})
export class GraphComponent implements OnInit {
  public pieChart: GoogleChartInterface = {
    chartType: 'LineChart',
    dataTable: [
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
    ],
    //firstRowIsData: true,
    options: {title: 'Un grafico de ejemplo'},
  };
  constructor() { }

  ngOnInit() {}

}
