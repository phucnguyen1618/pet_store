import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_store/models/booking.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

class BookingListController extends GetxController {
  RxList<Booking> bookingServiceList = RxList<Booking>();

  @override
  void onInit() {
    FirebaseService.getBookingServiceList((dataList) {
      bookingServiceList.addAll(dataList);
    }, (error) {
      log('Error: $error');
    });
    super.onInit();
  }
}
