import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/services/hive_service.dart';
import 'package:pet_store/shared/utils/app_utils.dart';

import '../../../routes/app_routes.dart';

class CartController extends GetxController {
  RxList<Cart> cartList = RxList<Cart>([]);
  RxDouble totalPrice = RxDouble(0);

  @override
  void onInit() {
    onGetItemCartList();
    super.onInit();
  }

  void onGetItemCartList() {
    final dataList = HiveService.getAllCarts();
    if (dataList.isNotEmpty) {
      cartList.value = dataList;
      onUpdateTotalPrice();
    } else {
      FirebaseService.getCarts((items) {
        cartList.addAll(items);
        HiveService.addAllItemCartList(items);
        onUpdateTotalPrice(dataList: items);
      });
    }
  }

  void onUpdateItemQuantity(Cart cart, int value) {
    FirebaseService.updateQuantity(cart.idItem, value);
    log('Id Cart: ${cart.idItem}');
    cart.quantity = value;
    cart.save();
    onUpdateTotalPrice();
  }

  void onUpdateTotalPrice({List<Cart>? dataList}) {
    totalPrice.value = AppUtils.calculateTotalPrice(dataList ?? cartList);
  }

  void onOrderProduct() {
    Get.toNamed(AppRoutes.orderPage, arguments: cartList);
  }

  void onDeleteItemCart(Cart itemCart) {
    FirebaseService.removeItemCartByID(itemCart, () {
      HiveService.deleteCart(itemCart);
      cartList.value = HiveService.getAllCarts();
    }, (error) => log('Error: $error'));
  }
}
