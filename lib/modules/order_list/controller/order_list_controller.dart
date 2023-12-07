import 'dart:developer';

import 'package:get/get.dart';
import 'package:paypal_api/paypal_api.dart';
import 'package:pet_store/models/order.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

class OrderListController extends GetxController {
  RxList<Order> orderList = RxList<Order>();

  final paypalRepository = Get.find<PaypalRepository>();

  @override
  void onInit() {
    
    super.onInit();
  }

  void getListInvoice() {
   // paypalRepository.
  }
}
