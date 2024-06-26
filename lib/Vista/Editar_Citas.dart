import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Citas.dart';
import 'package:proyecto_dentista/Modelo/M_Citas.dart';
import 'package:proyecto_dentista/Modelo/M_Clientes.dart';
import 'package:proyecto_dentista/Modelo/M_Servicios.dart';
import 'package:proyecto_dentista/Services/AlertDialogService.dart';
import 'package:proyecto_dentista/Services/FormRequest.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Clientes.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Servicios.dart';

class EditarCitas extends StatefulWidget {
  final Citas? cita;
  const EditarCitas({super.key, this.cita});

  @override
  State<EditarCitas> createState() => _AnadirCitasState();
}

class _AnadirCitasState extends State<EditarCitas> {
  Validador validador = Validador();
  final dialogosAlerta = AlertDialogService();
  Cdor_Citas controlador = Cdor_Citas();
  Cdor_Clientes controladorClientes = Cdor_Clientes();
  Cdor_Servicios controladorServicios = Cdor_Servicios();

  final keyF = GlobalKey<FormState>();
  DateTime? FechaSeleccionada;
  TimeOfDay? HoraSeleccionada;
  String? dropdownValue;
  String? dropdownValue2;
  String? nombreCompleto;

  final fechaController = TextEditingController();
  final horaController = TextEditingController();
  final montoController = TextEditingController();


  @override
  void initState(){
    super.initState();
    if(widget.cita != null){
      dropdownValue = widget.cita!.Cliente;
      dropdownValue2 = widget.cita!.Servicio;
      fechaController.text = DateFormat('yyyy-MM-dd').format(widget.cita!.Fecha.toDate());
      horaController.text = widget.cita!.Hora;
      montoController.text = widget.cita!.Monto.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    //fechaController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        controladorClientes.obtenerClientes(),
        controladorServicios.obtenerServicios(),
      ]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Color(0xFFFEB5FF),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: const Color(0xFFFEB5FF),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          List<Clientes> clientes = snapshot.data![0] as List<Clientes>;
          List<Servicios> servicios = snapshot.data![1] as List<Servicios>;
          return Scaffold(
            backgroundColor: const Color(0xFFFEB5FF),
            appBar: AppBar(
              backgroundColor: const Color(0xFFFEB5FF),
              title: const Text(
                'Registrar Citas',
                style: TextStyle(
                    fontFamily: "LatoBlack",
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 38,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: keyF,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cliente",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEFEDF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButtonFormField<String>(
                          iconSize: 45,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          value: dropdownValue,
                          items: clientes.map<DropdownMenuItem<String>>(
                              (Clientes cliente) {
                            nombreCompleto =
                                '${cliente.nombres} ${cliente.apellidos}';
                            return DropdownMenuItem<String>(
                              value: nombreCompleto,
                              child: Text(
                                nombreCompleto!,
                                style: const TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                          validator: (value) =>
                              Validador.validarDropdown(value),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Servicio",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEFEDF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButtonFormField<String>(
                          iconSize: 45,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          value: dropdownValue2,
                          items: servicios.map<DropdownMenuItem<String>>(
                              (Servicios servicio) {
                            return DropdownMenuItem<String>(
                              value: servicio.servicio,
                              child: Text(
                                ' ${servicio.servicio}',
                                style: const TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue2 = value;
                            });
                          },
                          validator: (value) =>
                              Validador.validarDropdown(value),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fecha",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: fechaController,
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "Pulsa para seleccionar fecha",
                            hintStyle: const TextStyle(
                              fontFamily: "Lato",
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFFEFEDF)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hora",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: horaController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Seleccione una hora",
                          hintStyle: const TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFEFEDF),
                        ),
                        onTap: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: HoraSeleccionada ?? TimeOfDay.now(),
                          );
                          if (pickedTime != null &&
                              pickedTime != HoraSeleccionada) {
                            setState(() {
                              HoraSeleccionada = pickedTime;
                              horaController.text =
                                  HoraSeleccionada!.format(context);
                            });
                          }
                        },
                        validator: (value) =>
                            Validador.validarHora(horaController.text),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Monto cobrado",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: montoController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFEFEDF),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) =>
                            Validador.validarNumero(montoController.text),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5571FF),
                              elevation: 6),
                          onPressed: () async {
                            if (keyF.currentState!.validate()) {
                              String cliente = dropdownValue!;
                              String servicio = dropdownValue2!;
                              double monto = double.parse(montoController.text);

                              DateTime fechaLocal =
                                  DateTime.now();
                              DateTime fechaUtc = DateTime.utc(fechaLocal.year,
                                  fechaLocal.month, fechaLocal.day, 12);
                              Timestamp fechaS = Timestamp.fromDate(fechaUtc);
                              String horaS = horaController.text;

                              await controlador
                                  .modificarCita(widget.cita!.id, cliente, servicio,
                                      fechaS, horaS, monto)
                                  .then((_) {
                                dialogosAlerta
                                    .mostrarAlertaExitosa(context)
                                    .then((_) {
                                  Navigator.pop(context, true);
                                });
                              }).catchError((error) {
                                dialogosAlerta.mostrarAlertaError(context,
                                    "La Cita no se logro guardar correctamente");
                              });
                            } else {
                              dialogosAlerta.mostrarAlertaError(context,
                                  "Asegurese de llenar todos los campos correctamente.");
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/Imagen Guardar.png',
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Confirmar',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "LatoBlack",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
