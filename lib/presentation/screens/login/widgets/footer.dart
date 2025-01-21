import 'package:flutter/material.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: const Text(
              '',
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'CreatoDisplay',
                  fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
