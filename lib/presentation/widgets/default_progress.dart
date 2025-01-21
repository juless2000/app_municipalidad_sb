// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DefaultProgress extends StatelessWidget {
  String? progress;
  DefaultProgress(this.progress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Color.fromARGB(255, 127, 70, 241),
          ),
          const SizedBox(height: 20),
          const Text(
            'Cargando...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            progress ?? '',
          ),
        ],
      ),
    );
  }
}
