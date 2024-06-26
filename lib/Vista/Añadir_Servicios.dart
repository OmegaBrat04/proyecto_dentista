import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Services/AlertDialogService.dart';
import 'package:proyecto_dentista/Services/FormRequest.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Servicios.dart';

class AS extends StatefulWidget {
  const AS({super.key});

  @override
  State<AS> createState() => _ASState();
}

class _ASState extends State<AS> {
   TextEditingController servicioController = TextEditingController();
  final keyF = GlobalKey<FormState>();
  AlertDialogService alerta = AlertDialogService();
  Cdor_Servicios controlador = Cdor_Servicios();
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
          "Añadir Servicios",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: keyF,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),
                        const Text(
                          "Servicio",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: servicioController,
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
                ),
                const SizedBox(height: 300),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (keyF.currentState!.validate()) {
                        String servicio = servicioController.text;
                        await controlador.agregarServicio(servicio).then((_) {
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
                      backgroundColor: const Color.fromARGB(255, 85, 113, 255),
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
        ],
      ),
    );
  }
}
