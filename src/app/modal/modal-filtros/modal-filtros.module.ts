import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { ModalFiltrosPageRoutingModule } from './modal-filtros-routing.module';

import { ModalFiltrosPage } from './modal-filtros.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ModalFiltrosPageRoutingModule
  ],
  declarations: [ModalFiltrosPage]
})
export class ModalFiltrosPageModule {}
