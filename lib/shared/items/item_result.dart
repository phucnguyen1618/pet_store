import 'package:flutter/material.dart';
import 'package:pet_store/models/product.dart';
import 'package:pet_store/shared/utils/app_utils.dart';

class ItemResult extends StatelessWidget {
  final Product product;
  final Function(Product) onAddCart;
  final Function(Product) onBuyNow;

  const ItemResult({
    super.key,
    required this.product,
    required this.onBuyNow,
    required this.onAddCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        title: Text(
          product.name,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppUtils.formatPrice(product.getPrice()),
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonTheme(
                  minWidth: 66.0,
                  height: 24.0,
                  child: MaterialButton(
                    onPressed: () {
                      onAddCart(product);
                    },
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side:
                          const BorderSide(width: 0.5, color: Colors.redAccent),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Thêm vào giỏ hàng',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                ButtonTheme(
                  minWidth: 66.0,
                  height: 24.0,
                  child: MaterialButton(
                    onPressed: () {
                      onBuyNow(product);
                    },
                    elevation: 0.0,
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side:
                          const BorderSide(width: 0.5, color: Colors.redAccent),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Mua ngay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(product.image),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
