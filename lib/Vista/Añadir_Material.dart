import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Material.dart';
import 'package:proyecto_dentista/Services/FormRequest.dart';
import 'package:proyecto_dentista/Services/AlertDialogService.dart';

class AM extends StatefulWidget {
  const AM({super.key});

  @override
  State<AM> createState() => _AMState();
}

class _AMState extends State<AM> {
  final keyF = GlobalKey<FormState>();
  AlertDialogService alerta = AlertDialogService();
  Cdor_Material controlador = Cdor_Material();
  Validador validador = Validador();
  TextEditingController nombreController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController precioUController = TextEditingController();

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
          "Añadir Material",
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
            child: Form(
              key: keyF,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nombre",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: nombreController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 254, 254, 223),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (value) {
                            return Validador.validarTexto(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Cantidad",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: cantidadController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 254, 254, 223),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (value) {
                            return Validador.validarNumero(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Precio Unitario",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: precioUController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 254, 254, 223),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (value) {
                            return Validador.validarNumero(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 125),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (keyF.currentState!.validate()) {
                          String nombre = nombreController.text;
                          int cantidad = int.parse(cantidadController.text);
                          double precioU = double.parse(precioUController.text);
                          await controlador
                              .agregarMaterial(nombre, cantidad, precioU)
                              .then((_) {
                            alerta.mostrarAlertaExitosa(context).then((_) {
                              Navigator.pop(context);
                            });
                          }).catchError((error) {
                            alerta.mostrarAlertaError(context,
                                "La informacion no se logro guardar correctamente");
                          });
                        } else {
                          alerta.mostrarAlertaError(context,
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 55),
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
                          const SizedBox(width: 55),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
