import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HistoriaClinicaVozPdfTemplate {
  static Future<String?> guardarYMostrarPdf(
    Map<String, dynamic> datos,
    BuildContext context,
    String cedula,
  ) async {
    try {
      final pdfBytes = await generarPdfPlantilla(datos);
      final dir = Directory('/storage/emulated/0/Documents');
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      final filePath = '${dir.path}/AreaTerapia_historiaClinicaVoz_$cedula.pdf';
      final file = File(filePath);
      await file.writeAsBytes(pdfBytes);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('PDF guardado en: $filePath'),
          duration: const Duration(seconds: 5),
        ));
      }

      return file.path;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al guardar PDF: $e'),
          backgroundColor: Colors.red,
        ));
      }
      return null;
    }
  }

  static Future<Uint8List> generarPdfPlantilla(
      Map<String, dynamic> datos) async {
    final pdf = pw.Document();
    final theme = pw.ThemeData.withFont(
      base: pw.Font.helvetica(),
      bold: pw.Font.helveticaBold(),
    );

    final ByteData imageData =
        await rootBundle.load('assets/imagenes/san-miguel.png');
    final Uint8List imageBytes = imageData.buffer.asUint8List();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: theme,
        margin: const pw.EdgeInsets.all(20),
        build: (context) => [
          _headerG("", logoImage: pdfImage),
          pw.SizedBox(height: 15),
          _header("HISTORIA CLÍNICA DE VOZ"),
          pw.SizedBox(height: 15),

          // DATOS DE IDENTIFICACIÓN
          _section("DATOS DE IDENTIFICACIÓN", [
            "Fecha de Evaluación: ${_formatDate(datos['fechaDeEvaluacion'])}",
            "Nombre completo: ${datos['nombreCompleto'] ?? ''}",
            "Fecha de nacimiento: ${_formatDate(datos['fechaNacimiento'])}",
            "Estado civil: ${datos['estadoCivil'] ?? ''}",
            "Ocupación actual: ${datos['ocupacionActual'] ?? ''}",
            "Dirección: ${datos['direccion'] ?? ''}",
            "Teléfono de contacto: ${datos['telefonoDeContacto'] ?? ''}",
            "Derivado por: ${datos['derivadoPor'] ?? ''}",
            "Razón de derivación: ${datos['razonDeDerivacion'] ?? ''}",
            "Diagnóstico ORL: ${datos['diagnosticoORL'] ?? ''}",
          ]),

          // HISTORIA CLÍNICA
          _section("HISTORIA CLÍNICA", [
            "Motivo de consulta: ${datos['historiaClinica']?['motivoDeConsulta'] ?? ''}",
            "¿Es la primera vez que tiene esta dificultad?: ${datos['historiaClinica']?['esLaPrimeraVezQueTieneEstaDificultad'] ?? ''}",
            "¿Desde cuándo tiene esta dificultad?: ${datos['historiaClinica']?['desdeCuandoTieneEstaDificultad'] ?? ''}",
            "Forma de inicio: ${datos['historiaClinica']?['formaDeInicio'] ?? ''}",
            "¿A qué lo atribuye?: ${datos['historiaClinica']?['aQueLoAtribuye'] ?? ''}",
            "¿Cómo lo afecta?: ${datos['historiaClinica']?['comoLoAfecta'] ?? ''}",
            "¿Cuándo se agrava?: ${datos['historiaClinica']?['cuandoSeAgrava'] ?? ''}",
            "¿Cómo ha sido su evolución?: ${datos['historiaClinica']?['comoHaSidoSuEvolucion'] ?? ''}",
            "Momento del día con mayor dificultad: ${datos['historiaClinica']?['momentoDelDiaConMayorDificultad'] ?? ''}",
            "¿En qué situaciones aparecen molestias?: ${datos['historiaClinica']?['enQueSituacionesAparecenMolestias'] ?? ''}",
          ]),

          // SINTOMATOLOGÍA
          _section("SINTOMATOLOGÍA", [
            "Fonastenia: ${datos['sintomologia']?['fonastenia'] ?? ''}",
            "Fonalgia: ${datos['sintomologia']?['fonalgia'] ?? ''}",
          ]),

          // ANTECEDENTES MÓRBIDOS
          _section("ANTECEDENTES MÓRBIDOS", [
            "¿Hay problemas de voz en su familia?: ${datos['antecendentesMorbidos']?['problemasDeVozEnSuFamilia'] ?? ''}",
            "¿Presenta alguna enfermedad?: ${datos['antecendentesMorbidos']?['presentaAlgunaEnfermedad'] ?? ''}",
            "¿Las emociones dañan su voz?: ${datos['antecendentesMorbidos']?['lasEmocionesDananSuVoz'] ?? ''}",
            "Medicamentos que toma: ${datos['antecendentesMorbidos']?['medicamentosQueToma'] ?? ''}",
            "Accidentes o enfermedades graves: ${datos['antecendentesMorbidos']?['accidentesOenfermedadesGravesQueHayaTenido'] ?? ''}",
            "¿Ha sido intervenido quirúrgicamente?: ${datos['antecendentesMorbidos']?['haSidoIntervenidoQuirurgicamente'] ?? ''}",
            "¿Ha sido entubado?: ${datos['antecendentesMorbidos']?['haSidoEntubado'] ?? ''}",
            "¿Ha consultado con otros profesionales?: ${datos['antecendentesMorbidos']?['haConsultadoConOtrosProfesionales'] ?? ''}",
          ]),

          // ANTECEDENTES TERAPÉUTICOS
          _section("ANTECEDENTES TERAPÉUTICOS", [
            "¿Ha recibido tratamiento foniátrico?: ${_boolToSiNo(datos['antecedentesTerapeuticos']?['haRecibidoTratamientoFoniatico'])}",
            "¿Cuándo?: ${datos['antecedentesTerapeuticos']?['cuando'] ?? ''}",
            "¿Cuánto tiempo?: ${datos['antecedentesTerapeuticos']?['cuantoTiempo'] ?? ''}",
            "¿Con qué profesional?: ${datos['antecedentesTerapeuticos']?['conQueProfesional'] ?? ''}",
            "¿Cuál fue el resultado?: ${datos['antecedentesTerapeuticos']?['cualFueElResultado'] ?? ''}",
            "¿Ha recibido tratamiento logopédico?: ${_boolToSiNo(datos['antecedentesTerapeuticos']?['haRecibidoTratamientoLogopedico'])}",
            "¿Cuándo?: ${datos['antecedentesTerapeuticos']?['cuandoLogopedico'] ?? ''}",
            "¿Cuánto tiempo?: ${datos['antecedentesTerapeuticos']?['cuantoTiempoLogopedico'] ?? ''}",
            "¿Con qué profesional?: ${datos['antecedentesTerapeuticos']?['conQueProfesionalLogopedico'] ?? ''}",
            "¿Cuál fue el resultado?: ${datos['antecedentesTerapeuticos']?['cualFueElResultadoLogopedico'] ?? ''}",
          ]),

          // ABUSO VOCAL
          _section("ABUSO VOCAL", [
            "¿Grita frecuentemente?: ${_boolToSiNo(datos['abusoVocal']?['gritaFrecuentemente'])}",
            "¿Habla en ambientes ruidosos?: ${_boolToSiNo(datos['abusoVocal']?['hablaEnAmbientesRuidosos'])}",
            "¿Habla por teléfono frecuentemente?: ${_boolToSiNo(datos['abusoVocal']?['hablaPorTelefonoFrecuentemente'])}",
            "¿Canta frecuentemente?: ${_boolToSiNo(datos['abusoVocal']?['cantaFrecuentemente'])}",
            "¿Hace imitaciones?: ${_boolToSiNo(datos['abusoVocal']?['haceImitaciones'])}",
            "¿Habla mucho?: ${_boolToSiNo(datos['abusoVocal']?['hablaMucho'])}",
            "¿Habla rápido?: ${_boolToSiNo(datos['abusoVocal']?['hablaRapido'])}",
            "¿Tose frecuentemente?: ${_boolToSiNo(datos['abusoVocal']?['toseFrecuentemente'])}",
            "¿Se aclara la garganta frecuentemente?: ${_boolToSiNo(datos['abusoVocal']?['seAclaraLaGargantaFrecuentemente'])}",
            "¿Llora frecuentemente?: ${_boolToSiNo(datos['abusoVocal']?['lloraFrecuentemente'])}",
            "¿Ríe frecuentemente?: ${_boolToSiNo(datos['abusoVocal']?['rieFrecuentemente'])}",
            "¿Hace deporte?: ${_boolToSiNo(datos['abusoVocal']?['haceDeporte'])}",
            "¿Qué deporte?: ${datos['abusoVocal']?['queDeporte'] ?? ''}",
            "¿Con qué frecuencia?: ${datos['abusoVocal']?['conQueFrecuencia'] ?? ''}",
          ]),

          // MAL USO VOCAL
          _section("MAL USO VOCAL", [
            "¿Habla con tensión?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConTension'])}",
            "¿Habla con respiración inadecuada?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConRespiracionInadecuada'])}",
            "¿Habla con postura inadecuada?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConPosturaInadecuada'])}",
            "¿Habla con tono inadecuado?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConTonoInadecuado'])}",
            "¿Habla con intensidad inadecuada?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConIntensidadInadecuada'])}",
            "¿Habla con ritmo inadecuado?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConRitmoInadecuado'])}",
            "¿Habla con articulación inadecuada?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConArticulacionInadecuada'])}",
            "¿Habla con resonancia inadecuada?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConResonanciaInadecuada'])}",
            "¿Habla con coordinación inadecuada?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConCoordinacionInadecuada'])}",
            "¿Habla con fonación inadecuada?: ${_boolToSiNo(datos['malUsoVocal']?['hablaConFonacionInadecuada'])}",
          ]),

          // FACTORES EXTERNOS
          _section("FACTORES EXTERNOS", [
            "¿Fuma?: ${_boolToSiNo(datos['factoresExternos']?['fuma'])}",
            "¿Cuántos cigarrillos al día?: ${datos['factoresExternos']?['cuantosCigarrillosAlDia'] ?? ''}",
            "¿Desde cuándo?: ${datos['factoresExternos']?['desdeCuando'] ?? ''}",
            "¿Bebe alcohol?: ${_boolToSiNo(datos['factoresExternos']?['bebeAlcohol'])}",
            "¿Qué tipo?: ${datos['factoresExternos']?['queTipo'] ?? ''}",
            "¿Con qué frecuencia?: ${datos['factoresExternos']?['conQueFrecuencia'] ?? ''}",
            "¿Consume drogas?: ${_boolToSiNo(datos['factoresExternos']?['consumeDrogas'])}",
            "¿Qué tipo?: ${datos['factoresExternos']?['queTipoDroga'] ?? ''}",
            "¿Con qué frecuencia?: ${datos['factoresExternos']?['conQueFrecuenciaDroga'] ?? ''}",
            "¿Está expuesto a polvo?: ${_boolToSiNo(datos['factoresExternos']?['estaExpuestoAPolvo'])}",
            "¿Está expuesto a humo?: ${_boolToSiNo(datos['factoresExternos']?['estaExpuestoAHumo'])}",
            "¿Está expuesto a productos químicos?: ${_boolToSiNo(datos['factoresExternos']?['estaExpuestoAProductosQuimicos'])}",
            "¿Está expuesto a cambios de temperatura?: ${_boolToSiNo(datos['factoresExternos']?['estaExpuestoACambiosDeTemperatura'])}",
            "¿Está expuesto a aire acondicionado?: ${_boolToSiNo(datos['factoresExternos']?['estaExpuestoAAireAcondicionado'])}",
            "¿Está expuesto a calefacción?: ${_boolToSiNo(datos['factoresExternos']?['estaExpuestoACalefaccion'])}",
          ]),

          // HÁBITOS GENERALES
          _section("HÁBITOS GENERALES", [
            "¿Cuánto tiempo duerme?: ${datos['habitosGenerales']?['cuantoTiempo'] ?? ''}",
            "Horas de sueño: ${datos['habitosGenerales']?['horasDeSueno'] ?? ''}",
            "¿Duerme bien?: ${_boolToSiNo(datos['habitosGenerales']?['duermeBien'])}",
            "¿Tiene problemas para dormir?: ${_boolToSiNo(datos['habitosGenerales']?['tieneProblemasParaDormir'])}",
            "¿Qué problemas?: ${datos['habitosGenerales']?['queProblemas'] ?? ''}",
            "¿Toma medicamentos para dormir?: ${_boolToSiNo(datos['habitosGenerales']?['tomaMedicamentosParaDormir'])}",
            "¿Qué medicamentos?: ${datos['habitosGenerales']?['queMedicamentos'] ?? ''}",
            "¿Tiene una dieta equilibrada?: ${_boolToSiNo(datos['habitosGenerales']?['tieneUnaDietaEquilibrada'])}",
            "¿Bebe suficiente agua?: ${_boolToSiNo(datos['habitosGenerales']?['bebeSuficienteAgua'])}",
            "¿Cuánta agua bebe al día?: ${datos['habitosGenerales']?['cuantaAguaBebeAlDia'] ?? ''}",
            "¿Hace ejercicio?: ${_boolToSiNo(datos['habitosGenerales']?['haceEjercicio'])}",
            "¿Qué tipo de ejercicio?: ${datos['habitosGenerales']?['queTipoDeEjercicio'] ?? ''}",
            "¿Con qué frecuencia?: ${datos['habitosGenerales']?['conQueFrecuenciaEjercicio'] ?? ''}",
            "¿Tiene estrés?: ${_boolToSiNo(datos['habitosGenerales']?['tieneEstres'])}",
            "¿Qué tipo de estrés?: ${datos['habitosGenerales']?['queTipoDeEstres'] ?? ''}",
            "¿Cómo maneja el estrés?: ${datos['habitosGenerales']?['comoManejaElEstres'] ?? ''}",
          ]),

          // USO LABORAL Y PROFESIONAL DE LA VOZ
          _section("USO LABORAL Y PROFESIONAL DE LA VOZ", [
            "Horas de trabajo: ${datos['usoLaboralProfesionalDeLaVoz']?['horasDeTrabajo'] ?? ''}",
            "Postura para trabajar: ${datos['usoLaboralProfesionalDeLaVoz']?['posturaParaTrabajar'] ?? ''}",
            "¿Utiliza su voz de forma prolongada?: ${datos['usoLaboralProfesionalDeLaVoz']?['utilizaSuVozDeFormaProlongada'] ?? ''}",
            "¿Realiza reposo vocal durante la jornada laboral?: ${datos['usoLaboralProfesionalDeLaVoz']?['realizaReposoVocalDuranteLaJornadaLaboral'] ?? ''}",
            "¿Ingiere líquidos durante la jornada laboral?: ${datos['usoLaboralProfesionalDeLaVoz']?['ingieroLiquidosDuranteLaJornadaLaboral'] ?? ''}",
            "¿Utiliza amplificación para cantar?: ${datos['usoLaboralProfesionalDeLaVoz']?['utilizaAmplificacionParaCantar'] ?? ''}",
            "¿Asiste a clases con profesionales de la voz?: ${datos['usoLaboralProfesionalDeLaVoz']?['asisteAClasesConProfesionalesDeLaVoz'] ?? ''}",
          ]),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.Widget _headerG(String title, {pw.MemoryImage? logoImage}) {
    return pw.Center(
      child: pw.Container(
        constraints: pw.BoxConstraints(maxWidth: PdfPageFormat.a4.width - 40),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            if (logoImage != null)
              pw.Container(
                width: 180,
                height: 150,
                child: pw.Image(logoImage, fit: pw.BoxFit.contain),
              ),
            if (logoImage != null) pw.SizedBox(width: 15),
            pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'FUNDACION DE NIÑOS ESPECIALES',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  '"SAN MIGUEL" FUNESAMI',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Text(
                  'HISTORIA CLÍNICA DE TERAPIAS',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  title,
                  style: pw.TextStyle(
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _header(String title) {
    return pw.Center(
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.red,
        ),
      ),
    );
  }

  static pw.Widget _section(String title, List<String> lines) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 12),
        pw.Container(
          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: pw.BoxDecoration(
            color: PdfColors.lightBlueAccent,
            borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
          ),
          child: pw.Text(
            title,
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.SizedBox(height: 6),
        ...lines.map((line) => pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 2),
              child: pw.Text(line, style: const pw.TextStyle(fontSize: 11)),
            )),
      ],
    );
  }

  static String _formatDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return 'No especificada';
    try {
      final date = DateTime.tryParse(isoDate);
      return date != null ? DateFormat('dd/MM/yyyy').format(date) : isoDate;
    } catch (_) {
      return isoDate;
    }
  }

  static String _boolToSiNo(dynamic value) {
    if (value == true) return 'SI';
    if (value == false) return 'NO';
    return '';
  }
}
