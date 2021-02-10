import 'package:flutter/material.dart';
import "./screens/product_overview_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red[400],
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
    );
  }
}
//I am making changes
