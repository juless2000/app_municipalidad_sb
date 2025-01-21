import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/imgs/login/fondo_login.png',
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 20,
          child: Image.asset('assets/imgs/logo_sb_color.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.65),
        ),
      ],
    );
  }
}