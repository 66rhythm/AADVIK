// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'package:Project/models/product.dart';
// import '../providers/products.dart';
// import '../widgets/product_item.dart';

// class ProductGrid extends StatelessWidget {
//   // const ProductGrid({
//   //   Key key,
//   //   @required this.loadedProducts,
//   // }) : super(key: key);

//   // final List<Product> loadedProducts;
//   ProductGrid(this.showFavs);
//   final bool showFavs;

//   @override
//   Widget build(BuildContext context) {
//     final productsData = Provider.of<Products>(context);
//     final products = showFavs ? productsData.favoriteItems : productsData.items;
//     return GridView.builder(
//       padding: const EdgeInsets.all(10.0),
//       itemCount: products.length,
//       itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//         value: products[i],
//         child: ProductItem(),
//       ),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, childAspectRatio: 3 / 2, mainAxisSpacing: 10),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
