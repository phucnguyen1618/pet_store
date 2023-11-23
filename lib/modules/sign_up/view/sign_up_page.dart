import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/sign_up/controller/sign_up_controller.dart';

import 'package:flutter/material.dart';
import 'package:pet_store/shared/utils/app_utils.dart';
import 'package:pet_store/shared/utils/bottomsheet_utils.dart';
import 'package:pet_store/shared/utils/validate.dart';
import 'package:pet_store/shared/widgets/text_input.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Đăng ký tài khoản',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextInput(
                title: 'Họ và tên',
                hint: 'Nhập họ và tên',
                inputController: controller.fullNameController,
                isRequied: true,
                validator: (value) => TextValidate.isFullNameValidate(value),
              ),
              const SizedBox(height: 12.0),
              TextInput(
                title: 'Ngày sinh',
                hint: 'dd/MM/yyyy',
                inputController: controller.birthDayController,
                iconData: Icons.event,
                onClick: () {
                  BottomSheetUtils.showChooseBirthdayBottomSheet(context,
                      (value) {
                    controller.birthDayController.text =
                        AppUtils.formatBirthDay(value);
                  });
                },
              ),
              const SizedBox(height: 12.0),
              TextInput(
                title: 'Email',
                hint: 'Nhập email',
                inputController: controller.emailController,
                isRequied: true,
                validator: (value) => TextValidate.isEmailValidate(value),
              ),
              const SizedBox(height: 12.0),
              TextInput(
                title: 'Mật khẩu',
                hint: 'Nhập mật khẩu',
                inputController: controller.passwordController,
                note:
                    'Mật khẩu là một dãy văn bản có độ dài lớn hơn 8 và có ít nhất một chữ hoa, một chữ thường và một ký hiệu đặc biệt.',
                isRequied: true,
                validator: (value) => TextValidate.isPasswordValidate(value),
              ),
              const SizedBox(height: 16.0),
              Obx(() => CheckboxListTile(
                    value: controller.isAccept.value,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      'Bằng cách nhấn vào nút "Đăng ký", bạn đã chấp nhận tuân thủ theo điều khoản chính sách quyền riêng tư của chúng tôi.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    onChanged: (value) {
                      controller.onSetIsAccept(value ?? false);
                    },
                  )),
              const SizedBox(height: 48.0),
              ButtonTheme(
                height: 48.0,
                minWidth: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    controller.onSignUpButtonClicked(onError: (error) {
                      EasyLoading.showError(error);
                    });
                  },
                  color: Colors.orange,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
