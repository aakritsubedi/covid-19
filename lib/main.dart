import 'package:covid19/datasource.dart';
import 'package:flutter/material.dart';

import 'package:covid19/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Tracker',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'CircularStd',
        primaryColor: primaryBlack
      ),
      home: MyHomePage(title: 'Covid-19 Tracker App'),
    );
  }
}

