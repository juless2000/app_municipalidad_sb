import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class ButtonAudio extends StatelessWidget {
  final VoidCallback onPressed; // Acción cuando se presiona el botón
  final bool isRecording; // Indica si la grabación está activa o no

  const ButtonAudio({
    super.key,
    required this.onPressed,
    required this.isRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed, // Llama al callback cuando se presiona
        child: isRecording
            ? AvatarGlow(
                glowColor: const Color.fromRGBO(255, 213, 43, 1), // Amarillo si está grabando
                duration: const Duration(milliseconds: 2000), // Duración de la animación
                repeat: true,
                child: _buildButton(),
              )
            : _buildButton(),
      ),
    );
  }

  // Método para construir el botón
  Widget _buildButton() {
    return Material(
      elevation: 8.0,
      shape: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: const Color.fromRGBO(255, 213, 43, 1), // Color del fondo
        radius: 40,
        child: Image.asset(
          'assets/imgs/inicio/denuncias/audio/audio_logo.png',
          height: 80,
          width: 80,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
