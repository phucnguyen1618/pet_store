import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/booking_service/controller/booking_service_controller.dart';
import 'package:pet_store/modules/booking_service/view/choose_booking_service.dart';
import 'package:pet_store/modules/booking_service/view/doctor_list.dart';
import 'package:pet_store/modules/booking_service/view/orderer_info.dart';

class BookingServicePage extends GetView<BookingServiceController> {
  const BookingServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
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
          'Đặt lịch dịch vụ',
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
              mainAxisSize: MainAxisSize.min,
              children: [
            const OrdererInfo(),
            const SizedBox(height: 12.0),
            const ChooseBookingService(),
            const SizedBox(height: 12.0),
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Thông tin đặt lịch',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DatePicker(
                    DateTime.now(),
                    locale: 'vi_VN',
                    height: 88.0,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.green,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      controller.chooseBookingDateTime(date);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            DoctorList(onChooseDoctor: (doctor) {
              controller.idDoctorStr.value = doctor.id;
            }),
            const SizedBox(height: 24.0),
          ])),
      persistentFooterButtons: [
        Center(
          child: ButtonTheme(
            minWidth: Get.width - 16.0 * 2,
            height: 48.0,
            child: MaterialButton(
              onPressed: () {
                controller.onConfirmBookingService();
              },
              color: Colors.blue,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: const Text(
                'Xác nhận đặt lịch',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
