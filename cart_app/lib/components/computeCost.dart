import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';

Widget computeCost() {
  return Consumer<ShoppingCart>(
    builder: (context, cart, child) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Php ${cart.cartTotal}",
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );
    },
  );
}
