import 'package:coven/News/model_news.dart';
import 'package:coven/News/ui/screen/detail_news.dart';
import 'package:coven/News/ui/widgets/title_section.dart';
import 'package:coven/uitls/app_fonts.dart';
import 'package:flutter/material.dart';

class CarouselNews extends StatefulWidget {
  final List<ModelNews> children;

  const CarouselNews({Key? key, required this.children})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselNews();
  }
}

class _CarouselNews extends State<CarouselNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.children.take(4).map((ModelNews news) => _news(news)).toList(),
      ),
    );
  }

  Widget _news(ModelNews news) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailNews(news: news)),
        )
      },
      child: Container(
        width: 280,
        margin: EdgeInsets.only(top: 30, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(news.fotoPrincipal),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  color: Colors.black54),
              child: Text(
                news.titulo,
                style: TextStyle(
                    color: Colors.white, fontFamily: AppFonts.fontTitle, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
