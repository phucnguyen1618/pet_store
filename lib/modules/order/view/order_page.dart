import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/order/controller/order_controller.dart';
import 'package:pet_store/modules/order/view/user_contact.dart';
import 'package:pet_store/shared/items/item_order_detail.dart';
import 'package:pet_store/shared/utils/dialog_utils.dart';

import '../../../shared/utils/app_utils.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Giao hàng của bạn',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const UserContact(),
            const SizedBox(height: 12.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Danh sách sản phẩm',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  ItemOrderDetail(itemCart: controller.cartList[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: controller.cartList.length,
            ),
            const SizedBox(height: 12.0),
            Divider(
              thickness: 8.0,
              color: Colors.grey.shade200,
            ),
            ListTile(
              title: const Text(
                'Tổng tiền sản phẩm:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Gồm có ${controller.cartList.length} mặt hàng',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                AppUtils.formatPrice(controller.totalProductPrice),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              height: 8.0,
              color: Colors.grey,
            ),
            ListTile(
              title: const Text(
                'Phí vận chuyển:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                AppUtils.formatPrice(controller.shippingFee),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              height: 8.0,
              color: Colors.grey,
            ),
            ListTile(
              title: const Text(
                'Tổng tiền:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Tính theo đơn vị (VNĐ)',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                AppUtils.formatPrice(
                    controller.totalProductPrice + controller.shippingFee),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              height: 8.0,
              color: Colors.grey,
            ),
            ListTile(
              title: const Text(
                'Chọn phương thức thanh toán:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Obx(
                () => Text(
                  controller.paymentMethod.value == 0
                      ? 'Thanh toán sau khi nhận hàng'
                      : 'Thanh toán với PayPal',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ),
              trailing: TextButton(
                  onPressed: () {
                    DialogUtils.showChoosePaymentMethod((value) {
                      controller.paymentMethod.value = value;
                    });
                  },
                  child: const Text('Thay đổi')),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Center(
            child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width - 2 * 8,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: MaterialButton(
            onPressed: () {
              controller.onConfirmOrder();
            },
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: const Text(
              'Xác nhận đặt hàng',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ))
      ],
    );
  }
}
