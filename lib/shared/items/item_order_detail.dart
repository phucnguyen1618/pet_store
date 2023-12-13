import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/models/product.dart';

import '../utils/app_utils.dart';

class ItemOrderDetail extends StatelessWidget {
  final Cart itemCart;
  const ItemOrderDetail({
    super.key,
    required this.itemCart,
  });

  @override
  Widget build(BuildContext context) {
    Product product = itemCart.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 100.0,
            height: 100.0,
            imageUrl: product.image,
            imageBuilder: (context, provider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  image: DecorationImage(
                    image: provider,
                    fit: BoxFit.cover,
                  )),
            ),
            placeholder: (context, url) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppUtils.formatPrice(product.getPrice()),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'x${itemCart.quantity}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
