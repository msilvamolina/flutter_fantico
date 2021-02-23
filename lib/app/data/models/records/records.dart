import 'package:freezed_annotation/freezed_annotation.dart';

part 'records.freezed.dart';

@freezed
abstract class Records implements _$Records {
  const Records._();

  const factory Records({
    @required String type,
    @required int racha,
    @required int pronosticosDeResultados,
    @required int acertados,
    @required int fallados,
    @required int anulados,
    @required int cantidadTotal,
    @required int rachaPositivaMasLarga,
    @required int rachaNegativaMasLarga,
    @required double porcentajeDeAcierto,
  }) = _Records;
}
