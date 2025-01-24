import 'package:app_municipalidad_sb/presentation/screens/inicio/inicio.dart';
import 'package:app_municipalidad_sb/presentation/screens/perfil/perfil.dart';
import 'package:app_municipalidad_sb/presentation/screens/tutorial/tutorial.dart';
import 'package:app_municipalidad_sb/presentation/widgets/bottom_navbar.dart';
import 'package:app_municipalidad_sb/presentation/widgets/header_logo.dart';
import 'package:flutter/material.dart';

class ImagenVideoDenunciaPage extends StatefulWidget {
  const ImagenVideoDenunciaPage({super.key});

  @override
  State<ImagenVideoDenunciaPage> createState() => _ImagenVideoDenunciaPageState();
}

class _ImagenVideoDenunciaPageState extends State<ImagenVideoDenunciaPage> {
  int selectedIndex = 0;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Oculta el teclado al tocar fuera de la caja de texto
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeaderLogo(),
                const SizedBox(height: 30),
                Image.asset('assets/imgs/inicio/denuncias/building.png'),
                const SizedBox(height: 15),
                const Text(
                  'Construcción Ilegal',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 74, 173, 1.0),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Registro de Denuncia',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 74, 173, 1.0),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ingresar Foto',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 74, 173, 1.0),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Lógica para tomar o subir imagen/video
                        },
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12.0),
                            
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/imgs/inicio/denuncias/imagen/img_video_logo.png',
                                height: 80,
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: 'Tap aquí para seleccionar ',
                                  style: TextStyle(color: Colors.grey, fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: 'Tomar',
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 74, 173, 1.0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: ' o '),
                                    TextSpan(
                                      text: 'Subir',
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 74, 173, 1.0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: ' \nImagen/Video'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Agregar Descripción',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 74, 173, 1.0),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Escribe una descripción aquí...",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0), // Gris claro para el borde
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0), // Gris claro para el borde
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 74, 173, 1.0), // Azul al enfocar
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _descriptionController.text.isNotEmpty
                      ? () {
                          // Lógica para enviar denuncia
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 204, 0, 1.0),
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5,
                  ),
                  icon: Image.asset('assets/imgs/inicio/denuncias/paper-plane.png'),
                  label: const Text(
                    "Enviar Denuncia",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            BottomNavbar(
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  selectedIndex = index;
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InicioPage()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PerfilPage()),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TutorialPage()),
                      );
                      break;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
