import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget
      child; // Este parámetro permitirá insertar cualquier widget dentro de la tarjeta

  // Constructor que recibe el contenido (cualquier widget)
  CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 197, 197), // Fondo claro
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Botón de regreso dentro de la Card
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(
                            context); // Regresar a la pantalla anterior
                      },
                    ),
                  ),

                  // Aquí va el contenido dinámico que se pasa al widget
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
