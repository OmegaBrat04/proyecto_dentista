import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Vista/A%C3%B1adir_Material.dart';
import 'package:proyecto_dentista/Vista/Consulta_Materiales.dart';

class GM extends StatefulWidget {
  const GM({super.key});

  @override
  State<GM> createState() => _GMState();
}

class _GMState extends State<GM> {
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
          "Gestion de Material",
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
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 50),
             child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/Icono Material.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 125),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  AM()));
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
                        width: 60,
                        height: 60, 
                      ),
                      const SizedBox(
                          width: 25), 
                      const Text(
                        'Añadir Material',
                        style: TextStyle(
                          fontFamily:"Lato",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  VistaLMateriales()));
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
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(
                          width: 20),
                      const Text(
                        'Consultar Material',
                        style: TextStyle(
                          fontFamily:"Lato",
                          color: Colors.black,
                          fontSize: 20,
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
