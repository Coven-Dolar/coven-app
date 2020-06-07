import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {formatDate} from '@angular/common';
import {ModalFiltrosPage} from '../../modal/modal-filtros/modal-filtros.page';
import {Events} from '../../services/events';
import {PopoverController} from '@ionic/angular';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  @Input() showFilter = false;
  @Output() execRefresh = new EventEmitter();
  today = new Date();
  jstoday: string;

  constructor(
      private modal: PopoverController,
      private event: Events,
  ) { }

  ngOnInit() {
    this.jstoday = formatDate(this.today, 'dd-MM-yyyy hh:mm:ss a', 'en-US', '+0530');
  }

  async openModalFilter() {
    const modal = await this.modal.create({
      component: ModalFiltrosPage,
      cssClass: 'modal-filter',
    });
    modal.onDidDismiss().then(() => {
      this.event.publish('post:filter', '');
    });
    return await modal.present();

  }

  makeRefresh() {
    this.execRefresh.emit();
  }

}
