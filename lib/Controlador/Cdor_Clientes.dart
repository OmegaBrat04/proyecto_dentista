import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Clientes.dart';

class Cdor_Clientes {
  final db = FirebaseFirestore.instance;

  Future<void> agregarCliente(String nombres, String apellidos, String telefono,
      int edad, String sexo) async {
    var id = db.collection('Clientes').doc().id;
    Clientes nuevoCliente = Clientes(
        id: id,
        nombres: nombres,
        apellidos: apellidos,
        telefono: telefono,
        edad: edad,
        sexo: sexo);

    await db.collection('Clientes').doc(id).set(nuevoCliente.toMap());
  }

  Future<List<Clientes>> obtenerClientes() async {
    QuerySnapshot querySnapshot = await db.collection('Clientes').get();
    return querySnapshot.docs
        .map<Clientes>((doc) =>
            Clientes.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Clientes>> listarClientes() async {
    List<Clientes> clientes = [];
    CollectionReference clientesRef = db.collection('Clientes');
    QuerySnapshot queryClientes = await clientesRef.get();

    queryClientes.docs.forEach((cliente) {
      clientes.add(
          Clientes.fromMap(cliente.id, cliente.data() as Map<String, dynamic>));
    });
    return clientes;
  }

  Future<void> eliminarCliente(String id) async {
    await db.collection('Clientes').doc(id).delete();
  }

  Future<void> modificarCliente(String id, String nombres, String apellidos,
      String telefono, int edad, String sexo) async {
    Clientes clienteModificado = Clientes(
        id: id,
        nombres: nombres,
        apellidos: apellidos,
        telefono: telefono,
        edad: edad,
        sexo: sexo);

    await db.collection('Clientes').doc(id).update(clienteModificado.toMap());
  }

  Future<List<String>> listarNombresClientes() async {
    QuerySnapshot querySnapshot = await db.collection('Clientes').get();
    List<String> nombresClientes = querySnapshot.docs
        .map((doc) =>
            '${(doc.data() as Map<String, dynamic>)?['nombres']} ${(doc.data() as Map<String, dynamic>)?['apellidos']}')
        .toList();
    return nombresClientes;
  }
}
