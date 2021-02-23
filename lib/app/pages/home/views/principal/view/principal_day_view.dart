import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../../../../data/models/fixture/fixture.dart';
import '../../../../../data/models/league/league.dart';
import '../principal_controller.dart';
import '../widgets/fixture_card.dart';
import '../widgets/fixture_data_not_found.dart';
import '../widgets/fixture_header.dart';
import '../widgets/league_header.dart';

class PrincipalDayView extends StatelessWidget {
  final String day;

  const PrincipalDayView({Key key, @required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PrincipalController>(builder: (_controller) {
      List<Map<dynamic, dynamic>> listMap =
          _controller.getOrderFixturesFromDay(day);

      if (listMap != null)
        return ListView.builder(
            itemCount: listMap.length,
            itemBuilder: (BuildContext context, int index) {
              Map _map = listMap[index];
              if (_map['tipo'] == 'HEADER') {
                String text = _map['child'];
                return FixtureHeader(text: text);
              }
              if (_map['tipo'] == 'LEAGUE') {
                League _l = _map['child'];
                return LeagueHeader(league: _l);
              }
              if (_map['tipo'] == 'FIXTURE') {
                Fixture _f = _map['child'];
                return FixtureCard(
                  fixture: _f,
                  isForecastDone: _controller.isForecastDone(_f.fixture_id),
                  forecast: _controller.getForecast(_f.fixture_id),
                  percents: _controller.getPercents(_f.fixture_id),
                );
                // return FixtureCardOld(fixture: _f);
              }
              return Container();
            });
      else
        return FixtureDataNotFound();
    });
  }
}
