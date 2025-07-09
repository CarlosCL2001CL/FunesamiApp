import 'package:flutter/material.dart';
import '/hc_ps/presentation/widgets/headerBusqueda.dart';

class BusquedaPsN extends StatelessWidget {
  const BusquedaPsN({Key? key}) : super(key: key);

  // Simulación de un widget para mostrar un título de sección
  Widget _buildSeccionTitulo(String titulo) {
    return Text(
      titulo,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  // Simulación de un widget para mostrar campos con título
  Widget _buildCampoConTitulo(String titulo, String value,
      {bool readOnly = true}) {
    return TextFormField(
      initialValue: value,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: titulo,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Simulación de un campo que puede tener texto largo (scrollable)
  Widget _buildCampoConScroll(String titulo, String value,
      {bool readOnly = true}) {
    return TextFormField(
      initialValue: value,
      readOnly: readOnly,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: titulo,
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area de psicologia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerPSWidget(
                textoDinamico: 'historias clinicas de niños',
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  // Campo de búsqueda
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Buscar paciente...',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Botón de búsqueda
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para realizar la búsqueda
                      print('Buscar paciente');
                    },
                    child: const Text('Buscar'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              // Título y campos de la historia
              _buildSeccionTitulo('1. DATOS PERSONALES'),
              const Divider(),
              _buildCampoConTitulo(
                  'Nombre completo del paciente', 'Juan Pérez'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Fecha de nacimiento', '02/03/2024'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Curso escolar Actual', '2º Grado'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Institución', 'ESPE'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Nombre del papá', 'Carlos Pérez'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Nombre de la mamá', 'María Pérez'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Dirección', 'Calle Ficticia 123'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Teléfono', '123-456-789'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Remisión', 'Sí'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Fecha de evaluación', '01/01/2024'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Final de cobertura', '12/12/2025'),
              const SizedBox(height: 10),
              _buildCampoConTitulo('Responsable', 'Dr.Ivette PS'),
              const SizedBox(height: 10),
              _buildCampoConScroll(
                  'Observaciones', 'Paciente en tratamiento de seguimiento.',
                  readOnly: false),
              const SizedBox(height: 10),

              _buildSeccionTitulo('2. MOTIVO DE CONSULTA'),
              const Divider(),
              _buildCampoConScroll(
                  'Motivo de consulta', 'Problema de comportamiento en clase.',
                  readOnly: false),
              const SizedBox(height: 16.0),

              _buildSeccionTitulo('3. DESENCADENANTES DE MOTIVO DE CONSULTA'),
              const Divider(),
              _buildCampoConScroll('Desencadenante de Consulta',
                  'Problemas familiares recientes.',
                  readOnly: false),
              const SizedBox(height: 16.0),

              _buildSeccionTitulo('4. ANTECEDENTES FAMILIARES'),
              const Divider(),
              // _buildCampoConScroll(
              //     'SOLO SI ES ADULTO', 'Sin antecedentes relevantes.',
              //     readOnly: false),
              // const SizedBox(height: 16.0),

              _buildCampoConTitulo(
                  'Datos de embarazo y parto', 'Embarazo sin complicaciones.',
                  readOnly: false),
              const SizedBox(height: 10.0),
              _buildCampoConTitulo('Datos Psicomotor', 'Desarrollo normal.',
                  readOnly: false),
              const SizedBox(height: 10.0),
              _buildCampoConTitulo('Desarrollo del lenguaje',
                  'Desarrollo adecuado para su edad.',
                  readOnly: false),
              const SizedBox(height: 10.0),
              _buildCampoConTitulo(
                  'Desarrollo intelectual', 'Capacidad intelectual normal.',
                  readOnly: false),
              const SizedBox(height: 10.0),
              _buildCampoConTitulo('Desarrollo socio-afectivo',
                  'Sin complicaciones importantes.',
                  readOnly: false),
              const SizedBox(height: 16.0),

              _buildSeccionTitulo('5. ANTECEDENTES Y ESTRUCTURA FAMILIAR'),
              const Divider(),
              _buildCampoConScroll('Descripción de los antecedentes',
                  'Familia nuclear, ambos padres vivos.',
                  readOnly: false),
              const SizedBox(height: 16.0),

              _buildSeccionTitulo('6. PRUEBAS APLICADAS'),
              const Divider(),
              _buildCampoConScroll('Descripción de las pruebas',
                  'Prueba psicológica estandarizada aplicada.',
                  readOnly: false),
              const SizedBox(height: 16.0),

              _buildSeccionTitulo('7. IMPRESIÓN DIAGNÓSTICA'),
              const Divider(),
              _buildCampoConScroll(
                  'Impresión diagnóstica', 'Posible trastorno de ansiedad.',
                  readOnly: false),
              const SizedBox(height: 16.0),

              _buildSeccionTitulo('8. ÁREAS DE INTERVENCIÓN'),
              const Divider(),
              _buildCampoConScroll('Descripción de las áreas',
                  'Intervención en habilidades sociales y manejo de emociones.',
                  readOnly: false),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
