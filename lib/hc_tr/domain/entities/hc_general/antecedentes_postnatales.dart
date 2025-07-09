import 'package:h_c_1/hc_tr/domain/entities/hc_general/alimentacion.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_general/desarrollo_motor_fino.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_general/desarrollo_motor_grueso.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_general/especificaciones.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_general/habitos_personale.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_general/reflejos_primitivos.dart';

class AntecedentesPostnatales {
  Alimentacion alimentacion;
  DesarrolloMotorGrueso desarrolloMotorGrueso;
  ReflejosPrimitivos reflejosPrimitivos;
  DesarrolloMotorFino desarrolloMotorFino;
  Especificaciones especificaciones;
  HabitosPersonales habitosPersonales;

  AntecedentesPostnatales({
    required this.alimentacion,
    required this.desarrolloMotorGrueso,
    required this.reflejosPrimitivos,
    required this.desarrolloMotorFino,
    required this.especificaciones,
    required this.habitosPersonales,
  });

  AntecedentesPostnatales copyWith({
    Alimentacion? alimentacion,
    DesarrolloMotorGrueso? desarrolloMotorGrueso,
    ReflejosPrimitivos? reflejosPrimitivos,
    DesarrolloMotorFino? desarrolloMotorFino,
    Especificaciones? especificaciones,
    HabitosPersonales? habitosPersonales,
  }) {
    return AntecedentesPostnatales(
      alimentacion: alimentacion ?? this.alimentacion,
      desarrolloMotorGrueso:
          desarrolloMotorGrueso ?? this.desarrolloMotorGrueso,
      reflejosPrimitivos: reflejosPrimitivos ?? this.reflejosPrimitivos,
      desarrolloMotorFino: desarrolloMotorFino ?? this.desarrolloMotorFino,
      especificaciones: especificaciones ?? this.especificaciones,
      habitosPersonales: habitosPersonales ?? this.habitosPersonales,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alimentacion': alimentacion.toJson(),
      'desarrolloMotorGrueso': desarrolloMotorGrueso.toJson(),
      'reflejosPrimitivos': reflejosPrimitivos.toJson(),
      'desarrolloMotorFino': desarrolloMotorFino.toJson(),
      'especificaciones': especificaciones.toJson(),
      'habitosPersonales': habitosPersonales.toJson(),
    };
  }

  factory AntecedentesPostnatales.fromJson(Map<String, dynamic> json) {
    return AntecedentesPostnatales(
      alimentacion: Alimentacion.fromJson(json['alimentacion']),
      desarrolloMotorGrueso:
          DesarrolloMotorGrueso.fromJson(json['desarrolloMotorGrueso']),
      reflejosPrimitivos:
          ReflejosPrimitivos.fromJson(json['reflejosPrimitivos']),
      desarrolloMotorFino:
          DesarrolloMotorFino.fromJson(json['desarrolloMotorFino']),
      especificaciones: Especificaciones.fromJson(json['especificaciones']),
      habitosPersonales: HabitosPersonales.fromJson(json['habitosPersonales']),
    );
  }
}
