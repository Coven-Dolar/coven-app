import {Component, Input, OnInit} from '@angular/core';
import {formatDate} from '@angular/common';
import {Events, ModalController} from '@ionic/angular';
import {ModalFiltrosPage} from '../../modal/modal-filtros/modal-filtros.page';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  @Input() showFilter = false;
  today = new Date();
  jstoday: string;
  constructor(
      private modal: ModalController,
      private event: Events,
  ) { }

  ngOnInit() {
    this.jstoday = formatDate(this.today, 'dd-MM-yyyy hh:mm:ss a', 'en-US', '+0530');
  }

  async openModalFilter() {
    const modal = await this.modal.create({
      component: ModalFiltrosPage
    });
    modal.onDidDismiss().then(() => {
          this.event.publish('post:filter');
    });
    return await modal.present();

  }

}
