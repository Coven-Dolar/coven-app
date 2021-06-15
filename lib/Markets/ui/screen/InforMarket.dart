import 'package:coven_native/Markets/bloc/bloc_market.dart';
import 'package:coven_native/Markets/ui/widgets/header_screen.dart';
import 'package:coven_native/Markets/ui/widgets/show_info_markets.dart';
import 'package:coven_native/Markets/ui/widgets/show_market_legends.dart';
import 'package:coven_native/News/bloc/bloc_news.dart';
import 'package:coven_native/News/model_news.dart';
import 'package:coven_native/News/ui/widgets/carousel_news.dart';
import 'package:coven_native/ui/widgets/backgroud.dart';
import 'package:coven_native/ui/widgets/bottom_navigation.dart';
import 'package:coven_native/ui/widgets/jloading_screen.dart';
import 'package:flutter/material.dart';

import '../../model_market.dart';

class InfoMarket extends StatefulWidget {
  final String marketType;

  const InfoMarket({Key? key, required this.marketType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InfoMarket();
  }
}

class _InfoMarket extends State<InfoMarket> {
  BlocMarket blocMarket = BlocMarket();
  BlocNews blocNews = BlocNews();

  List<ModelMarket> dataList = [];
  List<ModelNews> listNews = [];

  void processSearch() async {
    setState(() {
      dataList = [];
    });

    List<ModelMarket> newDataList =
        await blocMarket.searchDataAllMarket(widget.marketType);

    setState(() {
      dataList = newDataList;
    });
  }

  void searchNews() async {
    List<ModelNews> news = await blocNews.getAllNews();
    setState(() {
      listNews = news;
    });
  }

  @override
  void initState() {
    super.initState();
    searchNews();
    processSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Background(),
            HeaderScreen(
              market: (widget.marketType == 'I')
                  ? 'Mercados Internacionales'
                  : 'Mercados Nacionales',
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 121),
                child: _showInfoMarket(),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          index: (widget.marketType == 'I') ? 0 : 1,
        ));
  }

  Widget _showInfoMarket() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (this.dataList.length == 0)
            ? JLoadingScreen()
            : ShowInfoMarkets(
                dataMarket: dataList, onTab: () => this.processSearch()),
        ShowMarketLegends(
          marketType: widget.marketType,
        ),
        CarouselNews(children: listNews)
      ],
    );
  }
}
