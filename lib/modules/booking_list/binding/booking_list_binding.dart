import 'package:get/get.dart';
import 'package:pet_store/modules/booking_list/controller/booking_list_controller.dart';

class BookingListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingListController());
  }
}
