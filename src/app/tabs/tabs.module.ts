import { IonicModule } from '@ionic/angular';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { TabsPageRoutingModule } from './tabs-routing.module';

import { TabsPage } from './tabs.page';
import {ModalFiltrosPageModule} from '../modal/modal-filtros/modal-filtros.module';

@NgModule({
  imports: [
    IonicModule,
    CommonModule,
    FormsModule,
    TabsPageRoutingModule, ModalFiltrosPageModule
  ],
  declarations: [TabsPage]
})
export class TabsPageModule {}
