import 'package:flutter/material.dart';
import '/hc_tr/presentation/widgets/headerBusqueda.dart';

class SearchHcTrVoz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Area de Terapias',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            headerSHTRWidget(
              textoDinamico: '      Anamnesis de Voz',
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
            _buildSection('1.- Datos de identificación'),
            _buildFormField({'label': 'Nombre completo'}),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildFormField(
                      {'label': 'Fecha nacimiento (dd/mm/aaaa)'}),
                ),
                const SizedBox(width: 10), // Separación entre los campos
                Expanded(
                  flex: 1,
                  child: _buildFormField({'label': 'Edad'}),
                ),
              ],
            ),
            const Divider(),
            _buildRadioButtonGroup(
                "Estado civil:", ["Soltero", "Casado", "Otro"]),
            Divider(),
            _buildFormField({'label': 'Ocupación actual'}),
            _buildFormField({'label': 'Dirección'}),
            _buildFormField({'label': 'Derivado por'}),
            _buildFormField({'label': 'Razón de la derivación'}),
            _buildFormField({'label': 'Diagnostico ORL'}),
            _buildFormField({'label': 'Teléfono de contacto'}),
            _buildFormField({'label': 'Fecha de evaluación (dd/mm/aaaa)'}),
            Divider(),
            _buildSection('2.- Historia clínica'),
            _buildFormField({'label': 'Motivo de consulta'}),
            _buildFormField(
                {'label': '¿Es la primera vez que tiene esta dificultad?'}),
            _buildFormField({'label': '¿Cuándo comenzó el problema?'}),
            _buildFormField({'label': 'Forma de inicio'}),
            _buildFormField({'label': '¿A qué lo atribuye?'}),
            _buildFormField({'label': '¿Cómo lo afecta?'}),
            _buildFormField({'label': '¿Cuándo se agrava?'}),
            _buildFormField({'label': '¿Como ha sido su evolución?'}),
            _buildFormField({'label': 'Momento del dia con mayor dificultad'}),
            _buildFormField(
                {'label': '¿En qué situaciones aparecen molestias?'}),
            Divider(),
            _buildSection('3.- Sintomatología'),
            _buildRadioButtonGroup(
              'Fonastenia',
              ['SI', 'NO', 'Leve', 'Moderado', 'Severo'],
            ),
            _buildRadioButtonGroup(
              'Fonalgia (dolor al hablar)',
              ['SI', 'NO', 'Leve', 'Moderado', 'Severo'],
            ),
            _buildRadioButtonGroup(
              'Tensión en fonación',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Sensación de constricción en el cuello',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Sensación de cuerpo extraño',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Descarga posterior',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Odinofagia',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Extensión tonal reducida',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Picor laríngeo',
              ['SI', 'NO'],
            ),
            Divider(),
            _buildSection('4 .- Antecedentes mórbidos'),
            Text("     En relación a ciertas enfermedades:"),
            _buildFormField(
                {'label': 'Existen problemas de voz en su familia ¿Cuáles?'}),
            _buildRadioButtonGroup(
              '¿Presenta alguna enfermedad?',
              ['Respiratoria', 'Auditiva', 'Digestiva', 'Psicológica'],
            ),
            _buildRadioButtonGroup(
              '¿Sufre de estrés?',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Las emociones dañan su voz?'}),
            _buildFormField({'label': '¿Utiliza algún medicamento? ¿Cuáles?'}),
            _buildFormField({
              'label':
                  '¿Ha sufrido accidentes, enfermedades graves, hospitalizaciones, etc?'
            }),
            _buildFormField(
                {'label': '¿Ha sido intervenido quirúrgicamente?¿Por qué?'}),
            _buildFormField({'label': '¿Ha sido entubado?¿Por cuánto tiempo?'}),
            _buildFormField(
                {'label': '¿Ha consultado con otros profesionales?'}),
            Divider(),
            _buildSection('5 .- Antecedentes terapéuticos'),
            _buildRadioButtonGroup(
              '¿Ha recibido tratamiento médico por problemas de la voz?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Se ha realizado exámenes?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Ha recibido tratamiento fonoaudiológico por problemas de voz?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Ha recibido técnica vocal?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Aplica la técnica vocal?',
              ['SI', 'NO'],
            ),
            Divider(),
            _buildSection('6 .- Abuso vocal'),
            _buildRadioButtonGroup(
              'Tose en exceso',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Grita en exceso',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Habla mucho',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Habla rápido',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Imita voces',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Habla con exceso de ruido',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Reduce el uso de la voz en resfríos?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Carraspea en exceso',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Habla forzando la voz?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Habla al mismo tiempo que otras personas?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Habla con dientes, hombro y cuello apretado?',
              ['SI', 'NO'],
            ),
            Divider(),
            _buildSection('7 .- Mal uso vocal'),
            _buildRadioButtonGroup(
              'Trata de hablar con un tono más agudo o grave que el suyo',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Trata de hablar con un volumen de voz más débil o alto de lo usual',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Canta fuera de registro',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Canta sin vocalizar',
              ['SI', 'NO'],
            ),
            Divider(),
            _buildSection('8 .- Factores externos'),
            _buildRadioButtonGroup(
              'Vive en ambiente de fumadores',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Trabaja en un ambiente ruidoso',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Permanece en ambiente con aire acondicionado',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Permanece en ambientes con poca ventilación',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Se expone a cambios bruscos de temperatura',
              ['SI', 'NO'],
            ),
            Divider(),
            _buildSection('9.- Hábitos generales'),
            _buildRadioButtonGroup(
              'Realiza reposo vocal',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Cuanto tiempo?'}),
            _buildRadioButtonGroup(
              'Habla mucho tiempo sin beber liquido',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Asiste al otorrinolaringólogo?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Consume alimentos muy condimentados',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Consume alimentos muy calientes o muy fríos',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Consume bebidas alcohólicas',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Fuma',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Consume café',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Consume drogas',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              'Utiliza ropa ajustada',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Cuántas horas duerme?'}),
            Divider(),
            _buildSection('10.- Uso laboral y profesinal de la voz'),
            _buildFormField({'label': '¿Cuántas horas trabaja?'}),
            _buildFormField({'label': '¿Cuál es su postura para trabajar?'}),
            _buildFormField({
              'label':
                  '¿Utiliza su voz de forma prolongada durante la jornada laboral?'
            }),
            _buildFormField(
                {'label': '¿Realiza reposo vocal durante su jornada laboral?'}),
            _buildFormField({'label': '¿Ingiere líquidos durante su trabajo?'}),
            _buildFormField({'label': '¿Utiliza amplificación para cantar?'}),
            _buildFormField(
                {'label': '¿Asiste a clases con profesionales de la voz?'}),
          ],
        ),
      ),
    );
  }
}

Widget _buildSection(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 9.0),
    child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
  );
}

Widget _buildFormField(Map<String, dynamic> field) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: field['label'],
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor complete este campo';
        }
        return null;
      },
    ),
  );
}

Widget _buildRadioButtonGroup(String title, List<String> options) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
      Wrap(
        spacing: 20.0, // Espacio horizontal entre opciones
        runSpacing:
            10.0, // Espacio vertical cuando se ajusta a la siguiente línea
        alignment: WrapAlignment.start,
        children: options.map((option) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                value: option,
                groupValue: null, // Aquí se configurará el valor del grupo
                onChanged: (value) {},
              ),
              Text(option),
            ],
          );
        }).toList(),
      ),
    ],
  );
}
