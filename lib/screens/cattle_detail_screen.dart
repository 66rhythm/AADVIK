import 'package:flutter/material.dart';

class CattleDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/cattle-detail';

  @override
  Widget build(BuildContext context) {
    final CattleId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    // ...
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
