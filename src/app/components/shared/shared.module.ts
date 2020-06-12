import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {HeaderComponent} from '../header/header.component';
import {IonicModule} from '@ionic/angular';
import {UltimasNoticiasComponent} from '../ultimas-noticias/ultimas-noticias.component';
import {MarketLegendComponent} from '../market-legend/market-legend.component';
import {ExpandableComponent} from '../expandable/expandable.component';
import {GraphComponent} from '../graph/graph.component';
import {Ng2GoogleChartsModule} from 'ng2-google-charts';


@NgModule({
    declarations: [HeaderComponent, UltimasNoticiasComponent, MarketLegendComponent, ExpandableComponent, GraphComponent],
    exports: [HeaderComponent, UltimasNoticiasComponent, MarketLegendComponent, ExpandableComponent, GraphComponent],
    imports: [
        CommonModule,
        IonicModule,
        Ng2GoogleChartsModule,
    ]
})
export class SharedModule { }
