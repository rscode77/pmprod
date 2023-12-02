import 'package:flutter/material.dart';

class DataTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const DataTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  State<DataTextField> createState() => _DataTextFieldState();
}

class _DataTextFieldState extends State<DataTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
      ),
    );
  }
}
