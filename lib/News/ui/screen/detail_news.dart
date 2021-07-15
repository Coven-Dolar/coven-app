import 'package:coven_native/News/bloc/bloc_news.dart';
import 'package:coven_native/News/model_news.dart';
import 'package:coven_native/News/ui/widgets/menu_news_category.dart';
import 'package:coven_native/ui/widgets/backgroud.dart';
import 'package:coven_native/ui/widgets/bottom_navigation.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:coven_native/uitls/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'news_list_screen.dart';

class DetailNews extends StatefulWidget {
  final ModelNews news;

  const DetailNews({Key? key, required this.news}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailNews();
  }
}

class _DetailNews extends State<DetailNews> {
  BlocNews blocNews = BlocNews();

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
        children: [Background(), _showNews(widget.news)],
      ),
      bottomNavigationBar: BottomNavigation(),
      endDrawer: MenuNewsCategories(),
    );
  }

  Widget _showNews(ModelNews news) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.titulo,
              textAlign: TextAlign.justify,
              style: TextStyle(fontFamily: AppFonts.fontTitle, fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(news.fotoPrincipal),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child:
                  text(formatDate(news.fechaCreacion) + ' - ' + news.categoria),
            ),
            Text(
                removeAllHtmlTags(news.descripcion),
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Widget text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black54,
          fontFamily: AppFonts.font,
          fontSize: 11,
          fontStyle: FontStyle.italic),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    return htmlText.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  static String formatDate(String dateToFormat) {
    try {
      if (dateToFormat.endsWith("Y")) {
        return dateToFormat.split("Y")[0];
      }
      final date = DateTime.parse(dateToFormat);
      return "${completeNumber(date.day)}/${completeNumber(date.month)}/${date.year}";
    } catch (e) {
      return dateToFormat;
    }
  }

  static String completeNumber(numberToComplete) {
    return numberToComplete < 10 ? "0$numberToComplete" : "$numberToComplete";
  }
}
