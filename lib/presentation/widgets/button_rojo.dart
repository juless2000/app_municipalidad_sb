import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class ButtonRojo extends StatelessWidget {
  final VoidCallback onPressed; // Callback para manejar la acción del botón

  const ButtonRojo({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed, // Llama a la función pasada como parámetro
        child: AvatarGlow(
          // endRadius: 80.0, // Radio máximo del efecto de glow
          glowColor: Colors.redAccent, // Color del glow
          duration: const Duration(milliseconds: 2000), // Duración de la animación
          repeat: true, // Repite la animación
          // repeatPauseDuration: const Duration(milliseconds: 100), // Pausa entre ciclos
          child: Material(
            elevation: 8.0,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.red, // Fondo rojo del botón
              radius: 65, // Tamaño del círculo
              child: Image.asset(
                'assets/imgs/inicio/emergencias/alertas/alert.png',
                height: 130,
                width: 130,
                fit: BoxFit.contain, // Asegura que la imagen se ajuste bien
              ),
            ),
          ),
        ),
      ),
    );
  }
}
