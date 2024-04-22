import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Vista/EditarCitas.dart';
//import 'package:intl/intl.dart';

class VistaLCitas extends StatefulWidget {
  const VistaLCitas({super.key});

  @override
  State<VistaLCitas> createState() => _VistaLCitasState();
}

class _VistaLCitasState extends State<VistaLCitas> {
  String? dropdownValue;
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
                      value: "Opcion 1",
                      child: Text(
                        "Diario",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                        ),
                      )),
                  DropdownMenuItem<String>(
                      value: "Opcion 2",
                      child: Text(
                        "Semanal",
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
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("Cita $index"),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditarCitas())); 
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                  'images/Eliminar Icono.png',
                                  width: 30,
                                  height: 30,
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        );
                      },
                    ))),
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
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFEFEDF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
