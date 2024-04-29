import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Servicios.dart';

class Cdor_Servicios {
  final db = FirebaseFirestore.instance;

  Future<void> agregarServicio(String servicio) async {
    Servicios nuevoServicio = Servicios(
        servicio: servicio);

    await db.collection('Servicios').add(nuevoServicio.toMap());
  }
  

  Future<List<Servicios>> obtenerServicios() async {
    QuerySnapshot querySnapshot = await db.collection('Servicios').get();
    return querySnapshot.docs
        .map((doc) => Servicios.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}