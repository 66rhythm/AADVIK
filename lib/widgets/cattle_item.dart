import 'package:flutter/material.dart';

import '../screens/cattle_detail_screen.dart';

class CattleItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double milkProduced;
  final double consumption;

  CattleItem(
      this.id, this.title, this.imageUrl, this.milkProduced, this.consumption);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              CattleDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            "Milk Produced-${milkProduced}L , Fodder Consumed-${consumption}Kg",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
