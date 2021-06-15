import 'package:coven/uitls/app_fonts.dart';
import 'package:flutter/material.dart';

class JLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Cargando los datos",
              style: TextStyle(
                fontFamily: AppFonts.fontTitle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
