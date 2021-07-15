import 'package:coven_native/uitls/app_colors.dart';
import 'package:coven_native/uitls/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../model_market.dart';

class ShowInfoMarkets extends StatefulWidget {
  final List<ModelMarket> dataMarket;
  final VoidCallback onTab;

  const ShowInfoMarkets(
      {Key? key, required this.dataMarket, required this.onTab})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShowInfoMarkets();
  }
}

class _ShowInfoMarkets extends State<ShowInfoMarkets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.blue,
          child: Table(
            columnWidths: {
              0: FractionColumnWidth(0.04),
              1: FractionColumnWidth(0.34),
              2: FractionColumnWidth(0.34),
              3: FractionColumnWidth(0.17),
              4: FractionColumnWidth(0.12),
            },
            children: [
              TableRow(children: [
                TableCell(
                    child: Container(
                  margin: EdgeInsets.only(top: 6, bottom: 4),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontFamily: AppFonts.fontTitle,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )),
                TableCell(
                    child: Container(
                  margin: EdgeInsets.only(top: 6, bottom: 4),
                  child: Text(
                    "Mercados",
                    style: TextStyle(
                      fontFamily: AppFonts.fontTitle,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )),
                TableCell(
                    child: Container(
                  margin: EdgeInsets.only(top: 6, bottom: 4),
                  child: Text(
                    "Cotización",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.fontTitle,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )),
                TableCell(
                    child: Container(
                  margin: EdgeInsets.only(top: 6, bottom: 4),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontFamily: AppFonts.fontTitle,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )),
                TableCell(
                    child: Container(
                      margin: EdgeInsets.only(top: 6, bottom: 4),
                  child: GestureDetector(
                    onTap: widget.onTab,
                    child: Icon(
                      Icons.refresh_outlined,
                      color: Colors.white,
                    ),
                  ),
                ))
              ]),
            ],
          ),
        ),
        Table(columnWidths: {
          0: FractionColumnWidth(0.04),
          1: FractionColumnWidth(0.302),
          2: FractionColumnWidth(0.34),
          3: FractionColumnWidth(0.17),
          4: FractionColumnWidth(0.11),
        }, children: [
          ...widget.dataMarket.map((market) => _infoMarket(market))
        ])
      ],
    );
  }

  TableRow _infoMarket(ModelMarket market) {
    return TableRow(children: [
      TableCell(
          child: Padding(
        padding: EdgeInsets.all(6),
        child: Icon(
          Icons.bar_chart,
          size: 12,
          color: AppColors.blue,
        ),
      )),
      TableCell(
          child: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          market.nombre,
          style: TextStyle(
              fontFamily: AppFonts.fontTitle,
              fontSize: 11,
              color: AppColors.gayDark),
        ),
      )),
      TableCell(
          child: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          market.precio,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontFamily: AppFonts.fontQuantities, color: AppColors.gayDark),
        ),
      )),
      TableCell(
          child: Padding(
        padding: EdgeInsets.all(6),
        child: Text(
          market.par,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: AppFonts.fontQuantities,
              fontSize: 9,
              color: AppColors.gayDark),
        ),
      )),
      TableCell(
          child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          color:
              (double.parse(market.movilidad) < 0) ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Text(
          market.movilidad,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: AppFonts.fontSubTitle,
              fontSize: 10,
              color: Colors.white),
        ),
      ))
    ]);
  }
}
