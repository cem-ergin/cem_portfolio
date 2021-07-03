import 'package:cem_portfolio/helper/size_helper.dart';
import 'package:cem_portfolio/providers/navbar_provider.dart';
import 'package:cem_portfolio/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SizeHelper _sizeHelper = SizeHelper();

class MyStyles {
  final BuildContext context;
  MyStyles(this.context);
  TextStyle get navbarInactiveStyle => TextStyle(
        color: Provider.of<ThemeProvider>(context, listen: false).primaryColor(
            Provider.of<NavbarProvider>(context, listen: false).navbarIndex),
        fontSize: _sizeHelper.size.width * 0.03,
      );
  TextStyle get navbarActiveStyle => TextStyle(
        color: Colors.white,
        fontSize: _sizeHelper.size.width * 0.03,
      );

  TextStyle get aboutDescription => TextStyle(
        // color: Provider.of<ThemeProvider>(context, listen: false).accentColor(
        //     Provider.of<NavbarProvider>(context, listen: false).navbarIndex),
        color: Colors.black,
        // fontSize: Theme.of(context).textTheme.headline6.fontSize,
      );
  TextStyle get aboutTitle => TextStyle(
        // color: Colors.black,
        color: Provider.of<ThemeProvider>(context, listen: false).accentColor(
            Provider.of<NavbarProvider>(context, listen: false).navbarIndex),

        fontSize: Theme.of(context).textTheme.headline4?.fontSize,
      );
  TextStyle get aboutHeader => TextStyle(
        // color: Provider.of<ThemeProvider>(context, listen: false).accentColor(
        //     Provider.of<NavbarProvider>(context, listen: false).navbarIndex),
        color: Colors.black,
        fontSize: Theme.of(context).textTheme.headline6?.fontSize,
      );
}
