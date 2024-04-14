import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';
import 'package:cart_app/routes.dart/constants.dart';
import 'package:cart_app/routes.dart/mainRouting.dart';

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
      initialRoute: catalogPage,
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}
