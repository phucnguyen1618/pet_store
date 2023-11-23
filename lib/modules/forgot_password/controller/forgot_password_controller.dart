import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/utils/dialog_utils.dart';
import 'package:pet_store/shared/widgets/dialog/notify_dialog.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxnString errorStr = RxnString();

  void onPasswordRetrieval() {
    if (emailController.text.isNotEmpty) {
      FirebaseService.passwordRetrieval(emailController.text);
      DialogUtils.showNotifyDialog(
          context: Get.context!, type: NotifyType.passwordRetrieval);
    } else {
      errorStr.value = 'Email không được để trống';
    }
  }
}
