import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Vista/Editar_Clientes.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Clientes.dart';
import 'package:proyecto_dentista/Services/AlertDialogService.dart';

class CC extends StatefulWidget {
  const CC({Key? key}) : super(key: key);

  @override
  State<CC> createState() => _CCState();
}

class _CCState extends State<CC> {
  AlertDialogService alerta = AlertDialogService();
  Cdor_Clientes controlador = Cdor_Clientes();
  String? nombreCompleto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, size: 38),
        ),
        centerTitle: true,
        title: const Text(
          "Consulta Clientes",
          style: TextStyle(
            fontFamily: "LatoBlack",
            fontSize: 30.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFEB5FF),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFFEB5FF), // Fondo con color deseado
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFBDE3FF), // Color del Container
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: const Color(0xFF5571FF)),
                ),
                child: FutureBuilder(
                    future: controlador.listarClientes(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            nombreCompleto =
                                "${snapshot.data![index].nombres} ${snapshot.data![index].apellidos}";
                            return ListTile(
                              title: Text(
                                nombreCompleto ?? "",
                                style: const TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      'images/Icono Editar.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EC()));
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
                                        await controlador.eliminarCliente(
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
                    }))),
          ),
        ],
      ),
    );
  }
}
