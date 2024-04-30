class Servicios {
  
  String id;
  String servicio;

  Servicios({required this.id, required this.servicio});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'servicio': servicio,
    };
  }

  factory Servicios.fromMap(String id, Map<String, dynamic> map) {
    return Servicios(
      id: id,
      servicio: map['servicio'],
    );
  }
}
