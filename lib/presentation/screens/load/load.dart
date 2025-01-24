import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  bool state = false;

  @override
  void initState() {
    verifyState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Fondo
            Image.asset(
              'assets/imgs/login/load.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            // Imagen superpuesta
            Center(
              child: Image.asset(
                'assets/imgs/login/logo_load.png', // Cambia el path según tu imagen
                width: 200, // Ajusta el tamaño de la imagen
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verifyState() async {
    state = await verifyUser();

    if (state) {
      Future.delayed(const Duration(seconds: 2),
          () => {context.pushReplacementNamed('menu')});
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => {context.pushReplacementNamed('login')});
    }
  }

  Future<bool> verifyUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool auth = prefs.getBool('auth') ?? false;

    return auth;
  }
}
