import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/booking_service/controller/booking_service_controller.dart';

class OrdererInfo extends StatelessWidget {
  const OrdererInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingServiceController>();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12.0),
          const Text(
            'Thông tin người đặt',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: controller.nameController,
            decoration: const InputDecoration(
              labelText: 'Họ và tên',
              hintText: 'Nhập họ và tên',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12.0),
          TextField(
            controller: controller.phoneController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Nhập email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
