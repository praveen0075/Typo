import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const CustomButton({super.key, required this.buttonText,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding( 
          padding: const EdgeInsets.all(15),
          child: Center(child: Text(buttonText)),
        ),
      ),
    );
  }
}
