import 'package:Project/screens/cattle_detail_screen.dart';
import 'package:Project/screens/cattle_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/product_details.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/splash_screen.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(null, null, []),
          update: (ctx, auth, prevProd) => Products(
              auth.token, auth.userId, prevProd == null ? [] : prevProd.items),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(null, null, []),
          update: (ctx, auth, prevOrders) => Orders(auth.token, auth.userId,
              prevOrders == null ? [] : prevOrders.orders),
        ),
      ],
      child:
          //    MaterialApp(
          //       title: 'AADVIK FOODS',
          //       theme: ThemeData(
          //         primarySwatch: Colors.blue,
          //         accentColor: Colors.deepOrange,
          //         fontFamily: 'Lato',
          //       ),
          //       home: AuthScreen(),
          //       routes: {
          //         ProductDetails.routeName: (ctx) => ProductDetails(),
          //         CartScreen.roueName: (ctx) => CartScreen(),
          //         OrdersScreen.routeName: (ctx) => OrdersScreen(),
          //         UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          //         EditProductScreen.routeName: (ctx) => EditProductScreen(),
          //       }),
          // );
          Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetails.routeName: (ctx) => ProductDetails(),
            CartScreen.roueName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            CattleOverviewScreen.roueName: (ctx) => CattleOverviewScreen(),
            // CattleDetailScreen.routeName: (ctx) => CattleDetailScreen(),
          },
        ),
      ),
    );
  }
}
