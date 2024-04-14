import 'package:cart_app/components/customButton.dart';
import 'package:cart_app/components/noItems.dart';
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
        appBar: AppBar(
          title: const Text(
            "CHECKOUT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            if (products.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 4, top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Summary",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey),
                  ),
                ),
              ),
            if (products.isNotEmpty) const Divider(),
            showItems(context),
            if (products.isNotEmpty) const Divider(),
            if (products.isNotEmpty) computeCost(),
            if (products.isNotEmpty)
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 100, left: 20, right: 20),
                  child: CustomButton(
                      onPressed: () {
                        // When pay now button is clicked, set the total cost to 0
                        // This can be done by simply removing all the items in the list
                        // After that, pop two times to go back to the main page (catalog page)

                        context.read<ShoppingCart>().removeAll();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Payment successful!"),
                          duration: Duration(seconds: 2, milliseconds: 200),
                          backgroundColor: Colors.green,
                        ));
                      },
                      text: "Pay Now",
                      backgroundColor: Colors.blue)),
          ],
        ));
  }

  Widget showItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const NoItemsComponent(
            text: "No items to checkout!",
            paddingTop: 200,
          )
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(products[index].name),
                      Text(products[index].price.toString())
                    ],
                  ));
                },
              )),
            ],
          ));
  }
}
