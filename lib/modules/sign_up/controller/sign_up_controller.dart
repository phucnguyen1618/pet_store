import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/models/account.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/constants/strings.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final prefs = Get.find<SharedPreferences>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isAccept = RxBool(false);
  Rxn<DateTime> birthDay = Rxn<DateTime>();

  void onSignUpButtonClicked({Function(String)? onError}) {
    if (formKey.currentState!.validate()) {
      if (isAccept.value) {
        FirebaseService.signUp(
            email: emailController.text,
            password: passwordController.text,
            onComplete: (id) {
              prefs.setString(Strings.idUser, id);
              final account = Account(id, fullNameController.text, null,
                  emailController.text, birthDay.value, null);
              FirebaseService.writeAccountToDb(account);
              Get.offAllNamed(AppRoutes.homePage);
            },
            onError: (error) {
              if (onError != null) {
                onError(error);
              }
            });
      } else {
        if (onError != null) {
          onError('Bạn chưa đồng ý với điều khoản của chúng tôi');
        }
      }
    }
  }

  void onSetIsAccept(bool value) {
    isAccept.value = value;
  }
}
