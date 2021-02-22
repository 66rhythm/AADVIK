// import 'package:Project/screens/cart_screen.dart';
// import 'package:Project/widgets/app_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../widgets/product_grid.dart';
// import '../widgets/badge.dart';
// import '../providers/cart.dart';
// import '../screens/cart_screen.dart';
// import '../providers/products.dart';

// enum FilterOptions {
//   Favorite,
//   all,
//   k,
// }

// class ProductOverviewScreen extends StatefulWidget {
//   @override
//   _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
// }

// class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
//   bool showOnlyFavs = false;
//   var _isInIt = true;
//   var _isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   void didChangeDependencies() {
//     if (_isInIt) {
//       setState(() {
//         _isLoading = true;
//       });

//       Provider.of<Products>(context).fetchAndSetProducts().then((_) {
//         _isLoading = false;
//       });
//     }

//     _isInIt = false;
//     super.didChangeDependencies();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Advik Foods'),
//           actions: <Widget>[
//             PopupMenuButton(
//               onSelected: (FilterOptions selectedValue) {
//                 setState(() {
//                   if (selectedValue == FilterOptions.Favorite) {
//                     showOnlyFavs = true;
//                   } else {
//                     showOnlyFavs = false;
//                   }
//                 });
//               },
//               icon: Icon(Icons.more_vert),
//               itemBuilder: (_) => [
//                 PopupMenuItem(
//                   child: Text('all'),
//                   value: FilterOptions.all,
//                 ),
//                 PopupMenuItem(
//                   child: Text('only favs'),
//                   value: FilterOptions.Favorite,
//                 ),
//                 PopupMenuItem(
//                   child: Text('know kettle'),
//                   value: FilterOptions.k,
//                 ),
//               ],
//             ),
//             Consumer<Cart>(
//               builder: (_, cart, ch) => Badge(
//                 child: ch,
//                 value: cart.itemCount.toString(),
//               ),
//               child: IconButton(
//                 icon: Icon(
//                   Icons.shopping_cart,
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(CartScreen.roueName);
//                 },
//               ),
//             )
//           ],
//         ),
//         drawer: AppDrawer(),
//         body: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ProductGrid(showOnlyFavs));
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aadvik Foods'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.roueName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
