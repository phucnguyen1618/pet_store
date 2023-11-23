import 'package:flutter/material.dart';
import 'package:pet_store/models/product.dart';
import 'package:pet_store/shared/widgets/bottomsheet/choose_birthday_bottomsheet.dart';

import '../widgets/bottomsheet/product_bottomsheet.dart';

class BottomSheetUtils {
  static void showBottomSheetProduct({
    required Product product,
    required BuildContext context,
    required Function(Product, int) onAddCart,
    required Function(Product, int) onBuyNow,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => ProductBottomSheet(product: product),
    ).then((value) {
      if (value != null) {
        int quantity = value['quantity'] as int;
        if (value['isBuyNow'] == false) {
          onAddCart(product, quantity);
        } else {
          onBuyNow(product, quantity);
        }
      }
    });
  }

  static void showChooseBirthdayBottomSheet(
      BuildContext context, Function(DateTime) onChoose) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => const ChooseBirthdayBottomSheet(),
    ).then((dateTime) {
      if (dateTime != null) {
        onChoose(dateTime);
      }
    });
  }
}
