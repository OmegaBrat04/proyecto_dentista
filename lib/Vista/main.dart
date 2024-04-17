import 'package:flutter/material.dart';

void main() {
  runApp(const MenuPrincipal());
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Menu Principal',
        home: Ventana());
  }
}

class Ventana extends StatefulWidget {
  const Ventana({super.key});

  @override
  State<Ventana> createState() => _VentanaState();
}

class _VentanaState extends State<Ventana> {
  int opcionSeleccionada = 0;

  void botonPulsado(int index) {
    setState(() {
      opcionSeleccionada = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: const Color(0xFF5571FF)),
      child: Scaffold(
        backgroundColor: Color(0xFFFEB5FF),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),

                //Padding(padding: EdgeInsets.all(10.0)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenida Dr. Dalia Margarita',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  width: 280,
                  height: 280,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/Logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Gestion Consultorio Dental',
                  style: TextStyle(fontSize: 20, fontFamily: 'LatoBlack'),
                ),
              ],
            )),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Color(0xFF5571FF),
          unselectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset('images/Icono Persona.png', width: 36, height: 36,),
                label: 'Clientes'),
            BottomNavigationBarItem(
                icon: Image.asset('images/Icono Citas.png', width: 36, height: 36,), label: 'Citas'),
            BottomNavigationBarItem(
                icon: Image.asset('images/Icono Material.png', width: 36, height: 36,),
                label: 'Material'),
            BottomNavigationBarItem(
                icon: Image.asset('images/Icono Servicios.png', width: 36, height: 36,),
                label: 'Servicios'),
          ],
          currentIndex: opcionSeleccionada,
          onTap: botonPulsado,
        ),
      ),
    );
  }
}
