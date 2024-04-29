import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Material.dart';

class Cdor_Material{

  final db = FirebaseFirestore.instance;

  Future<void> agregarMaterial(String nombre, int cantidad, double precioU) async {
    Material nuevoMaterial = Material(
        nombre: nombre,
        cantidad: cantidad,
        precioU: precioU);

    await db.collection('Materiales').add(nuevoMaterial.toMap());
  }

}