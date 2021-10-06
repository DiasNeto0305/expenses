import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {

  final String label;
  final Function() onSubmit;
  final TextEditingController controller;
  final bool keyboardNumber;

  AdaptativeTextField({
    required this.label,
    required this.onSubmit,
    required this.controller,
    required this.keyboardNumber
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.all(8),
          child: CupertinoTextField(
            placeholder: label,
            onSubmitted: (_) => onSubmit,
            keyboardType: keyboardNumber ? TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
            controller: controller,
            padding: EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12
            ),
          ),
        )
        : TextField(
            decoration: InputDecoration(labelText: label),
            keyboardType: keyboardNumber ? TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
            onSubmitted: (_) => onSubmit,
            controller: controller,
          );
  }
}
