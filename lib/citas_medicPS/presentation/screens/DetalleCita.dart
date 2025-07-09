import 'package:flutter/material.dart';
import 'package:h_c_1/citas_medicPS/presentation/widgets/headerCT.dart';

class DetalleCita extends StatelessWidget {
  final Map<String, dynamic> cita;
  final String estadoSeleccionado;
  final void Function(String) onEstadoChanged;

  DetalleCita({
    required this.cita,
    required this.estadoSeleccionado,
    required this.onEstadoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Cita'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCTWidget(
                textoDinamico: '',
                textoCitasMedicas: 'SECCIÓN DE DETALLE',
              ),
              const SizedBox(height: 20),
              Divider(),
              Center(
                child: Text(
                  'DETALLE DE LA CITA',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text('Área: ${cita['area']}',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text('Paciente: ${cita['patient']}',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text('Fecha: ${cita['fecha']}',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text('Hora: ${cita['hora']}',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(
                        'Síntomas: Tratamiento de la ansiedad por fatiga escolar ',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text('Estado:', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 10),
                        DropdownButton<String>(
                          value: estadoSeleccionado,
                          items: ['pendiente', 'aceptado'].map((estado) {
                            return DropdownMenuItem(
                              value: estado,
                              child: Text(estado),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              onEstadoChanged(value);
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Lógica para guardar la cita
                          Navigator.pop(context, {
                            'area': cita['area'],
                            'fecha': cita['fecha'],
                            'hora': cita['hora'],
                            'diagnosis': cita['diagnosis'],
                            'estado': estadoSeleccionado,
                          });
                        },
                        icon: Icon(Icons.save),
                        label: Text('Guardar'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
