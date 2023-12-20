import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:paypal_api/paypal_api.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/models/order.dart';
import 'package:pet_store/models/order_detail.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/services/hive_service.dart';
import 'package:pet_store/shared/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/constants/strings.dart';

class OrderController extends GetxController {
  List<Cart> cartList = Get.arguments;

  final prefs = Get.find<SharedPreferences>();
  final paypalRepository = Get.find<PaypalRepository>();

  double shippingFee = 20000;
  double totalProductPrice = 0;
  RxInt paymentMethod = RxInt(0);

  @override
  void onInit() {
    totalProductPrice = AppUtils.calculateTotalPrice(cartList);
    paymentMethod.value = prefs.getInt(Strings.paymentMethod) ?? 0;
    super.onInit();
  }

  void onChoosePayment(int value) {
    prefs.setInt(Strings.paymentMethod, value);
    paymentMethod.value = value;
  }

  Future<void> onConfirmOrder() async {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      if (paymentMethod.value == 0) {
        HiveService.deleteAll();
        List<OrderDetail> orderDetails = cartList
            .map((e) => OrderDetail(e.product.idProduct, e.quantity,
                e.product.getPrice() * e.quantity))
            .toList();
        String idOrder = const Uuid().v4();
        Order order = Order(idOrder, idUser, orderDetails, DateTime.now(),
            totalProductPrice, 1);
        FirebaseService.writeOrderToDb(order, () => null, (p0) => null);
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        final items = cartList
            .map((e) => Item(
                e.product.name,
                e.product.idProduct,
                e.quantity.toString(),
                UnitAmount('USD', AppUtils.convertVNDToUSD(e.product.cost)),
                e.product.discount != null
                    ? Discount(e.product.discount.toString(), null)
                    : null))
            .toList();
        try {
          EasyLoading.show();
          String credentials =
              "${AppConstants.clientID}:${AppConstants.clientSecret}";
          String encoded = base64.encode(utf8.encode(credentials));
          final author = await paypalRepository.authorize(
              authorization: 'Basic $encoded',
              grantType: AppConstants.grantType);
          final result = await paypalRepository.createInvoiceNumber(
              token: 'Bearer ${author.accessToken}');
          if (result.invoiceNumber.isNotEmpty) {
            final response = await paypalRepository.createInvoice(
                request: InvoiceRequest(
                    detail: Detail('USD', result.invoiceNumber),
                    invoicer: Invoicer(
                        Name('Jeremie Nguyen'),
                        Address('US', '1234 First Street', '98765'),
                        'sb-9sy6b28569522@business.example.com'),
                    recipients: [
                      Recipient(
                          BillingInfo(
                              Name('John Doe'),
                              Address('US', '1234 First Street', '98765'),
                              'sb-di8k928585644@personal.example.com'),
                          null)
                    ],
                    items: items),
                token: 'Bearer ${author.accessToken}');
            if (response.href.isNotEmpty) {
              String invoiceId = response.href.split('/').last;
              final result = await paypalRepository.sendInvoice(
                  idInvoice: invoiceId,
                  request: SendInvoiceRequest('Send Invoice', true, true),
                  token: 'Bearer ${author.accessToken}');
              if (result.href.isNotEmpty) {
                await launchUrl(Uri.parse(result.href));
                EasyLoading.dismiss();
                HiveService.deleteAll();
                List<OrderDetail> orderDetails = cartList
                    .map((e) => OrderDetail(e.product.idProduct, e.quantity,
                        e.product.getPrice() * e.quantity))
                    .toList();
                String idOrder = const Uuid().v4();
                Order order = Order(idOrder, idUser, orderDetails,
                    DateTime.now(), totalProductPrice, 1);
                FirebaseService.writeOrderToDb(order, () => null, (p0) => null);
                Get.offAllNamed(AppRoutes.homePage);
              }
            }
          }
        } catch (error) {
          log('Error: ${error.toString()}');
        }
      }
    }
  }
}
