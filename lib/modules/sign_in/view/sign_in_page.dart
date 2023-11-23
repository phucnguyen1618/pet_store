import 'package:get/get.dart';
import 'package:pet_store/modules/sign_in/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/utils/validate.dart';
import 'package:pet_store/shared/widgets/text_input.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

part 'sign_in_extension.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/pet_store_icon.png',
                width: 64.0,
                height: 64.0,
              ),
              const SizedBox(height: 16.0),
              ListTile(
                title: GradientText(
                  'Pet Store',
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: const [
                    Colors.orange,
                    Colors.pink,
                    Colors.red,
                  ],
                ),
                subtitle: const Text(
                  'Nơi những con vật được quan tâm',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.pink,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: TextButton(
                  child: const Text('Đăng ký'),
                  onPressed: () {
                    Get.toNamed(AppRoutes.signUpPage);
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              _buildSignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
