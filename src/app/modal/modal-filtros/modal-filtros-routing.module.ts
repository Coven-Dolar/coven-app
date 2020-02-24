import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ModalFiltrosPage } from './modal-filtros.page';

const routes: Routes = [
  {
    path: '',
    component: ModalFiltrosPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ModalFiltrosPageRoutingModule {}
