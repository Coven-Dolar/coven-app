import 'package:coven_native/Markets/models/model_history_price_market.dart';
import 'package:coven_native/ui/widgets/jloading_screen.dart';
import 'package:coven_native/uitls/app_fonts.dart';
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
  String day = "45";
  final List<CheckBoxModel> itens = [
    CheckBoxModel(texto: "7"),
    CheckBoxModel(texto: "15"),
    CheckBoxModel(texto: "45", checked: true),
    CheckBoxModel(texto: "180")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Filtros",
                    style: TextStyle(fontFamily: AppFonts.fontTitle),
                  ),
                ),
                Row(
                  children: [
                    for (var element in itens)
                      Row(
                        children: [
                          Checkbox(
                            onChanged: (value) {
                              setState(() {
                                itens.forEach((element) {
                                  element.checked = false;
                                });
                                element.checked = value!;
                                day = element.texto;
                              });
                            },
                            value: element.checked,
                          ),
                          Text(
                            element.texto + " Días",
                          ),
                        ],
                      )
                  ],
                )
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: 80),
            child: SizedBox(
              height: 230,
              child: FutureBuilder(
                  future: repository.searchHistoryPricesMarket(
                      widget.marketName, widget.marketType, day),
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
            ))
      ],
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
        // dashPatternFn: (_, __) => [8, 3, 2, 3],
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

class CheckBoxModel {
  CheckBoxModel({required this.texto, this.checked = false});

  String texto;
  bool checked;
}
