import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';
import 'package:cart_app/screens/myCart.dart';
import 'package:cart_app/screens/myCatalog.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ShoppingCart())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String appTitle = "State Management Demo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/products",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
        // "/checkout": (context) => MyCheckout()
      },
    );
  }
}
