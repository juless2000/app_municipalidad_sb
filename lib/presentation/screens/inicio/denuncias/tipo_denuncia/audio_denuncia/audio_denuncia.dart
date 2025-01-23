import 'dart:async';
import 'dart:io';
import 'package:app_municipalidad_sb/presentation/screens/inicio/inicio.dart';
import 'package:app_municipalidad_sb/presentation/screens/perfil/perfil.dart';
import 'package:app_municipalidad_sb/presentation/screens/tutorial/tutorial.dart';
import 'package:app_municipalidad_sb/presentation/widgets/bottom_navbar.dart';
import 'package:app_municipalidad_sb/presentation/widgets/button_audio.dart';
import 'package:app_municipalidad_sb/presentation/widgets/header_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioDenunciaPage extends StatefulWidget {
  const AudioDenunciaPage({super.key});

  @override
  State<AudioDenunciaPage> createState() => _AudioDenunciaPageState();
}

class _AudioDenunciaPageState extends State<AudioDenunciaPage> {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  bool _isPaused = false;
  String _recordingDuration = "00:00";
  final List<File> _audioList = [];
  late Directory _appDirectory;
  final TextEditingController _descriptionController = TextEditingController();

  int selectedIndex = 0;
  Timer? _timer;
  int _secondsElapsed = 0;

  static const int maxAudios = 3;

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    _appDirectory = await getApplicationDocumentsDirectory();
    await _recorder.openRecorder();
    final permission = await Permission.microphone.request();
    if (permission != PermissionStatus.granted) {
      throw RecordingPermissionException("Permiso de micrófono denegado.");
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
        _recordingDuration = _formatDuration(_secondsElapsed);
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$remainingSeconds";
  }

  Future<void> _startRecording() async {
    final filePath =
        "${_appDirectory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac";
    await _recorder.startRecorder(
      toFile: filePath,
      codec: Codec.aacADTS,
    );

    setState(() {
      _isRecording = true;
      _isPaused = false;
    });

    _startTimer();
  }

  void _pauseRecording() async {
    await _recorder.pauseRecorder();
    setState(() {
      _isPaused = true;
    });

    _stopTimer();
  }

  void _resumeRecording() async {
    await _recorder.resumeRecorder();
    setState(() {
      _isPaused = false;
    });

    _startTimer();
  }

  Future<void> _stopRecording() async {
    final filePath = await _recorder.stopRecorder();
    if (filePath != null) {
      setState(() {
        _isRecording = false;
        _isPaused = false;
        _recordingDuration = "00:00";
        if (_audioList.length < maxAudios) {
          _audioList.add(File(filePath));
        }
      });

      _secondsElapsed = 0;
      _stopTimer();
    }
  }

  Future<void> _eliminarAudio(int index) async {
    setState(() {
      _audioList.removeAt(index);
    });
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _stopTimer();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: GestureDetector(
      onTap: () {
        // Oculta el teclado al tocar fuera de la caja de texto
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Ajusta el diseño al teclado
        body: SafeArea(
          child: Column(
            children: [
              const HeaderLogo(),
              const SizedBox(height: 30),
              Image.asset('assets/imgs/inicio/denuncias/volume.png'),
              const SizedBox(height: 15),
              const Text(
                'Ruidos Molestos',
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
              TabBar(
                labelColor: const Color.fromRGBO(0, 74, 173, 1.0),
                unselectedLabelColor: Colors.black.withOpacity(0.2),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Color.fromRGBO(0, 74, 173, 1.0),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    child: Text(
                      'Grabación',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Descripción',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                    children: [
                      // Tab Grabación
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              _recordingDuration,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ButtonAudio(
                              onPressed: () async {
                                if (_isRecording) {
                                  await _stopRecording();
                                } else {
                                  await _startRecording();
                                }
                              },
                              isRecording: _isRecording,
                            ),
                            const SizedBox(height: 20),
                            if (_isRecording) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      _isPaused ? Icons.play_arrow : Icons.pause,
                                      color: Colors.black54,
                                      size: 30,
                                    ),
                                    onPressed: _isPaused ? _resumeRecording : _pauseRecording,
                                  ),
                                  const SizedBox(width: 20),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.stop,
                                      color: Colors.black54,
                                      size: 30,
                                    ),
                                    onPressed: _stopRecording,
                                  ),
                                ],
                              ),
                            ],
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Lista de Grabaciones (${_audioList.length}/$maxAudios)",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 74, 173, 1.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded( // Permite que la lista ocupe el espacio restante
                              child: ListView.builder(
                                itemCount: _audioList.length,
                                itemBuilder: (context, index) {
                                  final file = _audioList[index];
                                  return ListTile(
                                    leading: const Icon(Icons.audio_file),
                                    title: Text(file.path.split('/').last),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () => _eliminarAudio(index),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
      
                      // Tab Descripción 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título
                              const Text(
                                "Agregar Descripción",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 74, 173, 1.0), // Azul específico
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Campo de texto
                              TextField(
                                controller: _descriptionController,
                                maxLines: 5,
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
                      ),

                    ],
                  ),
                ),
            ],
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
                  onPressed: _audioList.isNotEmpty || _descriptionController.text.isNotEmpty
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
                        MaterialPageRoute(
                          builder: (context) => const InicioPage(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PerfilPage(),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TutorialPage(),
                        ),
                      );
                      break;
                  }
                });
              },
            ),
          ],
        ),
      ),
    ),
  );
}

}
