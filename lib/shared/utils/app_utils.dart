import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/cart.dart';
import '../constants/strings.dart';

class AppUtils {
  static String formatPrice(double value) {
    return NumberFormat('#,###').format(value);
  }

  static String formatBirthDay(DateTime dateTime) {
    return DateFormat(Strings.DATETIME_BIRTHDAY_FORMAT).format(dateTime);
  }

  static String formatOrderDateTime(DateTime dateTime) {
    return DateFormat(Strings.DATETIME_ORDER_FORMAT).format(dateTime);
  }

  static String formatBookingDateTime(DateTime dateTime) {
    return DateFormat(Strings.DATETIME_BOOKING_FORMAT).format(dateTime);
  }

  static String generateNameAvatar(String fullName) {
    String nameAvatar = '';
    final splitted = fullName.split(' ');
    for (var str in splitted) {
      nameAvatar = nameAvatar + str.substring(0, 1);
    }
    return nameAvatar;
  }

  static double calculateTotalPrice(List<Cart> dataList) {
    double totalAmount = 0;
    for (var data in dataList) {
      totalAmount = totalAmount +
          data.quantity *
              (data.product.getPrice() * (data.product.discount ?? 1.0));
    }
    return totalAmount;
  }

  static double calculateBookingPrice(List<double> dataList) {
    double totalAmount = 0;
    for (var data in dataList) {
      totalAmount = totalAmount + data;
    }
    return totalAmount;
  }

  static String formatOrderStatus(int status) {
    return status == 0
        ? 'Đã đặt hàng'
        : status == 1
            ? 'Đã xác nhận'
            : 'Đã huỷ';
  }

  static Color formatOrderStatusColor(int status) {
    return status == 0
        ? Colors.black
        : status == 1
            ? Colors.green
            : Colors.redAccent;
  }

  static String formatBookingStatus(int status) {
    return status == 0
        ? 'Đang chờ'
        : status == 1
            ? 'Đã xác nhận'
            : 'Đã huỷ';
  }

  static Color formatBookingStatusColor(int status) {
    return status == 0
        ? Colors.orange
        : status == 1
            ? Colors.green
            : Colors.redAccent;
  }
}
