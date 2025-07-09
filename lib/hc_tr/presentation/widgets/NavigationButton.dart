import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final Widget Function(BuildContext) navigationRoute;

  const NavigationButton({
    Key? key,
    required this.navigationRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: navigationRoute),
          );
        },
        style: ElevatedButton.styleFrom(
          side:
              const BorderSide(color: Colors.black, width: 1.5), // Borde negro
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Bordes redondeados
          ),
        ),
        child: const Text(
          'BUSCAR HISTORIA CLINICA',
          style: TextStyle(color: Colors.black), // Color del texto negro
        ),
      ),
    );
  }
}
