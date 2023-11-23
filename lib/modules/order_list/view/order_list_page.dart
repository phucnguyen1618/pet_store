import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/order_list/controller/order_list_controller.dart';
import 'package:pet_store/shared/items/item_order.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Đơn hàng của bạn',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(() => Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ItemOrder(order: controller.orderList[index]),
                  separatorBuilder: (context, index) => Divider(
                    thickness: 12.0,
                    color: Colors.grey.shade100,
                  ),
                  itemCount: controller.orderList.length,
                ),
              ))
        ],
      ),
    );
  }
}
