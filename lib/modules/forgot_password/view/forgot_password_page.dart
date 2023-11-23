import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pet_store/modules/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12.0),
            const Text(
              'Để lấy lại mật khẩu tài khoản đã đăng ký, bạn vui lòng nhập email đã đăng ký tài khoản vào chỗ bên dưới. Chúng tôi sẽ gửi link để bạn lấy lại mật khẩu',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12.0),
            Obx(() => TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                hintText: 'Nhập email của bạn ở đây',
                errorText: controller.errorStr.value
              ),
            )),
            const SizedBox(height: 24.0),
            Center(
              child: TextButton(
                onPressed: () {
                  controller.onPasswordRetrieval();
                },
                child: Text('lấy lại mật khẩu'.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
