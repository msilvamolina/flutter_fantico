import 'package:flutter/material.dart';

import '../../../../../data/models/records/records.dart';
import '../../../../../utils/app_colors.dart';
import 'record_title.dart';

class RecordCard extends StatelessWidget {
  final Map<String, double> mapSize;
  final String type;
  final Records records;

  const RecordCard({
    Key key,
    @required this.mapSize,
    @required this.type,
    @required this.records,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingHorizontal = mapSize['paddingInteriorHorizontal'] / 2;
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
        vertical: mapSize['paddingInterior'], horizontal: paddingHorizontal);

    String porcentajeDeAcierto =
        (records.porcentajeDeAcierto ?? 0).toStringAsPrecision(2);

    porcentajeDeAcierto =
        porcentajeDeAcierto == '0.0' ? '0' : porcentajeDeAcierto;
    return Container(
      padding: EdgeInsets.all(paddingHorizontal),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(mapSize['borderRadius']),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.cyan[600],
              borderRadius: BorderRadius.all(
                Radius.circular(mapSize['borderRadius']),
              ),
            ),
            padding: padding,
            child: RecordTitle(
              title: 'Racha actual',
              points: records.racha.toString(),
              paddingBottom: 0,
            ),
          ),
          Container(
            padding: padding,
            child: Column(
              children: [
                RecordTitle(
                  title: 'Pronósticos de resultado',
                  points: records.cantidadTotal.toString(),
                ),
                // RecordTitle(
                //   title: 'Pronósticos de marcador',
                //   points: records.pronosticosDeResultados.toString(),
                // ),
                RecordTitle(
                  title: 'Acertados',
                  points: records.acertados.toString(),
                ),
                RecordTitle(
                  title: 'Fallados',
                  points: records.fallados.toString(),
                ),
                RecordTitle(
                  title: 'Anulados',
                  points: records.anulados.toString(),
                ),
                RecordTitle(
                  title: 'Porcentaje de acierto',
                  points: porcentajeDeAcierto + "%",
                ),
                SizedBox(height: 20),
                RecordTitle(
                  title: 'Racha positiva más larga',
                  points: records.rachaPositivaMasLarga.toString(),
                ),
                RecordTitle(
                  title: 'Racha negativa más larga',
                  points: records.rachaNegativaMasLarga.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
