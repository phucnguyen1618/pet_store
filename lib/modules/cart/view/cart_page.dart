import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/cart/controller/cart_controller.dart';
import 'package:pet_store/shared/utils/app_utils.dart';

import '../../../shared/items/item_cart.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Giỏ hàng của bạn',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => controller.cartList.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) => ItemCart(
                      itemCart: controller.cartList[index],
                      onUpdate: (value) {
                        controller.onUpdateItemQuantity(
                            controller.cartList[index], value);
                      },
                      onItemDelete: (itemCart) {
                        controller.onDeleteItemCart(itemCart);
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12.0),
                  ),
                )
              : const Center(
                  child: Text(
                    'Giỏ hàng của bạn đang trống',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                )),
        ],
      ),
      persistentFooterButtons: [
        Obx(() => controller.cartList.isNotEmpty
            ? ButtonTheme(
                height: 48.0,
                child: MaterialButton(
                    onPressed: () {
                      controller.onOrderProduct();
                    },
                    color: Colors.blue,
                    minWidth: double.infinity,
                    elevation: 1.0,
                    child: Text(
                      'Thanh toán (${AppUtils.formatPrice(controller.totalPrice.value)} đ)',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )))
            : const SizedBox())
      ],
    );
  }
}
