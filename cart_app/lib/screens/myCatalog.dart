import 'package:cart_app/routes.dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart_app/model/item.dart';
import 'package:cart_app/provider/shoppingcart_provider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "CATALOG",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.star),
                  title: Text(
                    "${productsCatalog[index].name} - Php ${productsCatalog[index].price}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: TextButton(
                    child: const Text("Add"),
                    onPressed: () {
                      context
                          .read<ShoppingCart>()
                          .addItem(productsCatalog[index]);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${productsCatalog[index].name} added!"),
                        duration: const Duration(seconds: 1, milliseconds: 100),
                        // backgroundColor: Colors.green,
                      ));
                    },
                  ),
                );
              },
              itemCount: productsCatalog.length),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, cartPage);
          },
        ));
  }
}
