import 'package:coven_native/Markets/models/model_history_price_market.dart';
import 'package:coven_native/ui/widgets/jloading_screen.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../respository_market.dart';

class Charts extends StatefulWidget {
  final String marketName;
  final String marketType;

  const Charts({Key? key, required this.marketName, required this.marketType});

  @override
  State<StatefulWidget> createState() {
    return _Charts();
  }
}

class _Charts extends State<Charts> {
  RepositoryMarket repository = RepositoryMarket();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
            child: FutureBuilder(
                future: repository.searchHistoryPricesMarket(
                    widget.marketName, widget.marketType, '45'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {

                    return charts.TimeSeriesChart(
                      _createSampleData(
                          snapshot.data as List<ModelHistoryPriceMarket>),
                      animationDuration: Duration(milliseconds: 300),
                      dateTimeFactory: const charts.LocalDateTimeFactory(),
                      animate: true,
                    );

                  }

                  return JLoadingScreen();
                }),
          ),
        ],
      ),
    );
  }

  static List<charts.Series<TimeHistoryPrice, DateTime>> _createSampleData(
      List<ModelHistoryPriceMarket> listHistory) {
    List<TimeHistoryPrice> data = [];

    listHistory.forEach((value) {
      data.add(new TimeHistoryPrice(DateTime.parse(value.date), value.value));
    });

    return [
      new charts.Series<TimeHistoryPrice, DateTime>(
        id: 'History',
        domainFn: (TimeHistoryPrice historyPrice, _) => historyPrice.time,
        measureFn: (TimeHistoryPrice historyPrice, _) => historyPrice.sales,
        areaColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        dashPatternFn: (_, __) => [8, 3, 2, 3],
        data: data,
      )
    ];
  }
}

class TimeHistoryPrice {
  final DateTime time;
  final double sales;

  TimeHistoryPrice(this.time, this.sales);
}
