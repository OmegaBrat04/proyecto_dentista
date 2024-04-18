import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const VentanaACliente());
}

class VentanaACliente extends StatelessWidget {
  const VentanaACliente({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Añadir Cliente',
        home: AnadirCliente());
  }
}

class AnadirCliente extends StatefulWidget {
  const AnadirCliente({super.key});

  @override
  State<AnadirCliente> createState() => _AnadirClienteState();
}

class _AnadirClienteState extends State<AnadirCliente> {
  DateTime? FechaSeleccionada;
  TimeOfDay? HoraSeleccionada;
  String? dropdownValue;
  final fechaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEB5FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEB5FF),
        title: const Text(
          'Añadir Citas',
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
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
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
                        value: "Opcion 1",
                        child: Text(
                          "Cliente 1",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                          ),
                        )),
                    DropdownMenuItem<String>(
                        value: "Opcion 2",
                        child: Text(
                          "Cliente 2",
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
                        value: "Opcion 1",
                        child: Text(
                          "Servicio 1",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                          ),
                        )),
                    DropdownMenuItem<String>(
                        value: "Opcion 2",
                        child: Text(
                          "Servicio 2",
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
                onTap: () async {
                  final DateTime? fecha = await showDatePicker(
                      context: context,
                      initialDate: FechaSeleccionada ?? DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2050));
                  if (fecha != null && fecha != FechaSeleccionada) {
                    setState(() {
                      FechaSeleccionada = fecha;
                      fechaController.text =
                          DateFormat('yyyy-MM-dd').format(FechaSeleccionada!);
                    });
                  }
                },
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
                readOnly: true,
                decoration: InputDecoration(
                  labelText: HoraSeleccionada == null
                      ? 'Selecciona una hora'
                      : HoraSeleccionada?.format(context),
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
                  if (pickedTime != null && pickedTime != HoraSeleccionada) {
                    setState(() {
                      HoraSeleccionada = pickedTime;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Monto a cobrar",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
              const SizedBox(
                height: 6,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFEFEDF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5571FF), elevation: 6),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/Imagen Guardar.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 10,),
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
    );
  }
}
