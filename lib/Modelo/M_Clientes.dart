class Clientes {
  String nombres;
  String apellidos;
  String telefono;
  int edad;
  String sexo;

  Clientes(
      {required this.nombres,
      required this.apellidos,
      required this.telefono,
      required this.edad,
      required this.sexo});

  Map<String, dynamic> toMap() {
    return {
      'nombres': nombres,
      'apellidos': apellidos,
      'telefono': telefono,
      'edad': edad,
      'sexo': sexo,
    };
  }
}
