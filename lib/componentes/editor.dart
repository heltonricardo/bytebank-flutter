import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData favicon;
  final TextInputType keyboard;

  Editor({this.label, this.hint, this.favicon, this.controller, this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboard != null ? keyboard : TextInputType.number,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
            icon: favicon != null ? Icon(favicon) : null,
            labelText: this.label,
            hintText: this.hint),
      ),
    );
  }
}
