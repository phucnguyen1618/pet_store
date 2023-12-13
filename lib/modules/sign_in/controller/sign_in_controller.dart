import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/utils/validate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/constants/strings.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final prefs = Get.find<SharedPreferences>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxnString emailError = RxnString();
  RxnString passwordError = RxnString();
  RxBool isHiddenPassword = RxBool(true);

  @override
  void onInit() {
    emailController.addListener(_handleErrorDataEmail);
    passwordController.addListener(_handleErrorDataPassword);
    super.onInit();
  }

  void onSignInButtonClicked() {
    if (formKey.currentState!.validate()) {
      FirebaseService.signIn(
        email: emailController.text,
        password: passwordController.text,
        onComplete: (id) {
          log('User ID: $id');
          prefs.setString(Strings.idUser, id);
          Get.toNamed(AppRoutes.homePage);
        },
        onError: (error) {
          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(SnackBar(content: Text(error)));
        },
      );
    }
  }

  void onSetShowHidePassword() {
    isHiddenPassword.value = !isHiddenPassword.value;
  }

  void _handleErrorDataEmail() {
    emailError.value = TextValidate.isEmailValidate(emailController.text);
  }

  void _handleErrorDataPassword() {
    passwordError.value =
        TextValidate.isPasswordValidate(passwordController.text);
  }
}
