class Citas{

  String Cliente;
  String Servicio;
  String Fecha;
  String Hora;
  double Monto;

  Citas(
      {required this.Cliente,
      required this.Servicio,
      required this.Fecha,
      required this.Hora,
      required this.Monto});

  Map<String, dynamic> toMap() {
    return {
      'Cliente': Cliente,
      'Servicio': Servicio,
      'Fecha': Fecha,
      'Hora': Hora,
      'Monto': Monto,
    };
  }

}