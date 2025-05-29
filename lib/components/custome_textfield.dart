import 'package:flutter/material.dart';

class CustomeTextfield extends StatelessWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController txtController;
  const CustomeTextfield({
    super.key,
    required this.hintText,
    required this.obscure,
    required this.txtController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: txtController,
      obscureText: obscure,
      
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
      ),
    );
  }
}
