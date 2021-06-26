import 'package:cem_portfolio/providers/navbar_provider.dart';
import 'package:cem_portfolio/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'helper/size_helper.dart';
import 'pages/about/about_page.dart';
import 'pages/home/home_page.dart';
import 'pages/my_works/my_works_page.dart';
import 'styles/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff0d1137),
          accentColor: Color(0xffe52165),
          fontFamily: "Terminal",
          // fontFamily: "UbuntuMono",
        ),
        home: InitialPage(),
      ),
    );
  }
}

class InitialPage extends StatefulWidget {
  InitialPage({Key key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  SizeHelper _sizeHelper = SizeHelper();

  @override
  Widget build(BuildContext context) {
    _sizeHelper.setSize(MediaQuery.of(context).size);
    _sizeHelper.padding = MediaQuery.of(context).padding;
    final _size = MediaQuery.of(context).size;
    final _navbarProvider = Provider.of<NavbarProvider>(context);
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color:
                      _themeProvider.primaryColor(_navbarProvider.navbarIndex),
                  // child: MyWorksPage(),
                  child: AnimatedSwitcher(
                    duration: kAnimationDuration,
                    child: _navbarProvider.navbarIndex == 0
                        ? HomePage()
                        : _navbarProvider.navbarIndex == 1
                            ? AboutPage()
                            : MyWorksPage(),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: _size.width * 0.25 / 2,
            bottom: _size.height * 0.05,
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              duration: kAnimationDuration,
              child: _navbarProvider.showNavbar
                  ? Center(
                      child: Container(
                        height: _size.height * 0.1,
                        width: _size.width * 0.75,
                        color: _themeProvider
                            .accentColor(_navbarProvider.navbarIndex),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                height: _size.height * 0.1,
                                child: TextButton(
                                  onPressed: () {
                                    _navbarProvider.navbarIndex = 1;
                                  },
                                  child:
                                      // _navbarProvider.navbarIndex == 1
                                      //     ? ClipOval(
                                      //         child: Image.asset(
                                      //           "assets/images/profile_photo.png",
                                      //           height: _size.height * 0.09,
                                      //           fit: BoxFit.fitHeight,
                                      //         ),
                                      //       )
                                      //     :
                                      Text(
                                    "ABOUT ME",
                                    style: _navbarProvider.navbarIndex == 1
                                        ? MyStyles(context).navbarActiveStyle
                                        : MyStyles(context).navbarInactiveStyle,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: _size.width * 0.003,
                              color: _themeProvider
                                  .primaryColor(_navbarProvider.navbarIndex),
                            ),
                            Expanded(
                              child: Container(
                                height: _size.height * 0.1,
                                child: TextButton(
                                  onPressed: () {
                                    _navbarProvider.navbarIndex = 2;
                                  },
                                  child: Text(
                                    "MY WORKS",
                                    style: _navbarProvider.navbarIndex == 2
                                        ? MyStyles(context).navbarActiveStyle
                                        : MyStyles(context).navbarInactiveStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets get padding8 => const EdgeInsets.all(8.0);
}
