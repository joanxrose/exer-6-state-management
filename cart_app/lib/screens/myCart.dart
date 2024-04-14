import 'package:cart_app/routes.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/components/computeCost.dart';
import 'package:cart_app/model/item.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context),
          computeCost(),
          //const Divider(height: 4, color: Colors.black),
          Flexible(
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                ElevatedButton(
                    onPressed: () {
                      if (products.isNotEmpty) {
                        context.read<ShoppingCart>().removeAll();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("No items in the cart!"),
                          duration: Duration(seconds: 1, milliseconds: 100),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: const Text("Reset")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, checkoutPage);
                    },
                    child: const Text("Checkout")),
              ]))),
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    String productName = "";
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
                  return ListTile(
                    leading: const Icon(Icons.food_bank),
                    title: Text(products[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        productName = products[index].name;
                        context.read<ShoppingCart>().removeItem(productName);

                        if (products.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$productName removed!"),
                            duration:
                                const Duration(seconds: 1, milliseconds: 100),
                            backgroundColor: Colors.green,
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Cart Empty!"),
                            duration: Duration(seconds: 1, milliseconds: 100),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                    ),
                  );
                },
              )),
            ],
          ));
  }
}
