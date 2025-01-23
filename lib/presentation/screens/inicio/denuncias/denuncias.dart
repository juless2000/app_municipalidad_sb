import 'package:app_municipalidad_sb/presentation/screens/inicio/denuncias/tipo_denuncia/audio_denuncia/audio_denuncia.dart';
import 'package:app_municipalidad_sb/presentation/screens/inicio/denuncias/tipo_denuncia/imagen_video_denuncia/imagen_video_denuncia.dart';
import 'package:flutter/material.dart';

class DenunciasPage extends StatefulWidget {
  const DenunciasPage({super.key});

  @override
  State<DenunciasPage> createState() => _DenunciasPageState();
}

class _DenunciasPageState extends State<DenunciasPage> {
  final List<Map<String, dynamic>> categorias = [
    {'icon': 'assets/imgs/inicio/denuncias/building.png', 'title': 'Construcción ilegal', 'subtitle': 'Reporta construcciones sin permiso'},
    {'icon': 'assets/imgs/inicio/denuncias/volume.png', 'title': 'Ruidos Molestos', 'subtitle': 'Denuncia ruidos excesivos'},
    {'icon': 'assets/imgs/inicio/denuncias/pets.png', 'title': 'Escreta de Mascotas', 'subtitle': 'Reporta excremento en lugares públicos'},
    {'icon': 'assets/imgs/inicio/denuncias/grass.png', 'title': 'Arrojo de Desmonte', 'subtitle': 'Denuncia residuos de construcción'},
    {'icon': 'assets/imgs/inicio/denuncias/trash.png', 'title': 'Arrojo de Basura', 'subtitle': 'Reporta basura en áreas prohibidas'},
    {'icon': 'assets/imgs/inicio/denuncias/tree.png', 'title': 'Arrojo de Maleza', 'subtitle': 'Denuncia acumulación de maleza'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Selecciona alguna de las ',
                style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: 'denuncias \ndisponibles',
                    style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1.0), fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(
                        categoria['icon'],
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        categoria['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 74, 173, 1.0),
                        ),
                      ),
                      subtitle: Text(
                        categoria['subtitle'],
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      ),
                      onTap: () {
                        if (categoria['title'] == 'Ruidos Molestos') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AudioDenunciaPage(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImagenVideoDenunciaPage(),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
