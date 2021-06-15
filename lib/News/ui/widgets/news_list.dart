import 'package:coven/News/ui/screen/detail_news.dart';
import 'package:coven/uitls/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:intl/intl.dart';
import '../../model_news.dart';

class NewsList extends StatefulWidget {
  final List<ModelNews> children;
  final int skipe;

  const NewsList({Key? key, required this.children, this.skipe = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewsList();
  }
}

class _NewsList extends State<NewsList> {
  var inputFormat = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return SpGrid(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20),
        children: widget.children
            .skip(widget.skipe)
            .map((ModelNews news) => _news(news))
            .toList());
  }

  SpGridItem _news(ModelNews news) {
    return SpGridItem(
      xs: 6,
      sm: 6,
      md: 6,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailNews(news: news)),
          )
        },
        child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(news.fotoMiniatura),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            news.titulo.substring(0, 40) + '...',
                            style: TextStyle(
                                fontFamily: AppFonts.fontSubTitle,
                                fontSize: 11),
                          ),
                          text(news.categoria),
                          text(formatDate(news.fechaCreacion))
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget text(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.black54,
          fontFamily: AppFonts.font,
          fontSize: 11,
          fontStyle: FontStyle.italic),
    );
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
