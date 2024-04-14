import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/components/computeCost.dart';
import 'package:cart_app/model/item.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout Page"),
        ),
        body: const Center(
          child: Text("This is the checkout page!"),
        ));
  }
}
