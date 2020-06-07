import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {HeaderComponent} from '../header/header.component';
import {IonicModule} from '@ionic/angular';
import {UltimasNoticiasComponent} from '../ultimas-noticias/ultimas-noticias.component';
import {MarketLegendComponent} from '../market-legend/market-legend.component';


@NgModule({
  declarations: [HeaderComponent, UltimasNoticiasComponent, MarketLegendComponent],
  exports: [HeaderComponent, UltimasNoticiasComponent, MarketLegendComponent],
  imports: [
    CommonModule,
    IonicModule
  ]
})
export class SharedModule { }
