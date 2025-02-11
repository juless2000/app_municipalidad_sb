import 'package:app_municipalidad_sb/presentation/screens/inicio/denuncias/denuncias.dart';
import 'package:app_municipalidad_sb/presentation/screens/inicio/emergencias/emergencias.dart';
import 'package:app_municipalidad_sb/presentation/widgets/header_logo.dart';
import 'package:flutter/material.dart';

class TabBarEmerDenunPage extends StatelessWidget {
  const TabBarEmerDenunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Encabezado reutilizable con logo
              const HeaderLogo(),
              // TabBar debajo del encabezado
              Container(
                color: const Color.fromRGBO(0, 74, 173, 1.0),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.7),
                  indicator: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Emergencias',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Denuncias',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              // Contenido del TabBarView
              const Expanded(
                child: TabBarView(
                  children: [
                    EmergenciasPage(), // Página de Emergencias
                    DenunciasPage(), // Página de Denuncias
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
