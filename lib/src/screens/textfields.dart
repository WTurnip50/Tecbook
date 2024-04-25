import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final bool visible;
  final TextEditingController _textController; // Declaración del controlador

  MyTextField({required this.label, required this.visible,required TextEditingController textController})
      : _textController = textController; // Asignación del controlador

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      obscureText:visible,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: label,
        hintText: "Introduce tu " + label,
      ),
    );
  }
}