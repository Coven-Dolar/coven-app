class ModelMarket {
  String par = "";
  String precio = "";
  String movilidad = "";
  String nombre = "";

  ModelMarket(
      {required this.par,
      required this.precio,
      required this.movilidad,
      required this.nombre});

  ModelMarket.fromJson(Map<String, dynamic> json) {
    par = json["par"];
    precio = json["precio"];
    movilidad = json["movilidad"];
    nombre = json["nombre"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["par"] = this.par;
    data["precio"] = this.precio;
    data["movilidad"] = this.movilidad;
    data["nombre"] = this.nombre;
    return data;
  }
}
