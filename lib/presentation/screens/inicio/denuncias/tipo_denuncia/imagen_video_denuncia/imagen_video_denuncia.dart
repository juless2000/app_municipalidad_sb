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
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Scaffold(         
          body:  SafeArea(      
              child: Column(
                children: [         
                  const HeaderLogo(),
                  const SizedBox(height: 30),
                  Image.asset('assets/imgs/inicio/denuncias/building.png'),
                  const SizedBox(height: 15),
                  const Text('Construcción Ilegal', style: TextStyle(color:  Color.fromRGBO(0, 74, 173, 1.0), fontSize: 22, fontWeight: FontWeight.w700),),
                  const Text('Registro de Denuncia', style: TextStyle(color:  Color.fromRGBO(0, 74, 173, 1.0), fontSize: 16, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 15),
                  
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
        )
    );
  }
}