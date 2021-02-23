import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../utils/utils.dart';
import '../../widgets/header_widget_left.dart';
import 'records_controller.dart';
import 'widgets/record_card.dart';

class RecordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double paddingExterior = 8;

    var mapSize = Utils().getMapSize(context);

    return GetBuilder<RecordsController>(
      init: RecordsController(),
      builder: (_controller) {
        return Padding(
          padding: EdgeInsets.all(paddingExterior),
          child: Container(
            width: size.width,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(paddingExterior),
                  child: HeaderLeftWidget(
                    mapSize: mapSize,
                    text: "Record Semana",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingExterior),
                  child: RecordCard(
                    type: 'week',
                    mapSize: mapSize,
                    records: _controller.getForecastResults('week'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingExterior),
                  child: HeaderLeftWidget(
                    mapSize: mapSize,
                    text: "Record Mes",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingExterior),
                  child: RecordCard(
                    type: 'month',
                    mapSize: mapSize,
                    records: _controller.getForecastResults('month'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingExterior),
                  child: HeaderLeftWidget(
                    mapSize: mapSize,
                    text: "Record Histórico",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingExterior),
                  child: RecordCard(
                    type: 'history',
                    mapSize: mapSize,
                    records: _controller.getForecastResults('history'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
