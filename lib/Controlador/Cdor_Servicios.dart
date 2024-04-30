import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Servicios.dart';

class Cdor_Servicios {
  final db = FirebaseFirestore.instance;

  Future<void> agregarServicio(String servicio) async {
    var id = db.collection('Servicios').doc().id;
    Servicios nuevoServicio = Servicios(id: id, servicio: servicio);

    await db.collection('Servicios').doc(id).set(nuevoServicio.toMap());
  }

  Future<List<Servicios>> obtenerServicios() async {
    QuerySnapshot querySnapshot = await db.collection('Servicios').get();
    return querySnapshot.docs
        .map((doc) =>
            Servicios.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Servicios>> listarServicios() async {
    List<Servicios> servicios = [];
    CollectionReference serviciosRef = db.collection('Servicios');
    QuerySnapshot queryServicios = await serviciosRef.get();

    queryServicios.docs.forEach((servicio) {
      servicios.add(Servicios.fromMap(
          servicio.id, servicio.data() as Map<String, dynamic>));
    });
    return servicios;
  }

  Future<void> eliminarServicio(String id) async {
    await db.collection('Servicios').doc(id).delete();
  }
}
