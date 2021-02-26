import 'package:flutter/material.dart';

class Cattle with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double consumption;
  final double milkProduced;
  final String imageUrl;

  Cattle({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.consumption,
    @required this.milkProduced,
    @required this.imageUrl,
  });
}
