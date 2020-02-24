import { Component, OnInit } from '@angular/core';
import {RequestAPI} from '../../services/RequestAPI';
import {ModalController} from '@ionic/angular';
import {Router} from '@angular/router';

@Component({
  selector: 'app-modal-filtros',
  templateUrl: './modal-filtros.page.html',
  styleUrls: ['./modal-filtros.page.scss'],
})
export class ModalFiltrosPage implements OnInit {
  categorias = [];
  constructor(
      private http: RequestAPI,
      private modal: ModalController,
      private route: Router
  ) { }

  ngOnInit() {
    this.http.get('blog/category/').subscribe( (response: any) => {
      this.categorias = response.results;
    });
  }

  closeModal() {
    this.modal.dismiss();
  }
  redirect(url: string) {
    this.route.navigateByUrl('/tabs/tab3/' + url);
    this.closeModal();
  }

}
