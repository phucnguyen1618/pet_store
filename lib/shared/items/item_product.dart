import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/models/product.dart';
import 'package:pet_store/shared/utils/bottomsheet_utils.dart';

import '../utils/app_utils.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final Function(Product, int?) onBuyNow;
  final Function(Product, int) onAddCart;

  const ItemProduct({
    super.key,
    required this.product,
    required this.onAddCart,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        BottomSheetUtils.showBottomSheetProduct(
            product: product,
            context: context,
            onAddCart: (product, quantity) {
              onAddCart(product, quantity);
            },
            onBuyNow: (product, value) {
              onBuyNow(product, value);
            });
      },
      child: Container(
        width: baseWidth * 0.45,
        margin: const EdgeInsets.only(right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              width: baseWidth * 0.45,
              height: baseWidth * 0.45,
              imageUrl: product.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.blue,
                    image: DecorationImage(image: imageProvider)),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12.0),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${AppUtils.formatPrice(product.getPrice())} đ',
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {
                onBuyNow(product, null);
              },
              color: Colors.blue,
              minWidth: double.infinity,
              elevation: 0.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Mua hàng',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
