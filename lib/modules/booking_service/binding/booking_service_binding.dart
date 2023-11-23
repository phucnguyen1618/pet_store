import 'package:get/get.dart';
import 'package:pet_store/modules/booking_service/controller/booking_service_controller.dart';

class BookingServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingServiceController());
  }
}
