// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:app_municipalidad_sb/presentation/screens/inicio/inicio.dart';
import 'package:app_municipalidad_sb/presentation/screens/perfil/perfil.dart';
import 'package:app_municipalidad_sb/presentation/screens/tutorial/tutorial.dart';
import 'package:app_municipalidad_sb/presentation/widgets/bottom_navbar.dart';
import 'package:app_municipalidad_sb/presentation/widgets/button_amarillo.dart';
import 'package:app_municipalidad_sb/presentation/widgets/button_rojo.dart';
import 'package:app_municipalidad_sb/presentation/widgets/header_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertaEmergenciasPage extends StatefulWidget {
  const AlertaEmergenciasPage({super.key});

  @override
  _AlertaEmergenciasPageState createState() => _AlertaEmergenciasPageState();
}

class _AlertaEmergenciasPageState extends State<AlertaEmergenciasPage> {
  bool _isAlertSent = false; // Controla si la alerta fue enviada
  int selectedIndex = 0;

  void _sendAlert() {
    setState(() {
      _isAlertSent = true; // Cambia el estado para mostrar el botón rojo
    });
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Abre el enlace para realizar la llamada
    } else {
      throw 'No se puede abrir el enlace: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Fondo de pantalla con imagen
            Container(          
              decoration: const BoxDecoration(               
                image: DecorationImage(
                  image: AssetImage('assets/imgs/login/load.png'), // Ruta de la imagen
                  fit: BoxFit.cover,            
                ),
              ),
            ),
            Column(
              children: [
                // Encabezado reutilizable con logo
                const HeaderLogo(),
                const SizedBox(height: 50),
                const Text(
                  'AMBULANCIA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Ajustar color para visibilidad
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Enviar Alerta de\n    Emergencia',
                  style: TextStyle(                
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700 // Ajustar color para visibilidad
                  ),
                ),
                const SizedBox(height: 50),
                // Mostrar botón amarillo o rojo dependiendo del estado
                if (!_isAlertSent)
                  ButtonAmarillo(
                    onPressed: _sendAlert, // Envía la alerta al completar la barra
                  )
                else
                  ButtonRojo(
                    onPressed: () {
                      _makePhoneCall("tel:+123456789"); // Reemplaza con tu número
                    },
                  ),
                const SizedBox(height: 100),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: _isAlertSent
                        ? [
                            const TextSpan(
                              text: 'ALERTA ENVIADA, ', // Texto en amarillo
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.yellow, // Color amarillo
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Raleway'
                              ),
                            ),
                            const TextSpan(
                              text: 'por favor presione el botón para realizar la llamada.', // Texto en blanco
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Raleway'
                              ),
                            ),
                          ]
                        : [
                            const TextSpan(
                              text: 'Manten presionado por 3 segundos\n', // Texto en amarillo
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.yellow,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Raleway'
                              ),
                            ),
                            const TextSpan(
                              text: ' para enviar la alerta y te contactaremos', // Texto en blanco
                              style: TextStyle(
                                fontSize: 16  ,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Raleway'
                              ),
                            ),
                          ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;

            // Navegar según la selección utilizando `go_router`
            if (index == 0) {
              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const InicioPage(),
                          ),
                        );
            } else if (index == 1) {
              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PerfilPage(),
                          ),
                        );
            } else if (index == 2) {
              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TutorialPage(),
                          ),
                        );
            }
          });
        },
      ),
    );
  }
}
