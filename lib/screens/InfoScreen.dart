import 'package:flutter/material.dart';

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
      body: Container(),
    );
  }
}
