class ModelLegends {
  String nomenclatura = '';
  String descripcion = '';

  ModelLegends({required this.nomenclatura, required this.descripcion});

  ModelLegends.fromJson(Map<String, dynamic> json) {
    nomenclatura = json['nomenclatura'];
    descripcion = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomenclatura'] = this.nomenclatura;
    data['descripcion'] = this.descripcion;
    return data;
  }
}
