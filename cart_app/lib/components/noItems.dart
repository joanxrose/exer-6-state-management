import 'package:flutter/material.dart';

class NoItemsComponent extends StatelessWidget {
  const NoItemsComponent(
      {super.key, required this.text, required this.paddingTop});

  final String text;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: 150),
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.redeem_outlined,
              color: Colors.grey,
              size: 50,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
