import 'package:flutter/material.dart';
import 'package:proyecto_dentista/Vista/Consulta_Citas.dart';
import 'package:proyecto_dentista/Vista/Gestion_Citas.dart';
import 'package:proyecto_dentista/Vista/Gestion_Clientes.dart';
import 'package:proyecto_dentista/Vista/Gestion_Material.dart';
import 'package:proyecto_dentista/Vista/Gestion_Servicios.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_dentista/firebase_options.dart';
import 'package:proyecto_dentista/Controlador/Cdor_Citas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MenuPrincipal());
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Principal',
      home: Ventana(),
      routes: {
        '/GestionClientes': (context) => GC(),
        '/GestionCitas': (context) => GCitas(),
        '/GestionMaterial': (context) => GM(),
        '/GestionServicios': (context) => GS(),
      },
    );
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

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/GestionClientes');
        break;
      case 1:
        Navigator.pushNamed(context, '/GestionCitas');
        break;
      case 2:
        Navigator.pushNamed(context, '/GestionMaterial');
        break;
      case 3:
        Navigator.pushNamed(context, '/GestionServicios');
        break;
    }
  }

  Cdor_Citas controlador = Cdor_Citas();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: const Color(0xFF5571FF)),
      child: Scaffold(
        backgroundColor: const Color(0xFFFEB5FF),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),

                //Padding(padding: EdgeInsets.all(10.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/Logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Gestion Consultorio Dental',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'LatoBlack',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                /*Container(
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
                ),*/
                const Text(
                  'Bienvenida Dra. Dalia Margarita',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 0, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFBDE3FF),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 3, color: const Color(0xFF5571FF))),
                        child: FutureBuilder(
                            future: controlador.listarCitas('Diario'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return ListTile(
                                        title: Text(
                                            snapshot.data![index].Cliente,
                                            style: const TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        subtitle: Text(
                                            '${snapshot.data![index].Fecha.toDate().toString().split(' ')[0]} ${snapshot.data![index].Hora}'),
                                        trailing: Text(
                                          snapshot.data![index].Servicio,
                                          style: const TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    });
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }))),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VistaLCitas()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5571FF),
                      ),
                      child: const Row(
                        children: [
                          Text('Ver más',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'LatoBlack',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(width: 5,),    
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                            
                          )
                        ],
                      ),
                    )
                    /*FloatingActionButton(
                      backgroundColor: const Color(0xFF5571FF),
                      shape: const CircleBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VistaLCitas()));
                      },
                      child: const Text(
                        'Ver mas',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),*/
                  ],
                )
              ],
            )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/Icono Persona.png',
                  width: 36,
                  height: 36,
                ),
                label: 'Clientes'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/Icono Citas.png',
                  width: 36,
                  height: 36,
                ),
                label: 'Citas'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/Icono Material.png',
                  width: 36,
                  height: 36,
                ),
                label: 'Material'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/Icono Servicios.png',
                  width: 36,
                  height: 36,
                ),
                label: 'Servicios'),
          ],
          currentIndex: opcionSeleccionada,
          onTap: botonPulsado,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
