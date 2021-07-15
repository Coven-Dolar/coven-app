class ModelCategory {
  String categoria = '';
  String url = '';
  int totalArticulos = 0;

  ModelCategory(
      {required this.categoria,
      required this.url,
      required this.totalArticulos});

  ModelCategory.fromJson(Map<String, dynamic> json) {
    categoria = json['categoria'];
    url = json['url'];
    totalArticulos = json['total_articulos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoria'] = this.categoria;
    data['url'] = this.url;
    data['total_articulos'] = this.totalArticulos;
    return data;
  }
}
