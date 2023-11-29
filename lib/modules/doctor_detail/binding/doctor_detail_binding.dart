import 'package:get/get.dart';
import 'package:pet_store/modules/doctor_detail/controller/doctor_detail_controller.dart';

class DoctorDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorDetailController());
  }
}
