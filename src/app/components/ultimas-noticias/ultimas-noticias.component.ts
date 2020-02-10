import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';

@Component({
  selector: 'app-ultimas-noticias',
  templateUrl: './ultimas-noticias.component.html',
  styleUrls: ['./ultimas-noticias.component.scss'],
})
export class UltimasNoticiasComponent implements OnInit {
  slideOpts = {
    initialSlide: 0,
    speed: 400
  };
  noticias = [
    {
      foto_principal: '../assets/images/venezuela.jpeg',
      titulo: 'Analizan cambios en los planes sociales: deberán trabajar para cobrar un salario mínimo.',
      resumen: 'sasdas da dasdasd ssg f adgfdsagdgff sf afa ad fadf dfa sdfasdf asdf asdfas fas fsdf asdf asfasdf sdf fas fds fdsf adf',
      url: '',
    },
    {
      foto_principal: '../assets/images/venezuela.jpeg',
      titulo: 'Analizan cambios en los planes sociales: deberán trabajar para cobrar un salario mínimo.',
      resumen: 'sasdas da dasdasd ssg f adgfdsagdgff sf afa ad fadf dfa sdfasdf asdf asdfas fas fsdf asdf asfasdf sdf fas fds fdsf adf',
      url: '',
    },
    {
      foto_principal: '../assets/images/venezuela.jpeg',
      titulo: 'Analizan cambios en los planes sociales: deberán trabajar para cobrar un salario mínimo.',
      resumen: 'sasdas da dasdasd ssg f adgfdsagdgff sf afa ad fadf dfa sdfasdf asdf asdfas fas fsdf asdf asfasdf sdf fas fds fdsf adf',
      url: '',
    }
  ];
  constructor(private route: Router) { }

  ngOnInit() {}
  abrirNoticia(url: string) {
    this.route.navigate(['/tabs/tab3/noticia', url]);
  }

}
