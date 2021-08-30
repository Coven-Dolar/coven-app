import 'package:coven_native/Markets/ui/screen/InforMarket.dart';
import 'package:coven_native/News/ui/screen/news_list_screen.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int index;

  BottomNavigation({Key? key, this.index: 1}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigation();
  }
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index != _selectedIndex) {
        _selectedIndex = index;
        switch (index) {
          case 0:
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => InfoMarket(marketType: 'I')));
            break;
          case 1:
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => InfoMarket(marketType: 'N')));
            break;
          case 2:
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NewsListScreen()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.index;

    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Internacional',
              backgroundColor: AppColors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              label: 'Nacional',
              backgroundColor: AppColors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.mark_chat_read_outlined),
              label: 'Notícias',
              backgroundColor: AppColors.blue),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        elevation: 5);
  }
}
