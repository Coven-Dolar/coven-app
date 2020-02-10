import { Component } from '@angular/core';
import {Router} from '@angular/router';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss']
})
export class Tab3Page {
  noticias = [
    {
      titulo: "Código QR del Carnet de la Patria identificará necesidades del Pueblo",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "../assets/images/venezuela.jpeg",
      resumen: "Estando en el Miami Airport Convention Center, el diputado Juan Guaidó le expresó a los" +
          "venezolanos que residen en Doral que “no estamos solos”.",
      fecha_creacion: "2020-02-01",
      cantidad_visitas: 23
    },
    {
      titulo: "Juan Guaidó: “En los próximos días estaré regresando al país",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "../assets/images/venezuela.jpeg",
      resumen: "Estando en el Miami Airport Convention Center, el diputado Juan Guaidó le expresó a los" +
          "venezolanos que residen en Doral que “no estamos solos”.",
      fecha_creacion: "2020-02-01",
      cantidad_visitas: 23
    },
    {
      titulo: "Analizan cambios en los planes sociales: deberán trabajar para cobrar un salario mínimo.",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "../assets/images/venezuela.jpeg",
      resumen: "Estando en el Miami Airport Convention Center, el diputado Juan Guaidó le expresó a los" +
          "venezolanos que residen en Doral que “no estamos solos”.",
      fecha_creacion: "2020-02-01",
      cantidad_visitas: 23
    },
    {
      titulo: "sdfs f gdf dfsgfhEn los próximos días estaré regresando al país",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "../assets/images/venezuela.jpeg",
      resumen: "Estando en el Miami Airport Convention Center, el diputado Juan Guaidó le expresó a los" +
          "venezolanos que residen en Doral que “no estamos solos”.",
      fecha_creacion: "2020-02-01",
      cantidad_visitas: 23
    }
  ];
  constructor(
      private route: Router,
  ) {}

  abrirNoticia(url: string) {
    this.route.navigate(['/tabs/tab3/noticia', url]);
  }

}
