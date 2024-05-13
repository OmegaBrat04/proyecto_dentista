import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Vista/Editar_Citas.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Citas.dart';
import 'package:proyecto_dentista/Services/AlertDialogService.dart';

class VistaLCitas extends StatefulWidget {
  const VistaLCitas({super.key});

  @override
  State<VistaLCitas> createState() => _VistaLCitasState();
}

class _VistaLCitasState extends State<VistaLCitas> {
  String? dropdownValue;
  AlertDialogService alerta = AlertDialogService();
  Cdor_Citas controlador = Cdor_Citas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEB5FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEB5FF),
        title: const Text(
          'Consulta Citas',
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
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
                    "Plazo",
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFEFEDF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                iconSize: 55,
                isExpanded: true,
                underline: const SizedBox(),
                value: dropdownValue,
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                      value: "Diario",
                      child: Text(
                        "Diario",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                        ),
                      )),
                  DropdownMenuItem<String>(
                      value: "Semanal",
                      child: Text(
                        "Semanal",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                        ),
                      )),
                  DropdownMenuItem<String>(
                      value: "Mensual",
                      child: Text(
                        "Mensual",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                        ),
                      )),
                ],
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                    //padding: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFBDE3FF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 3, color: const Color(0xFF5571FF))),
                    child: FutureBuilder(
                        future: controlador.listarCitas(dropdownValue ?? ''),
                        builder: (((context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(snapshot.data![index].Cliente,
                                      style: const TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  subtitle: Text(
                                      '${snapshot.data![index].Fecha.toDate().toString().split(' ')[0]} ${snapshot.data![index].Hora}'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Image.asset(
                                          'images/Icono Editar.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () async {
                                          final resultado =
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditarCitas(
                                                            cita: snapshot
                                                                .data![index],
                                                          )));
                                          if (resultado == true) {
                                            setState(() {});
                                          }
                                        },
                                      ),
                                      IconButton(
                                        icon: Image.asset(
                                          'images/Eliminar Icono.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () async {
                                          final confirmar = await alerta
                                              .advertenciaEliminar(context);
                                          if (confirmar == true) {
                                            await controlador.eliminarCita(
                                                snapshot.data![index].id);
                                            setState(() {});
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }))))),
            const SizedBox(
              height: 10,
            ),
            const Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ganancia Generada",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
            const SizedBox(
              height: 6,
            ),
            FutureBuilder<double>(
                future: controlador.sumaMontos(dropdownValue ?? ''),
                builder:
                    (BuildContext context, AsyncSnapshot<double> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFFEFEDF),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      controller: TextEditingController(
                          text: '\$' + '${snapshot.data}'),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
