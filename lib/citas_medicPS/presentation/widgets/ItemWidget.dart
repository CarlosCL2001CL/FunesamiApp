import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;
  final String buttonText;
  final VoidCallback? navigateTo;

  const ItemWidget({
    required this.item,
    required this.onTap,
    this.buttonText = 'Ver detalle de la cita',
    this.navigateTo, // Navegación personalizada
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco opcional
          border: Border.all(
            color: Colors.black, // Color del borde negro
            width: 2.0, // Ancho del borde
          ),
          borderRadius:
              BorderRadius.circular(8.0), // Bordes redondeados opcionales
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Área: ${item['area']}',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
            Text('Paciente: ${item['patient']}',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
            Text('Fecha: ${item['fecha']}',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
            Text('Hora: ${item['hora']}',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
            Text(
                'Sintomas: Diagnostico previo que se puede tomar como referencia',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Botón alineado a la derecha
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Colors.black, width: 2.0), // Borde negro
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Bordes redondeados
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Padding interno
                  ),
                  onPressed: navigateTo ??
                      onTap, // Navegación personalizada o acción alternativa
                  child: Text(
                    buttonText, // Texto configurable
                    style: TextStyle(color: Colors.black), // Texto negro
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
