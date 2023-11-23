import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/booking_list/controller/booking_list_controller.dart';
import 'package:pet_store/shared/items/item_booking.dart';

class BookingListPage extends GetView<BookingListController> {
  const BookingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
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
          'Đặt lịch của tôi',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() => controller.bookingServiceList.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ItemBooking(
                      booking: controller.bookingServiceList[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: controller.bookingServiceList.length,
                ))
              : const Center(
                  child: Text(
                  'Danh sách đặt lịch trống',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                )))
        ],
      ),
    );
  }
}
