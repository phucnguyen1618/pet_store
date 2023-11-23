import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/services/hive_service.dart';
import 'package:uuid/uuid.dart';

import '../../../models/product.dart';
import '../../../shared/services/firebase_service.dart';

class HomeController extends GetxController {
  List<String> images = [
    'assets/background_image01.jpg',
    'assets/background_image02.jpg',
    'assets/background_image03.jpg',
    'assets/background_image04.jpg',
    'assets/background_image05.jpg',
    'assets/background_image06.jpg',
    'assets/background_image07.jpg',
  ];

  RxList<Product> productList = RxList<Product>();
  RxList<Product> productWithCategoryList = RxList<Product>();
  RxList<Product> dataList1 = RxList<Product>();
  RxList<Product> dataList2 = RxList<Product>();
  RxList<Product> dataList3 = RxList<Product>();
  RxList<Product> dataList4 = RxList<Product>();

  List<String> categories = [
    'Sản phẩm mới',
    'Sản phẩm khuyến mãi',
    'Sản phẩm bán chạy',
    'Thức ăn khô cho chó',
    'Thức ăn khô cho mèo',
    'Thuốc đặc trị',
    'Sản phẩm dinh dưỡng',
  ];

  @override
  void onInit() {
    FirebaseService.fetchProductList((dataList) {
      productList.addAll(dataList);
      productWithCategoryList.addAll(dataList);
      dataList1.addAll(dataList.where((element) =>
          element.categories.contains('Đồ Chơi | Dụng Cụ Ăn Uống')));
      dataList2.addAll(dataList.where((element) =>
          element.categories.contains('Sữa Tắm | Nước Hoa | Khử Mùi')));
      dataList3.addAll(dataList
          .where((element) => element.categories.contains('Sản Phẩm Vệ Sinh')));
      dataList4.addAll(dataList
          .where((element) => element.categories.contains('Chuồng | Lồng | Balo | Túi Xách')));
    });
    super.onInit();
  }

  void onAddProductToCart(Product product, int quantity) {
    if (FirebaseService.isUserSignedIn()) {
      String idCart = const Uuid().v4();
      final itemCart = Cart(idCart, product, quantity);
      bool isExists = HiveService.checkProductIsExists(product.idProduct);
      if (isExists) {
        EasyLoading.showToast('Sản phẩm đã có trong giỏ hàng');
      } else {
        FirebaseService.writeCartToDb(itemCart);
        HiveService.addProductToCart(product, quantity);
      }
    } else {
      EasyLoading.showToast('Bạn chưa đăng nhập ứng dụng');
    }
  }

  void onBuyNowProduct(Product product, int? value) {
    if (FirebaseService.isUserSignedIn()) {
      String idItem = const Uuid().v4();
      if (value != null && value != 0) {
        Cart itemCart = Cart(idItem, product, value);
        Get.toNamed(AppRoutes.orderPage, arguments: [itemCart]);
      } else {
        Cart itemCart = Cart(idItem, product, 1);
        Get.toNamed(AppRoutes.orderPage, arguments: [itemCart]);
      }
    } else {
      EasyLoading.showToast('Bạn chưa đăng nhập ứng dụng');
    }
  }

  void onSignOut() {
    FirebaseService.signOut();
  }
}
