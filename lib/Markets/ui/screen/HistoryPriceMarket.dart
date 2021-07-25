import 'package:coven_native/News/ui/widgets/charts.dart';
import 'package:coven_native/ui/widgets/backgroud.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class HistoryPriceMarket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryPriceMarket();
  }

}

class _HistoryPriceMarket extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.blue,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: Stack(
          children: [
            Background(),
            Charts()
          ],
        )
    );
  }

}