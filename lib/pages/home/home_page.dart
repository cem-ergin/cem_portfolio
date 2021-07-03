import 'package:cem_portfolio/helper/size_helper.dart';
import 'package:cem_portfolio/providers/navbar_provider.dart';
import 'package:cem_portfolio/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

SizeHelper _sizeHelper = SizeHelper();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navbarProvider = Provider.of<NavbarProvider>(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _navbarProvider.navbarIndex = 1;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I",
                        style: TextStyle(
                          fontSize: _sizeHelper.size.width * 0.05,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "am",
                        style: TextStyle(
                          fontSize: _sizeHelper.size.width * 0.05,
                          color: _themeProvider
                              .accentColor(_navbarProvider.navbarIndex),
                        ),
                      ),
                      Text(
                        "CEM",
                        style: TextStyle(
                          fontSize: _sizeHelper.size.width * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\nFlutter Developer",
                        style: TextStyle(
                          color: _themeProvider
                              .accentColor(_navbarProvider.navbarIndex),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              left: 8.0,
              right: 8.0,
            ),
            child: GestureDetector(
              onTap: () async {
                if (await canLaunch(
                    "https://github.com/cem-ergin/cem_portfolio")) {
                  await launch("https://github.com/cem-ergin/cem_portfolio");
                } else {
                  throw 'Could not launch github';
                }
              },
              child: SizedBox(
                height: _sizeHelper.size.height * 0.035,
                width: _sizeHelper.size.width * 0.75,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "This site build with Flutter. You can find source code on my github account",
                    style: TextStyle(
                      color: _themeProvider
                          .accentColor(_navbarProvider.navbarIndex),
                      // fontSize: _sizeHelper.size.width * 0.025,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
