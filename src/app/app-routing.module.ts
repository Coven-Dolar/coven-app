import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./tabs/tabs.module').then(m => m.TabsPageModule)
  },
  {
    path: 'modal-filtros',
    loadChildren: () => import('./modal/modal-filtros/modal-filtros.module').then( m => m.ModalFiltrosPageModule)
  },
  /*{
    path: 'noticia/:url',
    loadChildren: () => import('./tab3/noticia/noticia.module').then( m => m.NoticiaPageModule)
  }*/
];
@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
