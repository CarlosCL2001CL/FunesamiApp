import 'package:flutter/material.dart';

class HeaderctTrWidget extends StatelessWidget {
  final String textoDinamico;
  final String textoCitasMedicas; // Texto configurable

  const HeaderctTrWidget({
    Key? key,
    required this.textoDinamico,
    this.textoCitasMedicas = 'SECCIÓN DE CITAS MÉDICAS', // Valor por defecto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/imagenes/san-miguel.png',
            width: 100,
            height: 110,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'FUNDACIÓN DE NIÑOS ESPECIALES',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '“SAN MIGUEL” FUNESAMI',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                textoCitasMedicas, // Texto configurable
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textoDinamico,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
