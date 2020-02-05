import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {HeaderComponent} from '../header/header.component';
import {IonicModule} from '@ionic/angular';
import {UltimasNoticiasComponent} from '../ultimas-noticias/ultimas-noticias.component';


@NgModule({
  declarations: [HeaderComponent, UltimasNoticiasComponent],
  exports: [HeaderComponent, UltimasNoticiasComponent ],
  imports: [
    CommonModule,
    IonicModule
  ]
})
export class SharedModule { }
