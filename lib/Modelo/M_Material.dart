class Material {
  String nombre;
  int cantidad;
  double precioU;

  Material(
      {required this.nombre, required this.cantidad, required this.precioU});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'cantidad': cantidad,
      'precioU': precioU,
    };
  }
}
