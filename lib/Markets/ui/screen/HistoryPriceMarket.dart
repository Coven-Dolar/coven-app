import 'package:coven_native/Markets/ui/screen/Charts.dart';
import 'package:coven_native/ui/widgets/backgroud.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class HistoryPriceMarket extends StatefulWidget {
  final String marketName;
  final String marketType;

  const HistoryPriceMarket({Key? key, required this.marketName, required this.marketType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HistoryPriceMarket();
  }

}

class _HistoryPriceMarket extends State<HistoryPriceMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.marketName),
            centerTitle: true,
            backgroundColor: AppColors.blue,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: Stack(
          children: [
            Background(),
            Charts(marketType: widget.marketType, marketName: widget.marketName,)
          ],
        )
    );
  }

}