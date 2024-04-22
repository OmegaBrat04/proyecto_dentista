import 'package:flutter/material.dart';

class CS extends StatefulWidget {
  const CS({Key? key}) : super(key: key);

  @override
  State<CS> createState() => _CSState();
}

class _CSState extends State<CS> {
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
          "Consulta Servicios",
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
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Servicio $index"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
