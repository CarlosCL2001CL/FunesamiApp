import 'package:flutter/material.dart';
import 'package:h_c_1/citas_medicPS/presentation/widgets/headerCT.dart';

class GenerarCitas extends StatelessWidget {
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final ValueNotifier<String?> _selectedArea = ValueNotifier(null);
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier(null);
  final ValueNotifier<String?> _selectedTime = ValueNotifier(null);

  final List<String> areas = [
    'Área 1',
    'Área 2',
    'Área 3',
    'Área 4',
    'Área 5',
    'Área 6',
    'Área 7',
    'Área 8'
  ];

  final List<String> patientNames = [
    'Juan Pérez',
    'María López',
    'Carlos García',
    'Ana Torres',
    'Luis Fernández'
  ];

  final ValueNotifier<List<String>> filteredPatients =
      ValueNotifier<List<String>>([]);

  GenerarCitas() {
    filteredPatients.value = patientNames;
  }

  void _searchPatients() {
    filteredPatients.value = patientNames
        .where((name) =>
            name.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      _selectedDate.value = pickedDate;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      _selectedTime.value = pickedTime.format(context);
    }
  }

  void _saveAppointment() {
    if (_selectedArea.value != null &&
        _selectedDate.value != null &&
        _selectedTime.value != null &&
        _patientNameController.text.isNotEmpty &&
        _diagnosisController.text.isNotEmpty) {
      print(
          'Cita creada: Área: ${_selectedArea.value}, Paciente: ${_patientNameController.text}, Diagnóstico: ${_diagnosisController.text}, Fecha: ${_selectedDate.value}, Hora: ${_selectedTime.value}');
    } else {
      print('Por favor complete todos los campos.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar una cita'),
      ),
      resizeToAvoidBottomInset:
          true, // Ajusta automáticamente cuando aparece el teclado
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCTWidget(
                textoDinamico: '  AGENDACIÓN DE CITAS MÉDICAS',
                textoCitasMedicas: '',
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration:
                          InputDecoration(labelText: 'Buscar por cédula'),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _searchPatients,
                    child: Text('Buscar'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: AnimatedBuilder(
                        animation: _selectedDate,
                        builder: (_, __) => Text(_selectedDate.value == null
                            ? 'Seleccionar Fecha'
                            : 'Fecha: ${_selectedDate.value}'),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: AnimatedBuilder(
                        animation: _selectedTime,
                        builder: (_, __) => Text(_selectedTime.value == null
                            ? 'Seleccionar Hora'
                            : 'Hora: ${_selectedTime.value}'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: _patientNameController,
                decoration: InputDecoration(labelText: 'Nombre del Paciente'),
              ),
              TextField(
                controller: _diagnosisController,
                decoration: InputDecoration(labelText: 'Diagnóstico'),
              ),
              AnimatedBuilder(
                animation: _selectedArea,
                builder: (context, _) => DropdownButtonFormField<String>(
                  value: _selectedArea.value,
                  hint: Text('Seleccione un Área'),
                  items: areas.map((area) {
                    return DropdownMenuItem(value: area, child: Text(area));
                  }).toList(),
                  onChanged: (value) => _selectedArea.value = value,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveAppointment,
                child: Text('Guardar Cita'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
