import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/models/account.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

import '../../../shared/utils/app_utils.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxInt sex = RxInt(-1);
  Rxn<DateTime> birthDay = Rxn<DateTime>();
  Rxn<Account> accountInfo = Rxn<Account>();

  @override
  void onInit() {
    onGetUserInfo();
    super.onInit();
  }

  void onGetUserInfo() {
    FirebaseService.fetchUserInfo((account) {
      accountInfo.value = account;
      nameController.text = account.name;
      emailController.text = account.email;
      if (account.sex != null) {
        sex.value = account.sex!;
      }
      if (account.phone != null) {
        phoneController.text = account.phone!;
      }
      if (account.birthDay != null) {
        birthDay.value = account.birthDay;
        birthDayController.text = AppUtils.formatBirthDay(account.birthDay!);
      }
    });
  }

  void onSetUserGender(int value) {
    sex.value = value;
  }

  void onSetBirthDay(DateTime dateTime) {
    birthDay.value = dateTime;
    birthDayController.text = AppUtils.formatBirthDay(dateTime);
  }

  void onUpdateUserInfoClick() {
    FirebaseService.updateNameUser(nameController.text);
    if (sex.value != -1) {
      FirebaseService.updateSex(sex.value);
    }
    if (phoneController.text.isNotEmpty) {
      FirebaseService.updatePhoneUser(phoneController.text);
    }
    if (birthDay.value != null) {
      FirebaseService.updateBirthday(birthDay.value!);
    }
  }

  void onSignOut() {
    FirebaseService.signOut();
    Get.offAllNamed(AppRoutes.signInPage);
  }
}
