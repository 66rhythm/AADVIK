import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  // final String title;
  // ProductDetails(this.title);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
