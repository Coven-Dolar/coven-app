import { Component } from '@angular/core';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  datos = [
    {
      nombre: 'CHATARRA DE HIERRO(HSM1 CIF *)',
      precio_venta: '310,00',
      precio_compra: '250,00',
      par: 'USD/T',
      movilidad: '1.5'
    },
    {
      nombre: 'CHATARRA DE HIERRO(HSM1 EXWORK *)',
      precio_venta: '310,00',
      precio_compra: '250,00',
      par: 'USD/T',
      movilidad: '1.5'
    },
    {
      nombre: 'CHATARRA DE PLASTICO',
      precio_venta: '310,00',
      precio_compra: '250,00',
      par: 'USD/T',
      movilidad: '1.5'
    },
    {
      nombre: 'PETRO',
      precio_venta: '4428329,36',
      precio_compra: '4328329,36',
      par: 'BS/PTR',
      movilidad: '1.5'
    },
    {
      nombre: 'DOLAR',
      precio_venta: '76550,24',
      precio_compra: '73550,24',
      par: 'BS/USD',
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
