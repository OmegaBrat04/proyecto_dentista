import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Material.dart';

class Cdor_Material {
  final db = FirebaseFirestore.instance;

  Future<void> agregarMaterial(
      String nombre, int cantidad, double precioU) async {
    var id = db.collection('Materiales').doc().id;
    Material nuevoMaterial =
        Material(id: id, nombre: nombre, cantidad: cantidad, precioU: precioU);

    await db.collection('Materiales').doc(id).set(nuevoMaterial.toMap());
  }

  Future<List<Material>> listarMateriales() async {
    List<Material> materiales = [];
    CollectionReference materialesRef = db.collection('Materiales');
    QuerySnapshot queryMateriales = await materialesRef.get();

    queryMateriales.docs.forEach((material) {
      materiales.add(Material.fromMap(
          material.id, material.data() as Map<String, dynamic>));
    });
    return materiales;
  }

  Future<void> actualizarStock(String id, int cantidad) async {
    await db
        .collection('Materiales')
        .doc(id)
        .update({'cantidad': FieldValue.increment(cantidad)});
  }

  double calcularGastoTotal(List<Material> materiales, List<int> contador) {
    double gastoTotal = 0;
    for (int i = 0; i < materiales.length; i++) {
      gastoTotal += materiales[i].precioU * contador[i];
    }
    return gastoTotal;
  }

  Future<double> actualizarGastoTotal(List<int> contador) async {
    List<Material> materiales = await listarMateriales();
    if (contador.length != materiales.length) {
      contador = materiales.map<int>((material) => material.cantidad).toList();
    }
    double gastoTotal = calcularGastoTotal(materiales, contador);
    return gastoTotal;
  }

  Future<void> eliminarMaterial(String id) async {
    await db.collection('Materiales').doc(id).delete();
  }
}
