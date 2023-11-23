import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/models/order.dart';
import 'package:pet_store/models/order_detail.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/services/hive_service.dart';
import 'package:pet_store/shared/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/constants/strings.dart';

class OrderController extends GetxController {
  List<Cart> cartList = Get.arguments;

  final prefs = Get.find<SharedPreferences>();

  double shippingFee = 20000;
  double totalProductPrice = 0;

  @override
  void onInit() {
    totalProductPrice = AppUtils.calculateTotalPrice(cartList);
    super.onInit();
  }

  void onConfirmOrder() {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      String idOrder = const Uuid().v1();
      final orderDetails = cartList
          .map((e) => OrderDetail(e.product.idProduct, e.quantity,
              e.quantity * e.product.getPrice()))
          .toList();
      Order order = Order(
          idOrder, idUser, orderDetails, DateTime.now(), totalProductPrice, 0);
      FirebaseService.writeOrderToDb(order, () {
        bool isCartListExists = HiveService.checkCartListExists(cartList);
        log('Exists : $isCartListExists');
        if (isCartListExists) {
          HiveService.deleteAll();
          FirebaseService.removeCartList();
        }
        EasyLoading.showSuccess('Đặt hàng thành công');
        Get.offAllNamed(AppRoutes.homePage);
      }, (error) {
        log('Error: $error');
        EasyLoading.showError('Đã xảy ra lỗi. Vui lòng thử lại');
      });
    }
  }
}
