import 'package:flutter/material.dart';

class UsernameTextfield extends StatefulWidget {
  final Function(String text) onChanged;
  final bool obscureText;
  final TextEditingController controller;

  //Constructor
  const UsernameTextfield(
      {super.key,
      this.obscureText = false,
      required this.onChanged,
      required this.controller});

  @override
  State<UsernameTextfield> createState() => _UsernameTextfieldState();
}

class _UsernameTextfieldState extends State<UsernameTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  //Diseño input usuario
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black54),

      obscureText: _obscureText,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          labelText: 'Correo electrónico',
          labelStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontFamily: 'Raleway',
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.black54,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  color: Colors.black54,
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54,),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black54,),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
    );
  }
}
