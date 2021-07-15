import 'package:coven_native/News/bloc/bloc_news.dart';
import 'package:coven_native/News/ui/widgets/carousel_news.dart';
import 'package:coven_native/News/ui/widgets/menu_news_category.dart';
import 'package:coven_native/News/ui/widgets/news_list.dart';
import 'package:coven_native/News/ui/widgets/title_section.dart';
import 'package:coven_native/ui/widgets/backgroud.dart';
import 'package:coven_native/ui/widgets/bottom_navigation.dart';
import 'package:coven_native/ui/widgets/jloading_screen.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:coven_native/uitls/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../model_news.dart';

class NewsListScreen extends StatefulWidget {
  final String categoryName;
  final String categoryUrl;

  const NewsListScreen(
      {Key? key, this.categoryName = '', this.categoryUrl = ''})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewsListScreen();
  }
}

class _NewsListScreen extends State<NewsListScreen> {
  BlocNews blocNews = BlocNews();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blue,
          title: Text(
            (widget.categoryName.length > 0)
                ? 'NOTÍCIAS DE ' + widget.categoryName.toUpperCase()
                : 'NOTÍCIAS GENERALES',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontFamily: AppFonts.fontTitle),
          ),
          leading: (widget.categoryName.length > 0)
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsListScreen()),
                    );
                  },
                )
              : null),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TitleSection(title: 'Recientes'),
                  FutureBuilder(
                      future: (widget.categoryUrl.length == 0)
                          ? blocNews.getAllNews()
                          : blocNews.getNewsForCategory(widget.categoryUrl),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.data != null) {
                          List<ModelNews> newsList =
                              snapshot.data as List<ModelNews>;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselNews(children: newsList),
                              TitleSection(
                                title: 'Listado de notícias',
                                top: 30,
                              ),
                              NewsList(
                                children: newsList,
                                skipe: 4,
                              )
                            ],
                          );
                        }

                        return JLoadingScreen();
                      })
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        index: 2,
      ),
      endDrawer: MenuNewsCategories(),
    );
  }
}
