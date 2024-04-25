class Servicios {
  int id;
  String servicio;

  Servicios({required this.id, required this.servicio});

  Map<String, dynamic> toMap() {
    return {
      'servicio': servicio,
    };
  }
}
