import 'package:flutter/material.dart';

class NavbarProvider with ChangeNotifier {
  int _navbarIndex = 2;
  int get navbarIndex => _navbarIndex;
  set navbarIndex(int navbarIndex) {
    _navbarIndex = _navbarIndex == navbarIndex ? 0 : navbarIndex;
    notifyListeners();
  }

  bool _showNavbar = true;
  bool get showNavbar => _showNavbar;
  set showNavbar(bool showNavbar) {
    _showNavbar = showNavbar;
    notifyListeners();
  }
}
