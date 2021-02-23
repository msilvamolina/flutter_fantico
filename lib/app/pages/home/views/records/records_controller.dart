import 'package:get/get.dart';

import '../../../../data/models/forecast/forecast.dart';
import '../../../../data/models/records/records.dart';
import '../../../../utils/hacks.dart';
import '../../../../utils/utils.dart';
import '../../home_controller.dart';

class RecordsController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();

  // List<Forecast> get forecastUserList => _homeController.forecastUserList;
  @override
  void onInit() {
    super.onInit();
  }

  Records getForecastResults(type) {
    List<Forecast> forecasts = Hacks().forecastToUserList(
        _homeController.forecastList, _homeController.userLocal.email);

    DateTime startDate, endDate;
    DateTime date = DateTime.now();

    if (type == 'week') {
      int weekday = date.weekday;
      int weekStart = weekday - 1;
      int weekend = 7 - weekday;

      DateTime weekStartDate = date.add(Duration(days: -weekStart));
      DateTime weekEndDate = date.add(Duration(days: weekend));

      String _weekStartStr = Utils().onlyDate(weekStartDate);
      String _weekEndStr = Utils().onlyDate(weekEndDate);

      String _newWeekStartStr = _weekStartStr + " 00:00:00";
      String _newWeekEndStr = _weekEndStr + " 23:59:59";

      startDate = DateTime.parse(_newWeekStartStr);
      endDate = DateTime.parse(_newWeekEndStr);
    }

    if (type == 'month') {
      startDate = DateTime(date.year, date.month, 1);
      endDate = DateTime(date.year, date.month + 1, 1);
    }
    if (type == 'history') {
      startDate = DateTime.parse('2020-01-01 00:00:00');
      endDate = date.add(Duration(days: 1));
    }

    List<Forecast> listToAnalize = [];
    for (var i = 0; i < forecasts.length; i++) {
      Forecast _f = forecasts[i];
      DateTime eventDate = DateTime.parse(_f.event_date);
      bool incluirForecast = true;

      if (startDate != null && endDate != null) {
        bool isAfterStartDate = !(eventDate.difference(startDate).isNegative);
        bool isBeforeEndDate = eventDate.difference(endDate).isNegative;
        incluirForecast = isAfterStartDate && isBeforeEndDate;
      }

      if (incluirForecast) {
        listToAnalize.add(_f);
      }
    }

    int racha = 0;
    int pronosticosDeResultados = 0;
    int acertados = 0;
    int fallados = 0;
    int anulados = 0;
    int cantidadTotal = 0;
    int rachaPositivaMasLarga = 0;
    int rachaNegativaMasLarga = 0;
    double porcentajeDeAcierto = 0;

    bool continuarConteoRachaPositiva = true;
    bool continuarConteoRachaNegativa = true;

    for (var i = 0; i < listToAnalize.length; i++) {
      Forecast _f = listToAnalize[i];

      if (_f.closed) {
        cantidadTotal++;
        bool positiva = false;
        bool negativa = false;
        if (_f.result == 'right') {
          acertados++;
          positiva = true;
        } else if (_f.result == 'failed') {
          fallados++;
          negativa = true;
        } else if (_f.result == 'canceled') {
          anulados++;
        }

        if (_f.agregarAMiRacha) {
          if (positiva) {
            racha++;
          }
          if (continuarConteoRachaPositiva) {
            if (positiva) {
              rachaPositivaMasLarga++;
            } else {
              if (rachaPositivaMasLarga > 0) {
                continuarConteoRachaPositiva = false;
              }
            }
          }
          if (continuarConteoRachaNegativa) {
            if (negativa) {
              rachaNegativaMasLarga++;
            } else {
              if (rachaNegativaMasLarga > 0) {
                continuarConteoRachaNegativa = false;
              }
            }
          }
        }

        if (_f.predecirResultado) {
          pronosticosDeResultados++;
        }
      }
    }
    if (acertados > 0 && cantidadTotal > 0) {
      porcentajeDeAcierto = (acertados * 100) / cantidadTotal;
    }

    Records records = Records(
      type: type,
      racha: racha,
      pronosticosDeResultados: pronosticosDeResultados,
      acertados: acertados,
      fallados: fallados,
      anulados: anulados,
      cantidadTotal: cantidadTotal,
      rachaPositivaMasLarga: rachaPositivaMasLarga,
      rachaNegativaMasLarga: rachaNegativaMasLarga,
      porcentajeDeAcierto: porcentajeDeAcierto,
    );
    return records;
  }
}
