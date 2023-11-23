part of 'sign_in_page.dart';

extension SignInExtension on SignInPage {
  Widget _buildSignInForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => TextInput(
                title: 'Email',
                hint: 'Nhập email đăng nhập',
                inputController: controller.emailController,
                validator: (value) => TextValidate.isEmailValidate(value),
                error: controller.emailError.value,
              ),
            ),
            const SizedBox(height: 12.0),
            Obx(
              () => TextInput(
                title: 'Mật khẩu',
                hint: 'Nhập mật khẩu',
                inputController: controller.passwordController,
                iconData: controller.isHidePassword.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onClick: () {
                  controller.onSetShowHidePassword();
                },
                note:
                    'Mật khẩu là một dãy văn bản có độ dài lớn hơn 8 và có ít nhất một chữ hoa, một chữ thường và một ký hiệu đặc biệt.',
                validator: (value) => TextValidate.isPasswordValidate(value),
                error: controller.passwordError.value,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.forgotPasswordPage);
                },
                child: const Text('Quên mật khẩu?'),
              ),
            ),
            const SizedBox(height: 24.0),
            ButtonTheme(
              height: 48.0,
              minWidth: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  controller.onSignInButtonClicked();
                },
                color: Colors.orange,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Text(
                  'Đăng nhập',
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
    );
  }
}
