import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Material.dart';

class Cdor_Material{

  final db = FirebaseFirestore.instance;

  Future<void> agregarMaterial(String nombre, int cantidad, double precioU) async {

    var id = db.collection('Materiales').doc().id;
    Material nuevoMaterial = Material(
        id: id,
        nombre: nombre,
        cantidad: cantidad,
        precioU: precioU);

    await db.collection('Materiales').doc(id).set(nuevoMaterial.toMap());
  }

}