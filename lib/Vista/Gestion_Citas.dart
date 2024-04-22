import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Vista/A%C3%B1adir_Citas.dart';
import 'package:proyecto_dentista/Vista/Consulta_Citas.dart';

class GCitas extends StatefulWidget {
  const GCitas({super.key});

  @override
  State<GCitas> createState() => _GCitasState();
}

class _GCitasState extends State<GCitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);

            },
            icon: const Icon(Icons.arrow_back, size: 38)),
        title: const Text(
          "    Gestion de Citas",
          style: TextStyle(
            fontFamily:"LatoBlack",
            fontSize: 30.0,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor:  const Color(0xFFFEB5FF),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFFEB5FF),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(34.0),
             child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AnadirCitas()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/Prototipo Proyecto 4to Semestre Final.png', 
                        width: 40,
                        height: 40, 
                      ),
                      const SizedBox(
                          width: 50), 
                      const Text(
                        'Añadir Citas',
                        style: TextStyle(
                          fontFamily:"Lato",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VistaLCitas()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/Prototipo Proyecto 4to Semestre Final (1).png', 
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                          width: 35),
                      const Text(
                        'Consultar Citas',
                        style: TextStyle(
                          fontFamily:"Lato",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
