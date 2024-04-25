import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_dentista/Modelo/M_Clientes.dart';

class Cdor_Clientes {
  final db = FirebaseFirestore.instance;

  Future<void> agregarCliente(String nombres, String apellidos, String telefono,
      int edad, String sexo) async {
    Clientes nuevoCliente = Clientes(
        nombres: nombres,
        apellidos: apellidos,
        telefono: telefono,
        edad: edad,
        sexo: sexo);

    await db.collection('Clientes').add(nuevoCliente.toMap());
  }
  
}
