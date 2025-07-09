import 'package:flutter/material.dart';

class NavigationTrButton extends StatelessWidget {
  final Widget Function(BuildContext) navigationRoute;
  final String buttonText; // Nueva propiedad para el texto del botón

  const NavigationTrButton({
    Key? key,
    required this.navigationRoute,
    required this.buttonText, // Parámetro requerido para el texto
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
        child: Text(
          buttonText, // Texto dinámico
          style: const TextStyle(
            color: Colors.black, // Color del texto negro
            fontSize: 20, // Tamaño del texto (ajústalo según lo que necesites)
          ),
        ),
      ),
    );
  }
}
