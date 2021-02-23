import 'dart:collection';

import 'package:flutter/material.dart';

import 'responsive.dart';

class Utils {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  String quitarAcentos(String elemento) {
    elemento = elemento.replaceAll('á', 'a');
    elemento = elemento.replaceAll('é', 'e');
    elemento = elemento.replaceAll('í', 'i');
    elemento = elemento.replaceAll('ó', 'o');
    elemento = elemento.replaceAll('ú', 'u');
    elemento = elemento.replaceAll('ñ', 'n');
    elemento = elemento.replaceAll('ä', 'a');
    elemento = elemento.replaceAll('ë', 'e');
    elemento = elemento.replaceAll('ï', 'i');
    elemento = elemento.replaceAll('ö', 'o');
    elemento = elemento.replaceAll('ü', 'u');
    return elemento;
  }

  String superAmigable(String elemento) {
    String variable = quitarAcentos(elemento.trim().toLowerCase());
    variable = variable.replaceAll('   ', '-');
    variable = variable.replaceAll('  ', '-');
    variable = variable.replaceAll(' ', '-');
    variable = variable.replaceAll('.', '');
    variable = variable.replaceAll("'", '');
    variable = variable.replaceAll('"', '');
    variable = variable.replaceAll('+', '');
    variable = variable.replaceAll('(', '');
    variable = variable.replaceAll(')', '');
    variable = variable.replaceAll('@', '');
    variable = variable.replaceAll('#', '');
    variable = variable.replaceAll('\$', '');
    variable = variable.replaceAll('%', '');
    variable = variable.replaceAll('^', '');
    variable = variable.replaceAll('&', '');
    variable = variable.replaceAll('*', '');
    variable = variable.replaceAll('!', '');
    variable = variable.replaceAll('=', '');
    variable = variable.replaceAll('_', '-');
    variable = variable.replaceAll('?', '');
    variable = variable.replaceAll('/', '');
    variable = variable.replaceAll('¡', '');
    variable = variable.replaceAll('`', '');
    variable = variable.replaceAll('^', '');
    variable = variable.replaceAll('´', '');
    variable = variable.replaceAll('¨', '');
    variable = variable.replaceAll('¿', '');
    variable = variable.replaceAll('•', '');

    return variable;
  }

  String formatDate(DateTime date) {
    String _date = date.toString();
    var date2 = _date.split(" ");
    var date3 = date2[0];
    var date4 = date3.split("-");

    var armadoFecha = date4[2] + "/" + date4[1] + "/" + date4[0];
    return armadoFecha;
  }

  String onlyDate(DateTime date) {
    String _date = date.toString();
    var date2 = _date.split(" ");
    var date3 = date2[0];

    String armadoFecha = date3.trim();
    return armadoFecha;
  }

  String onlyMonth(DateTime date) {
    String _date = onlyDate(date);
    var date2 = _date.split("-");
    var date3 = date2[1];

    String armadoFecha = date3.trim();
    return armadoFecha;
  }

  String onlyYearMonth(DateTime date) {
    String _date = onlyDate(date);
    var date2 = _date.split("-");
    var date3 = date2[0] + "-" + date2[1];

    String armadoFecha = date3.trim();
    return armadoFecha;
  }

  String getCurrentMonth() {
    return onlyYearMonth(DateTime.now());
  }

  String getCurrentWeek() {
    DateTime date = DateTime.now();
    int weekStart = date.weekday - 1;
    DateTime weekStartDate = date.add(Duration(days: -weekStart));
    String _weekStartStr = Utils().onlyDate(weekStartDate);

    return _weekStartStr;
  }

  String onlyDateFromApiDate(String date) {
    String _date = date.toString();
    var date2 = _date.split("T");
    var date3 = date2[0];

    String armadoFecha = date3.trim();
    return armadoFecha;
  }

  String onlyHours(DateTime date) {
    String _date = date.toString();
    var date2 = _date.split(" ");
    var date3 = date2[1].split(":");
    var date4 = date3[0] + ":" + date3[1];

    String armadoFecha = date4.trim();
    return armadoFecha;
  }

  String findExtension(String fileName) {
    var _p = fileName.split('.');
    var _c = _p.length;
    var _g = _p[_c - 1];
    var _t = _g.replaceAll(new RegExp("'"), "");
    _t = _t.replaceAll(new RegExp('"'), '');
    return _t.trim();
  }

