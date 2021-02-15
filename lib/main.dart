import 'package:Project/screens/product_details.dart';
import 'package:Project/screens/user_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import "./screens/product_overview_screen.dart";
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import 'providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: Orders(),
          )
        ],
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
            CartScreen.roueName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen()
          },
        ));
  }
}
