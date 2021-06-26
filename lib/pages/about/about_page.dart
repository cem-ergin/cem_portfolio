import 'dart:io';

import 'package:cem_portfolio/helper/size_helper.dart';
import 'package:cem_portfolio/providers/navbar_provider.dart';
import 'package:cem_portfolio/providers/theme_provider.dart';
import 'package:cem_portfolio/styles/styles.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

SizeHelper _sizeHelper = SizeHelper();

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    final _navbarProvider = Provider.of<NavbarProvider>(context, listen: false);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _navbarProvider.showNavbar =
          _scrollController.position.userScrollDirection ==
              ScrollDirection.forward;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _navbarProvider = Provider.of<NavbarProvider>(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return ListView(
      controller: _scrollController,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: _sizeHelper.size.width * 0.125,
      ),
      children: [
        SizedBox(
          height: _sizeHelper.size.height * 0.02,
        ),
        Text(
          "About Me",
          style: MyStyles(context).aboutTitle,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        Text(
          "I am Cem Ergin. Mobile Application Developer from Izmir, Turkey",
          style: MyStyles(context).aboutHeader,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        Text(
          "I graduated from Kocaeli University Computer Engineering in 2019.\nI have more than 1.5 years of Mobile Application Development experience. I specialized in Flutter. I have developed more than 10 applications with both Flutter and native languages such as Swift and Kotlin. I’ve worked with Flutter in many different fields such as E-commerce, online food and service order, text & object recognition, reservation etc.\nI am hungry to learn, to explore.",
          style: MyStyles(context).aboutDescription,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.02,
        ),
        Text(
          "Experience",
          style: MyStyles(context).aboutTitle,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        Text(
          "WittyCommerce, 2021 April - Present",
          style: MyStyles(context).aboutHeader,
        ),
        Text(
          "I started to work on WittyCommerce as Mobile Application Developer. I am currenty working on e-commerce mobile applications with Flutter.",
          style: MyStyles(context).aboutDescription,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        Text(
          "Eralp Software, 2020 January - 2021 April",
          style: MyStyles(context).aboutHeader,
        ),
        Text(
          "I started to work on Eralp Software as Mobile Application Developer. I developed 6-7 Flutter projects while i working for Eralp Software. I worked as a project manager in some of these projects. At the same time i write rest api with express.js and node.js technologies. I re-changed, fixed some of api’s  according to the data i want to receive on mobile.",
          style: MyStyles(context).aboutDescription,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        Text(
          "Windport(Freelance), 2019 August - 2019 October",
          style: MyStyles(context).aboutHeader,
        ),
        Text(
          "I developed a mobile push-to-talk application that can be used by taxi and minibus drivers on Android and iOS platforms.",
          style: MyStyles(context).aboutDescription,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.02,
        ),
        Text(
          "Skills",
          style: MyStyles(context).aboutTitle,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        Text(
          "Flutter, Dart, Java(Android), Swift(IOS), SwiftUI, Python, Adobe XD, Adobe After Effects, Node.js, Express.js, Javascript",
          style: MyStyles(context).aboutDescription,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.02,
        ),
        Text(
          "Contact",
          style: MyStyles(context).aboutTitle,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        Wrap(
          // alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "You can contact me from ",
              style: MyStyles(context).aboutDescription,
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  _themeProvider
                      .accentColor(_navbarProvider.navbarIndex)
                      .withOpacity(.3),
                ),
              ),
              child: Text(
                "Linkedin",
                style: TextStyle(
                  color:
                      _themeProvider.accentColor(_navbarProvider.navbarIndex),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                if (await canLaunch("https://www.linkedin.com/in/cem-ergin/")) {
                  await launch("https://www.linkedin.com/in/cem-ergin/");
                } else {
                  throw 'Could not launch linkedin';
                }
              },
            ),
            Text(
              " or ",
              style: MyStyles(context).aboutDescription,
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  _themeProvider
                      .accentColor(_navbarProvider.navbarIndex)
                      .withOpacity(.3),
                ),
              ),
              child: Text(
                "E-mail",
                style: TextStyle(
                  color:
                      _themeProvider.accentColor(_navbarProvider.navbarIndex),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                FlutterClipboard.copy('cem-ergin@outlook.com').then(
                  (value) => showFlash(
                    context: context,
                    duration: Duration(milliseconds: 1500),
                    builder: (context, controller) {
                      return Flash(
                        controller: controller,
                        behavior: FlashBehavior.floating,
                        position: FlashPosition.bottom,
                        boxShadows: kElevationToShadow[4],
                        horizontalDismissDirection:
                            HorizontalDismissDirection.horizontal,
                        child: FlashBar(
                          icon: Icon(
                            Icons.mail,
                            color: _themeProvider.accentColor(
                              _navbarProvider.navbarIndex,
                            ),
                          ),
                          content: Text(
                            'cem-ergin@outlook.com copied to clipboard!',
                            style: TextStyle(
                              color: _themeProvider.accentColor(
                                _navbarProvider.navbarIndex,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        Wrap(
          // alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "You can see my public projects on ",
              style: MyStyles(context).aboutDescription,
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                overlayColor: MaterialStateProperty.all(
                  _themeProvider
                      .accentColor(_navbarProvider.navbarIndex)
                      .withOpacity(.3),
                ),
              ),
              child: Text(
                "Github",
                style: TextStyle(
                  color:
                      _themeProvider.accentColor(_navbarProvider.navbarIndex),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                if (await canLaunch("https://github.com/cem-ergin")) {
                  await launch("https://github.com/cem-ergin");
                } else {
                  throw 'Could not launch github';
                }
              },
            ),
          ],
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.20,
        ),
      ],
    );
  }
}
