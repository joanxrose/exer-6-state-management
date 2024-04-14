import 'package:cart_app/screens/myCart.dart';
import 'package:cart_app/screens/myCatalog.dart';
import 'package:cart_app/screens/myCheckout.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class MainRouting {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case catalogPage:
        return MaterialPageRoute(builder: (context) => const MyCatalog());
      case cartPage:
        return MaterialPageRoute(builder: (context) => const MyCart());
      case checkoutPage:
        return MaterialPageRoute(builder: (context) => MyCheckout());
      default:
        return MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text("ERROR!"))));
    }
  }
}
