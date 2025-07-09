import 'package:flutter/material.dart';

class headerPSWidget extends StatelessWidget {
  final String textoDinamico;

  const headerPSWidget({
    Key? key,
    required this.textoDinamico,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/imagenes/san-miguel.png',
            width: 117,
            height: 125,
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
              const Text(
                'Acuerdo Ministerial 078-08',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'PAGINA DE BUSQUEDA ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                textoDinamico,
                style: const TextStyle(
                  fontSize: 18,
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
