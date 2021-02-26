import 'package:Project/screens/cattle_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/orders_screen.dart';
import '../screens/user_product_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('HelloFriend'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payments),
          title: Text('Orders'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Know your cattle'),
          onTap: () {
            //Later add camel screen and add it
            Navigator.of(context)
                .pushReplacementNamed(CattleOverviewScreen.roueName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Log Out'),
          onTap: () {
            Navigator.of(context).pop();
            // Navigator.of(context)
            //     .pushReplacementNamed(UserProductsScreen.routeName);
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ],
    ));
  }
}
