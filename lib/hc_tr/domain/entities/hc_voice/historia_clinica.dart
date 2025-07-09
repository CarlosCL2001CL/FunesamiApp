class HistoriaClinica {
  String motivoDeConsulta;
  String esLaPrimeraVezQueTieneEstaDificultad;
  String desdeCuandoTieneEstaDificultad;
  String formaDeInicio;
  String aQueLoAtribuye;
  String comoLoAfecta;
  String cuandoSeAgrava;
  String comoHaSidoSuEvolucion;
  String momentoDelDiaConMayorDificultad;
  String enQueSituacionesAparecenMolestias;

  HistoriaClinica({
    required this.motivoDeConsulta,
    required this.esLaPrimeraVezQueTieneEstaDificultad,
    required this.desdeCuandoTieneEstaDificultad,
    required this.formaDeInicio,
    required this.aQueLoAtribuye,
    required this.comoLoAfecta,
    required this.cuandoSeAgrava,
    required this.comoHaSidoSuEvolucion,
    required this.momentoDelDiaConMayorDificultad,
    required this.enQueSituacionesAparecenMolestias,
  });

  HistoriaClinica copyWith({
    String? motivoDeConsulta,
    String? esLaPrimeraVezQueTieneEstaDificultad,
    String? desdeCuandoTieneEstaDificultad,
    String? formaDeInicio,
    String? aQueLoAtribuye,
    String? comoLoAfecta,
    String? cuandoSeAgrava,
    String? comoHaSidoSuEvolucion,
    String? momentoDelDiaConMayorDificultad,
    String? enQueSituacionesAparecenMolestias,
  }) {
    return HistoriaClinica(
      motivoDeConsulta: motivoDeConsulta ?? this.motivoDeConsulta,
      esLaPrimeraVezQueTieneEstaDificultad:
          esLaPrimeraVezQueTieneEstaDificultad ??
              this.esLaPrimeraVezQueTieneEstaDificultad,
      desdeCuandoTieneEstaDificultad:
          desdeCuandoTieneEstaDificultad ?? this.desdeCuandoTieneEstaDificultad,
      formaDeInicio: formaDeInicio ?? this.formaDeInicio,
      aQueLoAtribuye: aQueLoAtribuye ?? this.aQueLoAtribuye,
      comoLoAfecta: comoLoAfecta ?? this.comoLoAfecta,
      cuandoSeAgrava: cuandoSeAgrava ?? this.cuandoSeAgrava,
      comoHaSidoSuEvolucion:
          comoHaSidoSuEvolucion ?? this.comoHaSidoSuEvolucion,
      momentoDelDiaConMayorDificultad: momentoDelDiaConMayorDificultad ??
          this.momentoDelDiaConMayorDificultad,
      enQueSituacionesAparecenMolestias: enQueSituacionesAparecenMolestias ??
          this.enQueSituacionesAparecenMolestias,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "motivoDeConsulta": motivoDeConsulta,
      "esLaPrimeraVezQueTieneEstaDificultad":
          esLaPrimeraVezQueTieneEstaDificultad,
      "desdeCuandoTieneEstaDificultad": desdeCuandoTieneEstaDificultad,
      "formaDeInicio": formaDeInicio,
      "aQueLoAtribuye": aQueLoAtribuye,
      "comoLoAfecta": comoLoAfecta,
      "cuandoSeAgrava": cuandoSeAgrava,
      "comoHaSidoSuEvolucion": comoHaSidoSuEvolucion,
      "momentoDelDiaConMayorDificultad": momentoDelDiaConMayorDificultad,
      "enQueSituacionesAparecenMolestias": enQueSituacionesAparecenMolestias,
    };
  }

  factory HistoriaClinica.fromJson(Map<String, dynamic> json) {
    return HistoriaClinica(
      motivoDeConsulta: json["motivoDeConsulta"],
      esLaPrimeraVezQueTieneEstaDificultad:
          json["esLaPrimeraVezQueTieneEstaDificultad"],
      desdeCuandoTieneEstaDificultad: json["desdeCuandoTieneEstaDificultad"],
      formaDeInicio: json["formaDeInicio"],
      aQueLoAtribuye: json["aQueLoAtribuye"],
      comoLoAfecta: json["comoLoAfecta"],
      cuandoSeAgrava: json["cuandoSeAgrava"],
      comoHaSidoSuEvolucion: json["comoHaSidoSuEvolucion"],
      momentoDelDiaConMayorDificultad: json["momentoDelDiaConMayorDificultad"],
      enQueSituacionesAparecenMolestias:
          json["enQueSituacionesAparecenMolestias"],
    );
  }
}
