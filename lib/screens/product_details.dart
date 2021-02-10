import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  ProductDetails(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
