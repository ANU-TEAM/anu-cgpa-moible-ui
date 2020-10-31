import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 25
        ),
        ),
      ),
    );
  }
}
