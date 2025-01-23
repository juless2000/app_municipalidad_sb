import 'package:app_municipalidad_sb/presentation/screens/inicio/emergencias/alertas/alerta_emergencias.dart';
import 'package:app_municipalidad_sb/presentation/widgets/option_card_emergencias.dart';
import 'package:flutter/material.dart';

class EmergenciasPage extends StatefulWidget {
  const EmergenciasPage({super.key});

  @override
  State<EmergenciasPage> createState() => _EmergenciasPageState();
}

class _EmergenciasPageState extends State<EmergenciasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Fondo blanco
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola José Luis, 👋',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 173, 1.0),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '¿Qué necesitas?',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 173, 1.0),
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Grid de opciones
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                  children: [
                    OptionCardEmergencias(
                      title: 'Ambulancia',
                      imagePath:
                          'assets/imgs/inicio/emergencias/ambulancia.png',
                      backgroundColor: const Color(0xFFF2E1DE),
                      iconColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AlertaEmergenciasPage(),
                          ),
                        );
                      },
                    ),
                    OptionCardEmergencias(
                      title: 'Serenazgo',
                      imagePath: 'assets/imgs/inicio/emergencias/serenazgo.png',
                      backgroundColor: const Color(0xFFF3FAEA),
                      iconColor: Colors.black,
                      onTap: () {},
                    ),
                    OptionCardEmergencias(
                      title: 'Salvavidas',
                      imagePath:
                          'assets/imgs/inicio/emergencias/salvavidas.png',
                      backgroundColor: const Color(0xFFFCF5DB),
                      iconColor: Colors.black,
                      onTap: () {},
                    ),
                    OptionCardEmergencias(
                      title: 'Comisaría',
                      imagePath: 'assets/imgs/inicio/emergencias/policia.png',
                      backgroundColor: const Color(0xFFEAEDF1),
                      iconColor: Colors.black,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
