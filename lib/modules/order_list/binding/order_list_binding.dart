import 'package:get/get.dart';
import 'package:pet_store/modules/order_list/controller/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderListController());
  }
}
