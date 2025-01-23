import 'package:app_municipalidad_sb/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:app_municipalidad_sb/presentation/screens/inicio/tabbaremerdenun.dart';
import 'package:app_municipalidad_sb/presentation/screens/perfil/perfil.dart';
import 'package:app_municipalidad_sb/presentation/screens/tutorial/tutorial.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  int selectedIndex = 0;

  final screens = [
    const TabBarEmerDenunPage(),
    const PerfilPage(),
    const TutorialPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
