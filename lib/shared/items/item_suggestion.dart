import 'package:flutter/material.dart';
import 'package:pet_store/models/product.dart';

class ItemSuggestion extends StatelessWidget {
  final Product product;
  const ItemSuggestion({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(product.image)),
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
