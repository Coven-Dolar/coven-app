import 'dart:async';

import 'package:coven/uitls/app_colors.dart';
import 'package:coven/uitls/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HeaderScreen extends StatefulWidget {
  final String market;

  const HeaderScreen({Key? key, required this.market}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HeaderScreen();
  }
}

class _HeaderScreen extends State<HeaderScreen> {
  String _timeString = '';

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MMM d, y hh:mm:ss a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 85,
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.blue,
                  Color.fromRGBO(46, 57, 136, 1),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(6, 0.6),
              )),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        "assets/images/logo.png",
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Text(
                          widget.market,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: AppFonts.fontTitle,
                              fontSize: 16,
                              color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Color.fromRGBO(97, 117, 124, 1),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    "Cotización de mercados",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontFamily: AppFonts.fontSubTitle),
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  _timeString,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white, fontFamily: AppFonts.fontSubTitle),
                ),
              )
            ],
          ),
        )
      ],
    );
  }



}
