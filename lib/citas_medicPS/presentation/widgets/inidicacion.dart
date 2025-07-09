import 'package:flutter/material.dart';

class IndicacionWidget extends StatelessWidget {
  const IndicacionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Nota',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0, // Tamaño del texto
            ),
          ),
          SizedBox(height: 8.0), // Espaciado entre líneas
          Text(
            'En esta página solo se mostrarán las citas pendientes',
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
