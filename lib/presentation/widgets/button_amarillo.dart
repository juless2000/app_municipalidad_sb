import 'package:flutter/material.dart';

class ButtonAmarillo extends StatefulWidget {
  final VoidCallback onPressed; // Acción al completar la barra de carga

  const ButtonAmarillo({super.key, required this.onPressed});

  @override
  State<ButtonAmarillo> createState() => _ButtonAmarilloState();
}

class _ButtonAmarilloState extends State<ButtonAmarillo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Duración de la barra de carga
    );

    _controller.addListener(() {
      setState(() {}); // Redibuja la pantalla para actualizar la barra de progreso
      if (_controller.isCompleted) {
        widget.onPressed(); // Ejecuta la acción al completar la animación
        _controller.reset(); // Reinicia el controlador
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startLoading() {
    _controller.forward(); // Inicia la animación
  }

  void _stopLoading() {
    if (!_controller.isCompleted) {
      _controller.reset(); // Detiene y reinicia si no está completa
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _startLoading, // Inicia la barra de carga
      onLongPressUp: _stopLoading, // Detiene la barra si se suelta antes
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Barra de carga circular
          SizedBox(
            width: 130,
            height: 130,
            child: CircularProgressIndicator(
              value: _controller.value, // Progreso de la animación
              strokeWidth: 8.0, // Grosor de la barra
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black), // Color de la barra
              backgroundColor: const Color.fromRGBO(255, 213, 43, 1), // Color de fondo de la barra
            ),
          ),
          // Botón principal
          Material(
            elevation: 8.0,
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: CircleAvatar(
              radius: 65,
              backgroundColor: const Color.fromRGBO(255, 213, 43, 1), // Fondo amarillo del botón
              child: Image.asset(
                'assets/imgs/inicio/emergencias/alertas/send_alert.png',
                height: 130,
                width: 130,
                fit: BoxFit.contain, // Ajuste de la imagen
              ),
            ),
          ),
        ],
      ),
    );
  }
}
