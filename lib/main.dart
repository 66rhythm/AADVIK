import 'package:Project/screens/product_details.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import "./screens/product_overview_screen.dart";
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => Products(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.red[400],
            fontFamily: 'Lato',
          ),
          home: ProductOverviewScreen(),
          routes: {
            ProductDetails.routeName: (ctx) => ProductDetails(),
          },
        ));
  }
}
