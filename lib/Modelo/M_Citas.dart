import 'package:cloud_firestore/cloud_firestore.dart';

class Citas{

  String id;
  String Cliente;
  String Servicio;
  Timestamp Fecha;
  String Hora;
  double Monto;

  Citas(
      {
      required this.id,
      required this.Cliente,
      required this.Servicio,
      required this.Fecha,
      required this.Hora,
      required this.Monto});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Cliente': Cliente,
      'Servicio': Servicio,
      'Fecha': Fecha,
      'Hora': Hora,
      'Monto': Monto,
    };
  }

  factory Citas.fromMap(String id, Map<String, dynamic> map) {
    return Citas(
        id: id,
        Cliente: map['Cliente'],
        Servicio: map['Servicio'],
        Fecha: map['Fecha'],
        Hora: map['Hora'],
        Monto: map['Monto']);
  }

}