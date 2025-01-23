import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemSelected,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 74, 173, 1.0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/imgs/inicio/navigation/inicio.png',
              height: 20,
            ),
            activeIcon: Image.asset(
              'assets/imgs/inicio/navigation/inicio.png',
              height: 20,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/imgs/inicio/navigation/perfil.png',
              height: 20,
            ),
            activeIcon: Image.asset(
              'assets/imgs/inicio/navigation/perfil.png',
              height: 20,
            ),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/imgs/inicio/navigation/tutorial.png',
              height: 20,
            ),
            activeIcon: Image.asset(
              'assets/imgs/inicio/navigation/tutorial.png',
              height: 25,
            ),
            label: 'Tutorial',
          ),
        ],
      ),
    );
  }
}
