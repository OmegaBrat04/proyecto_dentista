import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_dentista/Modelo/M_Citas.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Material.dart';
import 'package:proyecto_dentista/Modelo/M_Material.dart';

class Cdor_Citas {
  FirebaseFirestore db = FirebaseFirestore.instance;
  Cdor_Material controladorMaterial = Cdor_Material();

  Future<void> agregarCita(String cliente, String servicio, Timestamp fecha,
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

  Future<List<Citas>> listarCitas(String periodo) async {
    QuerySnapshot querySnapshot = await db.collection('Citas').get();
    List<Citas> citas = querySnapshot.docs
        .map((doc) => Citas.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();

    List<Citas> filtroCitas;
    switch (periodo) {
      case 'Diario':
        DateTime hoy = DateTime.now();
        DateTime inicio = DateTime(hoy.year, hoy.month, hoy.day);
        filtroCitas =
            citas.where((cita) => cita.Fecha.toDate().isAfter(inicio)).toList();
        break;
      case 'Semanal':
        DateTime semana = DateTime.now().subtract(const Duration(days: 7));
        filtroCitas =
            citas.where((cita) => cita.Fecha.toDate().isAfter(semana)).toList();
        break;
      case 'Mensual':
        DateTime mes = DateTime.now().subtract(const Duration(days: 30));
        filtroCitas =
            citas.where((cita) => cita.Fecha.toDate().isAfter(mes)).toList();
        break;
      default:
        filtroCitas = citas;
    }
    return filtroCitas;
  }

  Future<void> eliminarCita(String id) async {
    await db.collection('Citas').doc(id).delete();
  }

  Future<double> sumaMontos(String periodo) async {
    QuerySnapshot querySnapshot = await db.collection('Citas').get();
    List<Citas> citas = querySnapshot.docs
        .map((doc) => Citas.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
    List<Citas> filtroCitas;
    switch (periodo) {
      case 'Diario':
        DateTime hoy = DateTime.now();
        DateTime inicio = DateTime(hoy.year, hoy.month, hoy.day);
        filtroCitas =
            citas.where((cita) => cita.Fecha.toDate().isAfter(inicio)).toList();
        break;
      case 'Semanal':
        DateTime semana = DateTime.now().subtract(const Duration(days: 7));
        filtroCitas =
            citas.where((cita) => cita.Fecha.toDate().isAfter(semana)).toList();
        break;
      case 'Mensual':
        DateTime mes = DateTime.now().subtract(const Duration(days: 30));
        filtroCitas =
            citas.where((cita) => cita.Fecha.toDate().isAfter(mes)).toList();
        break;
      default:
        filtroCitas = citas;
    }
    double total = 0;
    for (var i = 0; i < filtroCitas.length; i++) {
      total += filtroCitas[i].Monto;
    }
    return total;
  }

  Future<double> calcularGananciaActualizada(String plazo) async {
    double ganancia = await sumaMontos(plazo);
    List<Material> materiales = await controladorMaterial.listarMateriales();
    List<int> contador =
        materiales.map<int>((material) => material.cantidad).toList();
    double gastoTotal =
        controladorMaterial.calcularGastoTotal(materiales, contador);
    return ganancia - gastoTotal;
  }

  Future<void> modificarCita(String id, String cliente, String servicio,
      Timestamp fecha, String hora, double monto) async {
    Citas citaModificada = Citas(
        id: id,
        Cliente: cliente,
        Servicio: servicio,
        Fecha: fecha,
        Hora: hora,
        Monto: monto);

    await db.collection('Citas').doc(id).update(citaModificada.toMap());
  }
}
