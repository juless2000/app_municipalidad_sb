import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(0, 74, 173, 1.0),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/imgs/logo_sb_white.png',
            height: 60,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
