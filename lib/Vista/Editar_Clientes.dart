import 'package:flutter/material.dart';

class EC extends StatefulWidget {
  const EC({super.key});

  @override
  State<EC> createState() => _ECState();
}

class _ECState extends State<EC> {
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(34.0),
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
                                    fontFamily:"Lato",
                          fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 254, 254, 223),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
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
                                    fontFamily:"Lato",
                          fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 254, 254, 223),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
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
                                    fontFamily:"Lato",
                          fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 254, 254, 223),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
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
                                    fontFamily:"Lato",
                          fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 254, 254, 223),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
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
                                    fontFamily:"Lato",
                          fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 254, 254, 223),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
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
                        onPressed: () {
                          // Acción para el botón "Guardar"
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
                                fontFamily:"LatoBlack",
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
        ],
      ),
    );
  }
}
