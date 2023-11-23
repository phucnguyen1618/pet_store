import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store/models/booking.dart';
import 'package:pet_store/models/booking_detail.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../models/service.dart';
import '../../../shared/constants/strings.dart';

class BookingServiceController extends GetxController {
  final serviceIndex = Get.arguments as int;
  final prefs = Get.find<SharedPreferences>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxList<Service> services = RxList<Service>();
  RxList<Service> chooseServices = RxList<Service>();
  RxList<double> servicePrices = RxList<double>();
  Rx<DateTime> bookingDateTime = Rx<DateTime>(DateTime.now());
  RxDouble totalAmount = RxDouble(0);

  @override
  void onInit() {
    final currentUser = FirebaseService.getCurrentUser();
    if (currentUser != null) {
      nameController.text = currentUser.displayName!;
      phoneController.text = currentUser.email!;
    }
    FirebaseService.getServices((dataList) {
      services.addAll(dataList);
      chooseServices.add(services[serviceIndex]);
      servicePrices.add(services[serviceIndex].price);
      totalAmount.value = AppUtils.calculateBookingPrice(servicePrices);
    });
    super.onInit();
  }

  void onAddBookingService(Service service) {
    if (chooseServices.isEmpty) {
      chooseServices.add(service);
      servicePrices.add(service.price);
    } else {
      if (chooseServices.contains(service)) {
        EasyLoading.showToast('Bạn đã thêm dịch vụ này');
      } else {
        chooseServices.add(service);
        servicePrices.add(service.price);
      }
    }
    totalAmount.value = AppUtils.calculateBookingPrice(servicePrices);
  }

  void chooseBookingDateTime(DateTime dateTime) {
    bookingDateTime.value = dateTime;
  }

  void onRemoveBookingService(Service service) {
    chooseServices.remove(service);
    servicePrices.remove(service.price);
    totalAmount.value = AppUtils.calculateBookingPrice(servicePrices);
  }

  void onConfirmBookingService() {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      String idBooking = const Uuid().v4();
      final bookingDetails = chooseServices
          .map((e) => BookingDetail(e.idService, e.price))
          .toList();
      final booking = Booking(idBooking, idUser, 'idDoctor', bookingDetails,
          bookingDateTime.value, null, totalAmount.value, 0);
      FirebaseService.writeBookingServiceToDb(
        booking,
        () {
          EasyLoading.showSuccess('Đặt lịch thành công');
          Get.offAllNamed(AppRoutes.homePage);
        },
        (error) {
          log('Error: $error');
          EasyLoading.showError('Đã có lỗi xảy ra');
        },
      );
    }
  }
}
