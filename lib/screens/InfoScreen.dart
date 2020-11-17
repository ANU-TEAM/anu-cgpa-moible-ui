import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.yellow[700]),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "About",
          style: TextStyle(
            color: Colors.yellow[700],
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Developed By ANU DSC",
              style: TextStyle(
                fontSize: 34,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "More Updates coming soon.",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: GestureDetector(
              onTap: () => launch(
                  'https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
              child: Text(
                "Join Us",
                style: new TextStyle(color: Colors.yellow[700], fontSize: 20),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
