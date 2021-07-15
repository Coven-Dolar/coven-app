class ModelNews {
  int id = 0;
  String usuario = "";
  String categoria = "";
  String fotoPrincipal = "";
  String fotoMiniatura = "";
  String titulo = "";
  String url = "";
  String fechaCreacion = "";
  String descripcion = "";
  String resumen = "";

  ModelNews(
      {required this.id,
      required this.usuario,
      required this.categoria,
      required this.fotoPrincipal,
      required this.fotoMiniatura,
      required this.titulo,
      required this.url,
      required this.fechaCreacion,
      required this.descripcion,
      required this.resumen});

  ModelNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    categoria = json['categoria'];
    fotoPrincipal = json['foto_principal'];
    fotoMiniatura = json['foto_miniatura'];
    titulo = json['titulo'];
    url = json['url'];
    fechaCreacion = json['fecha_creacion'];
    descripcion = json['descripcion'];
    resumen = json['resumen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario'] = this.usuario;
    data['categoria'] = this.categoria;
    data['foto_principal'] = this.fotoPrincipal;
    data['foto_miniatura'] = this.fotoMiniatura;
    data['titulo'] = this.titulo;
    data['url'] = this.url;
    data['fecha_creacion'] = this.fechaCreacion;
    data['descripcion'] = this.descripcion;
    data['resumen'] = this.resumen;
    return data;
  }
}
