import 'package:coven_native/News/bloc/bloc_news.dart';
import 'package:coven_native/News/model_category.dart';
import 'package:coven_native/News/ui/screen/news_list_screen.dart';
import 'package:coven_native/ui/widgets/jloading_screen.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:coven_native/uitls/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MenuNewsCategories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuNewsCategories();
  }
}

class _MenuNewsCategories extends State<MenuNewsCategories> {
  BlocNews blocNews = BlocNews();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            AppColors.blue,
            Color.fromRGBO(46, 57, 136, 1),
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(6, 0.6),
        )),
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/images/logo.png', width: 250),
              ),
            ),
            Padding(
                child: Text(
                  'Listado de Categorías',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: AppFonts.fontTitle,
                      fontSize: 16,
                      color: Colors.white),
                ),
                padding: EdgeInsets.only(top: 30)),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                'Listar notícias de la categoría seleccionada.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontFamily: AppFonts.fontSubTitle),
              ),
            ),
            FutureBuilder(
                future: blocNews.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return categoryList(snapshot.data as List<ModelCategory>);
                  }

                  return JLoadingScreen();
                })
          ],
        ),
      ),
    );
  }

  Widget categoryList(List<ModelCategory> categoryList) {
    categoryList.add(ModelCategory(
        categoria: 'Todas las categorías', url: '', totalArticulos: 0));
    return Column(
      children: categoryList
          .map((ModelCategory category) => _category(category))
          .toList(),
    );
  }

  Widget _category(ModelCategory category) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsListScreen(
                        categoryName: category.categoria,
                        categoryUrl: category.url,
                      )));
        },
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.check,
                        size: 24,
                        color: Colors.white,
                      )),
                  Expanded(
                    flex: 4,
                    child: Text(
                      category.categoria,
                      style: TextStyle(
                          fontFamily: AppFonts.fontSubTitle,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ])));
  }
}
