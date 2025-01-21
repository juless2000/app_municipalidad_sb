// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  String text;
  String? style;
  Function() onPressed;
  Color color;

  DefaultButton(
      {required this.text, required this.onPressed, this.color = Colors.black, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(backgroundColor: color),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'CreatoDisplay'),
          )),
    );
  }
}
