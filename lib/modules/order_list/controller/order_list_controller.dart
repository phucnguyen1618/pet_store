import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

import '../../../models/order.dart';

class OrderListController extends GetxController {

  RxList<Order> orderList = RxList<Order>();

  @override
  void onInit() {
    getOrderList();
    super.onInit();
  }

  void getOrderList() {
    FirebaseService.getOrderList((dataList) {
      orderList.value = dataList;
    }, (error) => log('Error: $error'));
  }
}
