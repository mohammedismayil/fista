import 'package:flutter/material.dart';

class AppTheme {
  var white = HexColor("#ffffff");
  var lightGray = HexColor("#f3f5f5");

  var themeYellow = HexColor("#fea010");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
