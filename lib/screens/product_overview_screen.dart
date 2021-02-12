import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  all,
  k,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showOnlyFavs = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Advik Foods'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    showOnlyFavs = true;
                  } else {
                    showOnlyFavs = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('all'),
                  value: FilterOptions.all,
                ),
                PopupMenuItem(
                  child: Text('only favs'),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text('know kettle'),
                  value: FilterOptions.k,
                ),
              ],
            )
          ],
        ),
        body: ProductGrid(showOnlyFavs));
  }
}
