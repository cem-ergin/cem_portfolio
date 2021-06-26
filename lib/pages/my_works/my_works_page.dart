import 'package:cem_portfolio/helper/size_helper.dart';
import 'package:cem_portfolio/providers/navbar_provider.dart';
import 'package:cem_portfolio/providers/theme_provider.dart';
import 'package:cem_portfolio/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

SizeHelper _sizeHelper = SizeHelper();

class MyWorksPage extends StatefulWidget {
  const MyWorksPage({Key key}) : super(key: key);

  @override
  _MyWorksPageState createState() => _MyWorksPageState();
}

class _MyWorksPageState extends State<MyWorksPage> {
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
          "My Works",
          style: MyStyles(context).aboutTitle,
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.01,
        ),
        _buildProjectColumn(
          context,
          project:
              "An application that combines all your needs in one application. For example, you can   order food, installation, grocery shopping, etc.",
          role: "Mobile Application Developer",
          responsibilities:
              "I wrote the company side of that application. Application design.",
          technology: "Flutter, Node.js, Vue.js.",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project: "A mobile application for a Tax Advisor company in Germany.",
          role: "Mobile Application Developer",
          responsibilities:
              "Implementing OpenCV for recognizing paper, tax, invoices, documents. Communicating with back-end developer and designing project back-end for mobile only. Implementing their design in Adobe Xd to Flutter.",
          technology: "Flutter, OpenCV",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project:
              "Mobile app for a Logistic, Transportation company in Germany",
          role: "Project Manager",
          responsibilities:
              "I developed a mobile app for a Logistic, Transportation company in Germany. I work together with back-end developer for OCR for this project. Application design.",
          technology: "Flutter, Node.js, Flask, Python3",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project: "Online fruit & vegetable ordering application",
          role: "Mobile Application Developer",
          responsibilities:
              "Communicating with the people who gave the application. Writing their requests to the application. Implementing their design in Adobe Xd to Flutter.",
          technology:
              "Flutter on mobile, don’t know backend and frontend of website.",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project: "Service and staff management for water dispenser company",
          role: "Project Manager, Mobile Developer",
          responsibilities:
              "Communicating with the people who give the mobile application details. Writing their requests to the application. Mobile Application design. Back-end publish.",
          technology:
              "Flutter on mobile, Node.js on backend, Amazon Web Services on database, heroku.com for deployment. Firebase.",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project: "Order management mobile application for sportswear shop.",
          role: "Project Manager, Mobile Developer",
          responsibilities:
              "Communicating with the people who give the mobile application details. Writing their requests to the application. Mobile Application design.",
          technology:
              "Qr technology implementation, Flutter on mobile, Firebase for backend and database.",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project: "A mobile application for reservation system.",
          role: "Mobile Application Developer",
          responsibilities:
              "Mobile Application design, ui and developing application.",
          technology:
              "Flutter on mobile, Node.js on backend. Sms information service.",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project: "A mobile application for Kindergartens.",
          role: "Mobile Application Developer",
          responsibilities:
              "Mobile Application design, ui and developing application.",
          technology:
              "Flutter on mobile, Node.js on backend. Vue.js on the website. Firebase for push notification.",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        _buildProjectColumn(
          context,
          project: "A mobile application for taxi, local bus drivers.",
          role: "Mobile Application Developer",
          responsibilities:
              "Mobile Application design, ui and developing application.",
          technology:
              "Java for android development, swift for ios development, Firebase on backend.",
        ),
        Divider(
          color: _themeProvider.accentColor(_navbarProvider.navbarIndex),
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.02,
        ),
      ],
    );
  }

  Column _buildProjectColumn(
    BuildContext context, {
    @required String project,
    @required String role,
    @required String responsibilities,
    @required String technology,
  }) {
    return Column(
      children: [
        SizedBox(
          height: _sizeHelper.size.height * 0.02,
        ),
        _buildRow(
          context,
          "Project",
          "$project",
        ),
        Divider(),
        _buildRow(
          context,
          "Role",
          "$role",
        ),
        Divider(),
        _buildRow(
          context,
          "Main Responsibilities",
          "$responsibilities",
        ),
        Divider(),
        _buildRow(
          context,
          "Technology",
          "$technology",
        ),
        SizedBox(
          height: _sizeHelper.size.height * 0.02,
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, String title, String description) {
    return ListTile(
      title: Text(
        "$title",
        style: MyStyles(context).aboutDescription.copyWith(
              color: Provider.of<ThemeProvider>(context, listen: false)
                  .accentColor(
                Provider.of<NavbarProvider>(context, listen: false).navbarIndex,
              ),
            ),
      ),
      subtitle: Text(
        "$description",
        style: MyStyles(context).aboutHeader,
      ),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "$title",
            style: MyStyles(context).aboutDescription,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            "$description",
            style: MyStyles(context).aboutHeader,
          ),
        ),
      ],
    );
  }
}
