import {Component, Input, OnInit} from '@angular/core';
import {GoogleChartInterface} from 'ng2-google-charts';

@Component({
  selector: 'app-graph',
  templateUrl: './graph.component.html',
  styleUrls: ['./graph.component.scss'],
})
export class GraphComponent implements OnInit {
  @Input() dataGraph = [];
  public options: any;
  public selectOption: string;

  public pieChart: GoogleChartInterface = {
    chartType: 'LineChart',
    //firstRowIsData: true,
    options: {title: 'Un grafico de ejemplo'},
  };
  constructor() { }

  ngOnInit() {
    this.options = [
      { val: '7 Días', isChecked: true },
      { val: '15 Días', isChecked: false },
      { val: '1 Mes', isChecked: false },
      { val: '6 Meses', isChecked: false },
    ];
    this.pieChart.dataTable = this.dataGraph;
  }

  setSelectOtion(selecao) {
    const novoOpcoes = this.options;

    for (const key in novoOpcoes) {
      if (novoOpcoes.hasOwnProperty(key)) {
        const element = novoOpcoes[key];
        if (element.val === selecao) {
          novoOpcoes[key] = {val: element.val, isChecked: true};
        } else {
          novoOpcoes[key] = {val: element.val, isChecked: false};
        }
      }
    }
    this.options = novoOpcoes;
  }

}
