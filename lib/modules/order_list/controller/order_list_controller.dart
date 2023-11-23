import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_store/models/order.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

class OrderListController extends GetxController {
  RxList<Order> orderList = RxList<Order>();

  @override
  void onInit() {
    FirebaseService.getOrderList((orders) {
      orderList.addAll(orders);
    }, (error) {
      log('Error: $error');
    });
    super.onInit();
  }
}
