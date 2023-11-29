import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/booking_service/controller/booking_service_controller.dart';

import '../../../models/service.dart';
import '../../../shared/utils/app_utils.dart';

class ChooseBookingService extends StatelessWidget {
  const ChooseBookingService({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingServiceController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12.0),
          const Text(
            'Các dịch vụ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          Obx(() => controller.services.isNotEmpty
              ? DropdownButtonFormField<Service>(
                  value: controller.services[controller.serviceIndex],
                  hint: Text(controller.services[controller.serviceIndex].name),
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  items: controller.services
                      .map((e) => DropdownMenuItem<Service>(
                            value: e,
                            child: Text(
                                '${e.name} - Giá: ${AppUtils.formatPrice(e.price)}đ'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.onAddBookingService(value);
                    }
                  })
              : const CircularProgressIndicator()),
          const SizedBox(height: 8.0),
          Obx(() => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: controller.chooseServices
                    .map((e) => Chip(
                          elevation: 0,
                          side: const BorderSide(
                              width: 0.5, color: Colors.black12),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          padding: const EdgeInsets.all(4.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          avatar: CircleAvatar(
                              backgroundImage: NetworkImage(e.imageService)),
                          label: Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 14.0,
                          ),
                          deleteIconColor: Colors.black,
                          onDeleted: () {
                            controller.onRemoveBookingService(e);
                          },
                        ))
                    .toList(),
              )),
          const SizedBox(height: 24.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tổng chi phí: ',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(() => Text(
                    '${AppUtils.formatPrice(controller.totalAmount.value)}đ',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
