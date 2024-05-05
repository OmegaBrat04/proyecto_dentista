class Material {

  String id;
  String nombre;
  int cantidad;
  double precioU;

  Material(
      { required this.id, required this.nombre, required this.cantidad, required this.precioU});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'cantidad': cantidad,
      'precioU': precioU,
    };
  }

  factory Material.fromMap(String id, Map<String, dynamic> map) {
    return Material(
      id: id,
      nombre: map['nombre'],
      cantidad: map['cantidad'],
      precioU: map['precioU'],
    );
  }
}
