import 'package:flutter/material.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/services/hive_service.dart';
import 'package:pet_store/shared/utils/dialog_utils.dart';
import 'package:pet_store/shared/widgets/panel/choose_quantity_product_panel.dart';
import '../../models/cart.dart';
import '../utils/app_utils.dart';

class ItemCart extends StatelessWidget {
  final Cart itemCart;
  final Function() onUpdate;
  final Function(Cart) onItemDelete;

  const ItemCart({
    super.key,
    required this.itemCart,
    required this.onUpdate,
    required this.onItemDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.redAccent,
                image: DecorationImage(
                    image: NetworkImage(itemCart.product.image))),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  itemCart.product.name,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Giá sản phẩm: ",
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: [
                          TextSpan(
                              text:
                                  '${AppUtils.formatPrice(itemCart.product.getPrice())} đ',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ))
                        ])),
                    const SizedBox(width: 12.0),
                    itemCart.product.discount != null
                        ? Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.redAccent.shade100,
                                  size: 16.0,
                                ),
                                Text(
                                  '${itemCart.product.discount! * 100}%',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.redAccent.shade100,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChooseQuantityProductPanel(
                      initQuantity: itemCart.quantity,
                      onChoose: (quantity) {
                        FirebaseService.updateQuantity(
                            itemCart.idItem, quantity);
                        HiveService.updateQuantityInCart(
                            id: itemCart.idItem, quantity: quantity);
                        onUpdate();
                      },
                      width: 24.0,
                      height: 18.0,
                    ),
                    IconButton(
                      onPressed: () {
                        DialogUtils.showConfirmDeleteItemCart(
                            context: context,
                            nameProduct: itemCart.product.name,
                            onDelete: () {
                              onItemDelete(itemCart);
                            });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey.shade400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
