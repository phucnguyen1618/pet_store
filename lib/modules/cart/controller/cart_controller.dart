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

  void onUpdateTotalPrice({List<Cart>? dataList}) {
    totalPrice.value = AppUtils.calculateTotalPrice(dataList ?? cartList);
  }

  void onOrderProduct() {
    Get.toNamed(AppRoutes.orderPage, arguments: cartList);
  }

  void onDeleteItemCart(Cart itemCart) {
    HiveService.deleteCart(itemCart);
    FirebaseService.removeItemCartByID(itemCart);
    cartList.value = HiveService.getAllCarts();
  }
}
