import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/models/product.dart';
import 'package:pet_store/shared/services/storage_service.dart';

import 'shared/services/hive_service.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    await Hive.initFlutter();
    Hive.registerAdapter(CartAdapter());
    Hive.registerAdapter(ProductAdapter());
    HiveService.openCartBox();
  }
}
