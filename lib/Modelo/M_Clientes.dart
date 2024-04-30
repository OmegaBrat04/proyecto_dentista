class Clientes {
  String id;
  String nombres;
  String apellidos;
  String telefono;
  int edad;
  String sexo;

  Clientes(
      {required this.id,
      required this.nombres,
      required this.apellidos,
      required this.telefono,
      required this.edad,
      required this.sexo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombres': nombres,
      'apellidos': apellidos,
      'telefono': telefono,
      'edad': edad,
      'sexo': sexo,
    };
  }

  factory Clientes.fromMap(String id, Map<String, dynamic> map) {
    return Clientes(
      id: id,
      nombres: map['nombres'],
      apellidos: map['apellidos'],
      telefono: map['telefono'],
      edad: map['edad'],
      sexo: map['sexo'],
    );
  }
}
