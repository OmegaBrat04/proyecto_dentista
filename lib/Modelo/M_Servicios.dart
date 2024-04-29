class Servicios {
  
  String servicio;

  Servicios({required this.servicio});

  Map<String, dynamic> toMap() {
    return {
      'servicio': servicio,
    };
  }

  factory Servicios.fromMap(Map<String, dynamic> map) {
    return Servicios(
      servicio: map['servicio'],
    );
  }
}
