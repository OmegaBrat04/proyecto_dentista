import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Citas.dart';

class Cdor_Citas {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> agregarCita(String cliente, String servicio, String fecha,
      String hora, double monto) async {
        var id = db.collection('Citas').doc().id;
    Citas nuevaCita = Citas(
        id: id,
        Cliente: cliente,
        Servicio: servicio,
        Fecha: fecha,
        Hora: hora,
        Monto: monto);

    await db.collection('Citas').doc(id).set(nuevaCita.toMap());
  }
}
