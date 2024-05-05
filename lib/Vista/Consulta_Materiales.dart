import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Material.dart';
import 'package:proyecto_dentista/Services/AlertDialogService.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Citas.dart';
//import 'package:intl/intl.dart';

class VistaLMateriales extends StatefulWidget {
  const VistaLMateriales({super.key});

  @override
  State<VistaLMateriales> createState() => _VistaLMaterialesState();
}

class _VistaLMaterialesState extends State<VistaLMateriales> {
  AlertDialogService alerta = AlertDialogService();
  Cdor_Material controlador = Cdor_Material();
  Cdor_Citas controladorCitas = Cdor_Citas();
  String? dropdownValue;
  TextEditingController GastoController = TextEditingController();
  TextEditingController GananciaController = TextEditingController();
  List<int> contador = List<int>.filled(0, 0);

  @override
  void initState() {
    super.initState();
    actualizarGastoTotal();
  }

  void actualizarGastoTotal() async {
    double gastoTotal = await controlador.actualizarGastoTotal(contador);
    GastoController.text = gastoTotal.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEB5FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEB5FF),
        title: const Text(
          'Consulta Material',
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
                onChanged: (String? value) async {
                  setState(() {
                    dropdownValue = value;
                    actualizarGastoTotal();
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
                        future: controlador.listarMateriales(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            if (contador.length != snapshot.data?.length) {
                              contador = snapshot.data!
                                  .map<int>((material) => material.cantidad)
                                  .toList();
                            }
                    
                            if (dropdownValue != null) {
                              controladorCitas
                                  .calcularGananciaActualizada(dropdownValue!)
                                  .then((gananciaActualizada) {
                                GananciaController.text =
                                    gananciaActualizada.toString();
                              });
                            }
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(snapshot.data![index].nombre,
                                      style: const TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: 16,
                                      )),
                                  subtitle: Text(
                                    (snapshot.data![index].precioU *
                                            contador[index])
                                        .toString(),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (contador[index] > 0) {
                                                contador[index]--;
                                                controlador.actualizarStock(
                                                    snapshot.data![index].id,
                                                    -1);
                                                    actualizarGastoTotal();
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Text(
                                        contador[index].toString(),
                                        style: const TextStyle(
                                          fontFamily: "Lato",
                                          fontSize: 16,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              contador[index]++;
                                              controlador.actualizarStock(
                                                  snapshot.data![index].id, 1);
                                                  actualizarGastoTotal();
                                            });
                                          },
                                          icon: const Icon(Icons.add)),
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
                                            await controlador.eliminarMaterial(
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
                              child: CircularProgressIndicator(),
                            );
                          }
                        })))),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "Ganancia Actualizada",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Gasto Total",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: GananciaController,
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
                      ),
                    ),
                    const SizedBox(
                        width: 10),
                    Expanded(
                      child: TextField(
                        controller: GastoController,
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
