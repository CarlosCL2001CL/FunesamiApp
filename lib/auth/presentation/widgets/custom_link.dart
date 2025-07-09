import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomLink({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.blue,
        ),
      ),
    );
  }
}
