class UsoLaboralProfesionalDeLaVoz {
  int horasDeTrabajo;
  String posturaParaTrabajar;
  String utilizaSuVozDeFormaProlongada;
  String realizaReposoVocalDuranteLaJornadaLaboral;
  String ingieroLiquidosDuranteLaJornadaLaboral;
  String utilizaAmplificacionParaCantar;
  String asisteAClasesConProfesionalesDeLaVoz;

  UsoLaboralProfesionalDeLaVoz({
    required this.horasDeTrabajo,
    required this.posturaParaTrabajar,
    required this.utilizaSuVozDeFormaProlongada,
    required this.realizaReposoVocalDuranteLaJornadaLaboral,
    required this.ingieroLiquidosDuranteLaJornadaLaboral,
    required this.utilizaAmplificacionParaCantar,
    required this.asisteAClasesConProfesionalesDeLaVoz,
  });

  UsoLaboralProfesionalDeLaVoz copyWith({
    int? horasDeTrabajo,
    String? posturaParaTrabajar,
    String? utilizaSuVozDeFormaProlongada,
    String? realizaReposoVocalDuranteLaJornadaLaboral,
    String? ingieroLiquidosDuranteLaJornadaLaboral,
    String? utilizaAmplificacionParaCantar,
    String? asisteAClasesConProfesionalesDeLaVoz,
  }) {
    return UsoLaboralProfesionalDeLaVoz(
      horasDeTrabajo: horasDeTrabajo ?? this.horasDeTrabajo,
      posturaParaTrabajar: posturaParaTrabajar ?? this.posturaParaTrabajar,
      utilizaSuVozDeFormaProlongada:
          utilizaSuVozDeFormaProlongada ?? this.utilizaSuVozDeFormaProlongada,
      realizaReposoVocalDuranteLaJornadaLaboral:
          realizaReposoVocalDuranteLaJornadaLaboral ??
              this.realizaReposoVocalDuranteLaJornadaLaboral,
      ingieroLiquidosDuranteLaJornadaLaboral:
          ingieroLiquidosDuranteLaJornadaLaboral ??
              this.ingieroLiquidosDuranteLaJornadaLaboral,
      utilizaAmplificacionParaCantar:
          utilizaAmplificacionParaCantar ?? this.utilizaAmplificacionParaCantar,
      asisteAClasesConProfesionalesDeLaVoz:
          asisteAClasesConProfesionalesDeLaVoz ??
              this.asisteAClasesConProfesionalesDeLaVoz,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "horasDeTrabajo": horasDeTrabajo,
      "posturaParaTrabajar": posturaParaTrabajar,
      "utilizaSuVozDeFormaProlongada": utilizaSuVozDeFormaProlongada,
      "realizaReposoVocalDuranteLaJornadaLaboral":
          realizaReposoVocalDuranteLaJornadaLaboral,
      "ingieroLiquidosDuranteLaJornadaLaboral":
          ingieroLiquidosDuranteLaJornadaLaboral,
      "utilizaAmplificacionParaCantar": utilizaAmplificacionParaCantar,
      "asisteAClasesConProfesionalesDeLaVoz":
          asisteAClasesConProfesionalesDeLaVoz,
    };
  }

  factory UsoLaboralProfesionalDeLaVoz.fromJson(Map<String, dynamic> json) {
    return UsoLaboralProfesionalDeLaVoz(
      horasDeTrabajo: json["horasDeTrabajo"],
      posturaParaTrabajar: json["posturaParaTrabajar"],
      utilizaSuVozDeFormaProlongada: json["utilizaSuVozDeFormaProlongada"],
      realizaReposoVocalDuranteLaJornadaLaboral:
          json["realizaReposoVocalDuranteLaJornadaLaboral"],
      ingieroLiquidosDuranteLaJornadaLaboral:
          json["ingieroLiquidosDuranteLaJornadaLaboral"],
      utilizaAmplificacionParaCantar: json["utilizaAmplificacionParaCantar"],
      asisteAClasesConProfesionalesDeLaVoz:
          json["asisteAClasesConProfesionalesDeLaVoz"],
    );
  }
}
