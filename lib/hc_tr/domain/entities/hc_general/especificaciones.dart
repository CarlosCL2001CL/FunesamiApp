class Especificaciones {
  String intensionComunicativaHospitalizaciones;
  String traumatismo;
  String infecciones;
  String reaccionesPeculiaresVacunas;
  String desnutricionOObesidad;
  String cirugias;
  String convulsiones;
  String medicacion;
  String sindromes;
  String observaciones;
  String diagnosticStudies;

  Especificaciones({
    required this.intensionComunicativaHospitalizaciones,
    required this.traumatismo,
    required this.infecciones,
    required this.reaccionesPeculiaresVacunas,
    required this.desnutricionOObesidad,
    required this.cirugias,
    required this.convulsiones,
    required this.medicacion,
    required this.sindromes,
    required this.observaciones,
    required this.diagnosticStudies,
  });

  Especificaciones copyWith({
    String? intensionComunicativaHospitalizaciones,
    String? traumatismo,
    String? infecciones,
    String? reaccionesPeculiaresVacunas,
    String? desnutricionOObesidad,
    String? cirugias,
    String? convulsiones,
    String? medicacion,
    String? sindromes,
    String? observaciones,
    String? diagnosticStudies,
  }) {
    return Especificaciones(
      intensionComunicativaHospitalizaciones:
          intensionComunicativaHospitalizaciones ??
              this.intensionComunicativaHospitalizaciones,
      traumatismo: traumatismo ?? this.traumatismo,
      infecciones: infecciones ?? this.infecciones,
      reaccionesPeculiaresVacunas:
          reaccionesPeculiaresVacunas ?? this.reaccionesPeculiaresVacunas,
      desnutricionOObesidad:
          desnutricionOObesidad ?? this.desnutricionOObesidad,
      cirugias: cirugias ?? this.cirugias,
      convulsiones: convulsiones ?? this.convulsiones,
      medicacion: medicacion ?? this.medicacion,
      sindromes: sindromes ?? this.sindromes,
      observaciones: observaciones ?? this.observaciones,
      diagnosticStudies: diagnosticStudies ?? this.diagnosticStudies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'intensionComunicativaHospitalizaciones':
          intensionComunicativaHospitalizaciones,
      'traumatismo': traumatismo,
      'infecciones': infecciones,
      'reaccionesPeculiaresVacunas': reaccionesPeculiaresVacunas,
      'desnutricionOObesidad': desnutricionOObesidad,
      'cirugias': cirugias,
      'convulsiones': convulsiones,
      'medicacion': medicacion,
      'sindromes': sindromes,
      'observaciones': observaciones,
      'diagnosticStudies': diagnosticStudies,
    };
  }

  factory Especificaciones.fromJson(Map<String, dynamic> json) {
    return Especificaciones(
      intensionComunicativaHospitalizaciones:
          json['intensionComunicativaHospitalizaciones'],
      traumatismo: json['traumatismo'],
      infecciones: json['infecciones'],
      reaccionesPeculiaresVacunas: json['reaccionesPeculiaresVacunas'],
      desnutricionOObesidad: json['desnutricionOObesidad'],
      cirugias: json['cirugias'],
      convulsiones: json['convulsiones'],
      medicacion: json['medicacion'],
      sindromes: json['sindromes'],
      observaciones: json['observaciones'],
      diagnosticStudies: json['diagnosticStudies'],
    );
  }
}
