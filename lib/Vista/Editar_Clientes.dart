import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Clientes.dart';
import 'package:proyecto_dentista/Modelo/M_Clientes.dart';
import 'package:proyecto_dentista/Services/AlertDialogService.dart';
import 'package:proyecto_dentista/Services/FormRequest.dart';

class EC extends StatefulWidget {
  final Clientes? cliente;
  const EC({super.key, this.cliente});

  @override
  State<EC> createState() => _ECState();
}

class _ECState extends State<EC> {
  final keyF = GlobalKey<FormState>();
  Validador formRequest = Validador();
  final dialogosAlerta = AlertDialogService();
  String? dropdownValue;
  Cdor_Clientes controlador = Cdor_Clientes();
  final nombreC = TextEditingController();
  final apellidoC = TextEditingController();
  final telefonoC = TextEditingController();
  final edadC = TextEditingController();
  final sexoC = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.cliente != null) {
      nombreC.text = widget.cliente!.nombres;
      apellidoC.text = widget.cliente!.apellidos;
      telefonoC.text = widget.cliente!.telefono;
      edadC.text = widget.cliente!.edad.toString();
      dropdownValue = widget.cliente!.sexo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded, size: 38)),
        centerTitle: true,
        title: const Text(
          "Editar Clientes",
          style: TextStyle(
              fontFamily: "LatoBlack",
              fontSize: 30.0,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFEB5FF),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFFEB5FF),
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(34.0),
              child: Form(
                key: keyF,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Nombre(s)",
                                    style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 16,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    controller: nombreC,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 254, 254, 223),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    validator: ((value) =>
                                        Validador.validarTexto(value)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Apellidos",
                                    style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 16,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    controller: apellidoC,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 254, 254, 223),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    validator: ((value) =>
                                        Validador.validarTexto(value)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Telefono",
                                    style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 16,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    controller: telefonoC,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 254, 254, 223),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    validator: ((value) =>
                                        Validador.validarNumero(value)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Edad",
                                    style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 16,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    controller: edadC,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 254, 254, 223),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    validator: ((value) =>
                                        Validador.validarNumero(value)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sexo",
                                    style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 16,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    height: 70,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEFEDF),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      iconSize: 50,
                                      isExpanded: true,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      value: dropdownValue,
                                      items: const <DropdownMenuItem<String>>[
                                        DropdownMenuItem<String>(
                                            value: "Masculino",
                                            child: Text(
                                              "Masculino",
                                              style: TextStyle(
                                                fontFamily: "Lato",
                                                fontSize: 15,
                                              ),
                                            )),
                                        DropdownMenuItem<String>(
                                            value: "Femenino",
                                            child: Text(
                                              "Femenino",
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
                                      validator: (value) =>
                                          Validador.validarDropdown(value),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (keyF.currentState!.validate()) {
                              String nombre = nombreC.text;
                              String apellidos = apellidoC.text;
                              String telefono = telefonoC.text;
                              if (dropdownValue != null &&
                                  edadC.text.isNotEmpty) {
                                int edad = int.parse(edadC.text);
                                await controlador
                                    .modificarCliente(
                                        widget.cliente!.id,
                                        nombre,
                                        apellidos,
                                        telefono,
                                        edad,
                                        dropdownValue!)
                                    .then((_) {
                                  dialogosAlerta
                                      .mostrarAlertaExitosa(context)
                                      .then((_) {
                                    Navigator.pop(context, true);
                                  });
                                }).catchError((error) {
                                  dialogosAlerta.mostrarAlertaError(context,
                                      "La informacion no se logro guardar correctamente");
                                });
                              } else {
                                dialogosAlerta.mostrarAlertaError(context,
                                    "Asegurese de llenar todos los campos correctamente.");
                              }
                            } else {
                              dialogosAlerta.mostrarAlertaError(context,
                                  "Asegurese de llenar todos los campos correctamente.");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 85, 113, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/Imagen Guardar.png',
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'GUARDAR',
                                style: TextStyle(
                                  fontFamily: "LatoBlack",
                                  color: Color.fromARGB(255, 254, 254, 223),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
