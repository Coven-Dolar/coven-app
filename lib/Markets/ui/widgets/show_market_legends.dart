import 'package:coven_native/Markets/bloc/bloc_market.dart';
import 'package:coven_native/Markets/model_legends.dart';
import 'package:coven_native/ui/widgets/jloading_screen.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:coven_native/uitls/app_fonts.dart';
import 'package:flutter/material.dart';

class ShowMarketLegends extends StatefulWidget {
  final String marketType;

  const ShowMarketLegends({Key? key, required this.marketType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShowMarketLegends();
  }
}

class _ShowMarketLegends extends State<ShowMarketLegends> {
  BlocMarket blocMarket = new BlocMarket();
  List<ModelLegends> listLegends = [];

  void searchLegends() async {
    List<ModelLegends> list =
        await blocMarket.searchMarketLegends(widget.marketType);

    setState(() {
      listLegends = list;
    });
  }

  @override
  void initState() {
    super.initState();
    searchLegends();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listLegends.map((e) => _showLegend(e)).toList(),
      ),
    );
  }

  Widget _showLegend(ModelLegends legend) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                legend.nomenclatura + ':',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: AppFonts.fontSubTitle,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blue),
              ),
            )),
        Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                legend.descripcion,
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: AppFonts.fontSubTitle,
                    color: AppColors.blue),
              ),
            )),
      ],
    );
  }
}
