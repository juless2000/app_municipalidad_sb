import 'package:flutter/material.dart';

class OptionCardEmergencias extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  const OptionCardEmergencias({
    super.key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Acción al tocar la tarjeta
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 140,
              width: 140,
              fit: BoxFit.cover, 
            ),
            Container(
              width: 140, 
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(20), 
              ),
              child: Text(
                title,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: iconColor, 
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
