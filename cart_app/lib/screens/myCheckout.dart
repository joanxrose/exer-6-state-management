import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/components/computeCost.dart';
import 'package:cart_app/model/item.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return Scaffold(
        appBar: AppBar(title: const Text("Checkout")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showItems(context),
            computeCost(),
            ElevatedButton(
                onPressed: () {
                  if (products.isNotEmpty) {
                    context.read<ShoppingCart>().removeAll();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Payment successful!"),
                      duration: Duration(seconds: 2, milliseconds: 200),
                      backgroundColor: Colors.green,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("No items in the cart!"),
                      duration: Duration(seconds: 1, milliseconds: 100),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text("Pay Now"))
          ],
        ));
  }

  Widget showItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text("No items yet!"),
          )
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(products[index].name),
                      Text(products[index].price.toString())
                    ],
                  );
                },
              )),
            ],
          ));
  }
}
