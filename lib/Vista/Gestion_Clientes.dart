import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Vista/A%C3%B1adir_Clientes.dart';
import 'package:proyecto_dentista/Vista/Consulta_Clientes.dart';

class GC extends StatefulWidget {
  const GC({super.key});

  @override
  State<GC> createState() => _GCState();
}

class _GCState extends State<GC> {
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
          "Gestion de Clientes",
          style: TextStyle(
            fontFamily:"LatoBlack",
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
          Padding(
            padding: const EdgeInsets.all(34.0),
             child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  AC()));
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
                          width: 40), 
                      const Text(
                        'Añadir Clientes',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  CC()));
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
                          width: 30),
                      const Text(
                        'Consultar Clientes',
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
