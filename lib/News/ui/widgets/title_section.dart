import 'package:coven_native/uitls/app_colors.dart';
import 'package:coven_native/uitls/app_fonts.dart';
import 'package:flutter/cupertino.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final double top;

  const TitleSection({Key? key, required this.title, this.top = 0}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: top),
            height: 20.0,
            width: 2,
            decoration: BoxDecoration(color: AppColors.blue)),
        Padding(
            padding: EdgeInsets.only(right: 6, top: top),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: AppFonts.fontTitle,
                  fontSize: 18,
                  color: AppColors.gray),
            ))
      ],
    );
  }

}