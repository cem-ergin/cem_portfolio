import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  List<Color> get _primaryColors => [
        Color(0xff0d1137),
        Color(0xffecc19c),
        Color(0xffe7e8d1),
      ];
  List<Color> get _accentColors => [
        Color(0xffe52165),
        Color(0xff1e847f),
        Color(0xffb85042),
      ];

  Color primaryColor(int index) {
    return _primaryColors[index];
  }

  Color accentColor(int index) {
    return _accentColors[index];
  }
}
