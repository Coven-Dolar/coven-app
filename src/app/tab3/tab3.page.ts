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
      titulo: "Juan Guaidó: “En los próximos días estaré regresando al país",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "https://primicia.com.ve/wp-content/uploads/2019/05/juan-guaido%CC%81-730x524.jpg",
      resumen: "Estando en el Miami Airport Convention Center, el diputado Juan Guaidó le expresó a los" +
          "venezolanos que residen en Doral que “no estamos solos”.",
      fecha_creacion: "2020-02-01",
      cantidad_visitas: 23
    },
    {
      titulo: "Jg hhgfdsf dfgfhsdf dhdfas estaré regresando al país",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "https://primicia.com.ve/wp-content/uploads/2019/05/juan-guaido%CC%81-730x524.jpg",
      resumen: "Estando en el Miami Airport Convention Center, el diputado Juan Guaidó le expresó a los" +
          "venezolanos que residen en Doral que “no estamos solos”.",
      fecha_creacion: "2020-02-01",
      cantidad_visitas: 23
    },
    {
      titulo: "df dhgfd awqr4rfdfs días estaré regresando al país",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "https://primicia.com.ve/wp-content/uploads/2019/05/juan-guaido%CC%81-730x524.jpg",
      resumen: "Estando en el Miami Airport Convention Center, el diputado Juan Guaidó le expresó a los" +
          "venezolanos que residen en Doral que “no estamos solos”.",
      fecha_creacion: "2020-02-01",
      cantidad_visitas: 23
    },
    {
      titulo: "sdfs f gdf dfsgfhEn los próximos días estaré regresando al país",
      url: "juan-guaido-en-los-proximos-dias-estare-regresando-al-pais",
      foto_principal: "https://primicia.com.ve/wp-content/uploads/2019/05/juan-guaido%CC%81-730x524.jpg",
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
