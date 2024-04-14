import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';

Widget computeCost() {
  return Consumer<ShoppingCart>(
    builder: (context, cart, child) {
      return Text("Total: ${cart.cartTotal}");
    },
  );
}
