import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:paypal_api/paypal_api.dart';
import 'package:paypal_api/request/send_invoice_request.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/constants/strings.dart';

class OrderController extends GetxController {
  List<Cart> cartList = Get.arguments;

  final prefs = Get.find<SharedPreferences>();
  final paypalRepository = Get.find<PaypalRepository>();

  double shippingFee = 20000;
  double totalProductPrice = 0;

  @override
  void onInit() {
    totalProductPrice = AppUtils.calculateTotalPrice(cartList);
    super.onInit();
  }

  Future<void> onConfirmOrder() async {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
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
        final result = await paypalRepository.createInvoiceNumber();
        if (result.invoiceNumber.isNotEmpty) {
          final response = await paypalRepository.createInvoice(InvoiceRequest(
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
              items: items));
          if (response.href.isNotEmpty) {
            String invoiceId = response.href.split('/').last;
            final result = await paypalRepository.sendInvoice(
                invoiceId, SendInvoiceRequest('Send Invoice', true, true));
            if (result.href.isNotEmpty) {
              await launchUrl(Uri.parse(result.href));
              EasyLoading.dismiss();
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
