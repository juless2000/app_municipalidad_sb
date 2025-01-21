import 'package:app_municipalidad_sb/presentation/screens/inicio/tabbaremerdenun.dart';
import 'package:app_municipalidad_sb/presentation/screens/perfil/perfil.dart';
import 'package:app_municipalidad_sb/presentation/screens/tutorial/tutorial.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const TabBarEmerDenunPage(),
      const PerfilPage(),
      const TutorialPage()
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Fondo con bordes redondeados
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Mantener texto siempre visible
              currentIndex: selectedIndex,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              elevation: 0,
              backgroundColor: const Color.fromRGBO(0, 74, 173, 1.0), // Fondo azul
              selectedItemColor: Colors.white, // Color del texto seleccionado
              unselectedItemColor: Colors.white, // Color del texto no seleccionado
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/imgs/inicio/navigation/inicio.png',
                    alignment: Alignment.center,
                    height: 20,
                  ),
                  activeIcon: Image.asset(
                    'assets/imgs/inicio/navigation/inicio.png',
                    alignment: Alignment.center,
                    height: 20,
                  ),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/imgs/inicio/navigation/perfil.png',
                    alignment: Alignment.center,
                    height: 20,
                  ),
                  activeIcon: Image.asset(
                    'assets/imgs/inicio/navigation/perfil.png',
                    alignment: Alignment.center,
                    height: 20,
                  ),
                  label: 'Perfil',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/imgs/inicio/navigation/tutorial.png',
                    alignment: Alignment.center,
                    height: 20,
                  ),
                  activeIcon: Image.asset(
                    'assets/imgs/inicio/navigation/tutorial.png',
                    alignment: Alignment.center,
                    height: 25,
                  ),
                  label: 'Tutorial',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
