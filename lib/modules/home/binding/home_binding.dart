import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_store/modules/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    log('Home Binding');
    Get.lazyPut(() => HomeController());
  }
}
