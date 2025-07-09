import 'package:flutter/material.dart';
import '/hc_tr/presentation/widgets/headerBusqueda.dart';

class SearchHcTrAa extends StatelessWidget {
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
          padding: EdgeInsets.all(16.0),
          children: [
            headerSHTRWidget(
              textoDinamico: 'anamnesis alimentaria adultos',
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
            _buildSection('1.- Antecedentes personales'),
            _buildFormField({'label': 'Nombre completo'}),
            _buildFormField({'label': 'Fecha de evaluación (dd/mm/aaaa)'}),
            Divider(),
            const SizedBox(height: 10),
            _buildRadioButtonGroup(
                "Lateralidad:", ["Diestro", "Zurdo", "Ambidiestro"]),
            Divider(),
            _buildSection('2 .- Independencia y autonomia'),
            _buildRadioButtonGroup("¿Se alimenta solo(a) o necesita ayuda?",
                ["Solo(a)", "Con ayuda parcial", "Con ayuda total"]),
            _buildRadioButtonGroup("¿Qué tipo de ayuda necesita?", [
              "Para identificar qué esta comiendo",
              "Para llevarse la comida a la boca/evitar derrames",
              "Ninguna"
            ]),
            _buildRadioButtonGroup(
                "¿Prepara sus propios alimentos o para alguien más?", [
              "SI",
              "NO",
            ]),
            _buildFormField({'label': '¿Por qué?'}),
            _buildRadioButtonGroup(
                "¿Decide qué alimentos desea consumir o participar activamente en estas decisiones en el hogar?",
                [
                  "SI",
                  "NO",
                ]),
            Divider(),
            _buildSection('3 .- Eficiencia'),
            _buildRadioButtonGroup(
                "¿Consume la totalidad del alimento que se le sirve?", [
              "SI",
              "NO",
            ]),
            _buildFormField({'label': '¿Qué porción consume?'}),
            _buildRadioButtonGroup(
                "¿Ha presentado pérdidas importantes de peso en el último tiempo?",
                [
                  "SI",
                  "NO",
                ]),
            _buildFormField({'label': '¿Cuántos kilos?'}),
            _buildRadioButtonGroup("¿Manifiesta interés por alimnetarse?", [
              "SI",
              "NO",
            ]),
            _buildRadioButtonGroup(
                "¿Manifiesta rechazo o preferencia por algún tipo de alimento?",
                [
                  "SI",
                  "NO",
                ]),
            _buildFormField({'label': '¿Cuál?'}),
            _buildFormField(
                {'label': '¿Qué tipo de líquido consume habitualmente?'}),
            _buildFormField({'label': '¿Cuánto líquido consume al día?'}),
            Divider(),
            _buildSection('4 .- Seguridad'),
            _buildRadioButtonGroup("¿Se atora con su saliva?", [
              "SI",
              "NO",
            ]),
            _buildFormField({'label': '¿Con qué frecuencia?'}),
            _buildRadioButtonGroup(
                "¿Tiene tos o ahogos cuando se alimenta o consume sus medicamentos?",
                [
                  "SI",
                  "NO",
                ]),
            _buildFormField(
                {'label': '¿Con qué alimento/liquido/medicamento?'}),
            _buildRadioButtonGroup(
                "¿Presenta alguna dificultad para tomar líquidos de un vaso?", [
              "SI",
              "NO",
            ]),
            _buildRadioButtonGroup(
                "¿Presenta dificultad con las sopas o los granos pequeños como el arroz?",
                [
                  "SI",
                  "NO",
                ]),
            _buildRadioButtonGroup("¿Ha presentado neumonías?", [
              "SI",
              "NO",
            ]),
            _buildFormField({'label': '¿Con qué frecuencia?'}),
            _buildRadioButtonGroup(
                "¿Se queda con restos de alimento en la boca luego de alimentarse?",
                [
                  "SI",
                  "NO",
                ]),
            _buildRadioButtonGroup(
                "¿Siente que el alimento se va hacia su nariz?", [
              "SI",
              "NO",
            ]),
            Divider(),
            _buildSection('5 .- Proceso de alimentación'),
            _buildRadioButtonGroup(
              '¿Se demora más tiempo que el resto de la familia?',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Cuánto?'}),
            _buildRadioButtonGroup(
              '¿Cree usted que come muy rápido?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Suele realizar alguna otra actividad mientras come?',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Cuál (es)?'}),
            Divider(),
            _buildSection('6 .- Salud bocal'),
            _buildRadioButtonGroup(
              '¿Cuenta con todas sus piezas dentarias/dientes?',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Por qué?'}),
            _buildRadioButtonGroup(
              '¿Utiliza placa dental?',
              ['SI', 'NO'],
            ),
            _buildRadioButtonGroup(
              '¿Se realiza aseo bucal después de cada comida?',
              ['SI', 'NO'],
            ),
            _buildFormField({
              'label':
                  '¿Con qué frecuencia se lava los dientes/lava su prótesis?'
            }),
            _buildRadioButtonGroup(
              '¿Asiste regularmente a controles dentales?',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Con qué frecuencia?'}),
            _buildRadioButtonGroup(
              '¿Tiene alguna molestia o dolor dentro de su boca (dientes, encías, paladar, lengua)?',
              ['SI', 'NO'],
            ),
            _buildFormField({'label': '¿Cúal?'}),
          ],
        ),
      ),

      ///BON GUARDAR
    );
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
}
