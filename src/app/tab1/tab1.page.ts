import { Component } from '@angular/core';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {
  datos = [
    {
      nombre: 'ORO',
      precio_venta: '2755,00',
      precio_compra: '2750,00',
      par: 'USD/Oz',
      movilidad: '-3.2'
    },
    {
      nombre: 'CACAO',
      precio_venta: '2755,00',
      precio_compra: '2750,00',
      par: 'USD/QQ',
      movilidad: '1.5'
    },
    {
      nombre: 'CAFE',
      precio_venta: '2755,00',
      precio_compra: '2750,00',
      par: 'USD/QQ',
      movilidad: '1.5'
    },
    {
      nombre: 'CHATARRA DE HIERRO(HSM1 FOB *)',
      precio_venta: '310,00',
      precio_compra: '250,00',
      par: 'USD/T',
      movilidad: '1.5'
    },
    {
      nombre: 'PETRO',
      precio_venta: '60,00',
      precio_compra: '57,00',
      par: 'USD/PTR',
      movilidad: '1.5'
    },
  ];
  today = new Date();
  constructor() {
    setInterval( () => {
      this.today = new Date();
    }, 1000);
  }

}
