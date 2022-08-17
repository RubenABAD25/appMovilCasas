import "dart:convert";

Casa casaFromJson(String str) => Casa.fromJson(json.decode(str));

String casaToJson(Casa data) => json.encode(data.toJson());

class Casa {
  Casa({
    this.descripcion,
    this.precio,
    this.imagen,
  });

  String? descripcion;
  String? precio;
  String? imagen;

  factory Casa.fromJson(Map<String, dynamic> json) => Casa(
        descripcion: json["descripcion"],
        precio: json["precio"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "precio": precio,
        "imagen": imagen,
      };
}
