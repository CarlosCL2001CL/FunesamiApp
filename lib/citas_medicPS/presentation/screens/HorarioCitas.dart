import 'package:flutter/material.dart';
import 'package:h_c_1/citas_medicPS/presentation/screens/GenerarCitas.dart';
import 'package:h_c_1/citas_medicPS/presentation/widgets/NavigationButtonCT.dart';
import 'package:h_c_1/citas_medicPS/presentation/widgets/headerCT.dart';
import 'package:table_calendar/table_calendar.dart';

class HorarioCitas extends StatelessWidget {
  final DateTime _focusedDay = DateTime.now();
  final DateTime? _selectedDay = null;

  final List<Map<String, dynamic>> citas = List.generate(10, (index) {
    return {
      'area': 'Área ${index + 1}',
      'fecha': DateTime(2025, 1, (index % 9) + 1),
      'hora': '${9 + index % 12}:00 AM',
      'estado': index % 2 == 0 ? 'pendiente' : 'aceptado',
    };
  });

  bool _isCitaAsignada(DateTime day) {
    return citas.any((cita) =>
        isSameDay(cita['fecha'], day) && cita['estado'] == 'pendiente');
  }

  void _editarCita(BuildContext context, Map<String, dynamic> cita) {
    TextEditingController areaController =
        TextEditingController(text: cita['area']);
    TextEditingController horaController =
        TextEditingController(text: cita['hora']);
    DateTime? selectedDate = cita['fecha'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Cita'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: areaController,
                decoration: InputDecoration(labelText: 'Área'),
              ),
              TextField(
                controller: horaController,
                decoration: InputDecoration(labelText: 'Hora'),
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;
                  }
                },
                child: Text('Seleccionar Fecha'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                cita['area'] = areaController.text;
                cita['hora'] = horaController.text;
                cita['fecha'] = selectedDate ?? cita['fecha'];
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horario de Citas'),
      ),
      body: Column(
        children: [
          HeaderCTWidget(
            textoDinamico: '  HORARIO DE CITAS MÉDICAS',
            textoCitasMedicas: '                    HORARIO',
          ),
          const SizedBox(height: 20),
          SizedBox(height: 15),
          NavigationButtonCT(
            navigationRoute: (context) => GenerarCitas(),
            buttonText: 'AGENDAR UNA CITA',
          ),
          SizedBox(height: 20),
          Divider(),
          TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              // Lógica de selección de día sin estado
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if (_isCitaAsignada(day)) {
                  return Center(
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: citas
                  .where((cita) =>
                      cita['estado'] == 'aceptado' &&
                      isSameDay(cita['fecha'], _selectedDay))
                  .map((cita) {
                return ListTile(
                  leading: Icon(Icons.event_available, color: Colors.green),
                  title: Text('${cita['area']}'),
                  subtitle:
                      Text('${cita['fecha'].toLocal()} a las ${cita['hora']}'),
                  onTap: () => _editarCita(context, cita),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