  Map<String, double> getMapSize(BuildContext context) {
    final width = Responsive.of(context).width;

    double paddingExterior = 8;
    double paddingInterior = 10;
    double paddingInteriorHorizontal = 20;

    double sizeBarWidth =
        (width / 2) - (paddingExterior * 2) - (paddingInterior);

    Map<String, double> mapSize = new HashMap();

    mapSize['paddingExterior'] = paddingExterior;
    mapSize['paddingInterior'] = paddingInterior;
    mapSize['paddingInteriorHorizontal'] = paddingInteriorHorizontal;
    mapSize['sizeBarWidth'] = sizeBarWidth;
    mapSize['sizeBarHeight'] = 12;
    mapSize['sizePanelHeight'] = 60;

    mapSize['sizePanelWidth'] = width;
    mapSize['sizePanelBottomHeight'] = 40;
    mapSize['borderRadius'] = 16;
    mapSize['sizeTextHeader'] = Responsive.of(context).percent(1.3);
    mapSize['sizeTextTopHeader'] = Responsive.of(context).percent(1.6);
    mapSize['sizePointsImageHeader'] = Responsive.of(context).percent(2.5);

    mapSize['sizePointsTextHeader'] = Responsive.of(context).percent(1.4);

    mapSize['sizeTextTeam'] = Responsive.of(context).percent(1.8);

    mapSize['sizeIconChat'] = Responsive.of(context).percent(1.5);

    return mapSize;
  }

  DateTime getDateTimeFromTimeStramp(
      int timeStamp, int addMinutes, bool finalizado) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    int _minutes = 0;

    if (finalizado) {
      if (addMinutes == 90) {
        _minutes = 105;
      } else if (addMinutes == 120) {
        _minutes = 150;
      }
    }

    DateTime dateWithElapsedMinutes = date.add(new Duration(minutes: _minutes));
    return dateWithElapsedMinutes;
  }

  String dateName(fecha) {
    var diaSemana = fecha.weekday;
    var mes = fecha.month;
    var dia = fecha.day;
    var ano = fecha.year;

    var nombreMes = "";
    var nombreDia = "";

    switch (diaSemana) {
      case 1:
        nombreDia = "Lunes";
        break;
      case 2:
        nombreDia = "Martes";
        break;
      case 3:
        nombreDia = "Miércoles";
        break;
      case 4:
        nombreDia = "Jueves";
        break;
      case 5:
        nombreDia = "Viernes";
        break;
      case 6:
        nombreDia = "Sábado";
        break;
      case 7:
        nombreDia = "Domingo";
        break;
    }
    switch (mes) {
      case 1:
        nombreMes = "Enero";
        break;
      case 2:
        nombreMes = "Febrero";
        break;
      case 3:
        nombreMes = "Marzo";
        break;
      case 4:
        nombreMes = "Abril";
        break;
      case 5:
        nombreMes = "Mayo";
        break;
      case 6:
        nombreMes = "Junio";
        break;
      case 7:
        nombreMes = "Julio";
        break;
      case 8:
        nombreMes = "Agosto";
        break;
      case 9:
        nombreMes = "Septiembre";
        break;
      case 10:
        nombreMes = "Octubre";
        break;
      case 11:
        nombreMes = "Noviembre";
        break;
      case 12:
        nombreMes = "Diciembre";
        break;
    }
    return nombreDia +
        " " +
        dia.toString() +
        " de " +
        nombreMes +
        " del " +
        ano.toString();
  }

  String getHourOfDate(hora) {
    var horanueva = hora.toString();
    var nueva = horanueva.split(" ");
    var nueva2 = nueva[1].split(":");
    var nueva3 = nueva2[0] + ":" + nueva2[1];
    return nueva3.toString();
  }

  String getDateHourName(fecha) {
    try {
      var _fecha = dateName(fecha);
      var _hora = getHourOfDate(fecha);

      return _fecha + " a las " + _hora;
    } catch (e) {
      return '';
    }
  }

  String getStringFromDouble(value) {
    String _value = value.toString();
    String _v = _value.replaceAll('.0', '');
    return _v;
  }

  Color getColorPercent(double percent) {
    Color color = Color(0xff18FFFF);

    if (percent > 25) {
      color = Colors.yellowAccent;
    }
    if (percent > 50) {
      color = Colors.orangeAccent;
    }
    if (percent > 75) {
      color = Colors.pinkAccent[200];
    }

    return color;
  }
}
