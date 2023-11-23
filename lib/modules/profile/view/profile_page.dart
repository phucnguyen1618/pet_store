import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/profile/controller/profile_controller.dart';
import 'package:pet_store/shared/utils/bottomsheet_utils.dart';
import 'package:pet_store/shared/widgets/text_input.dart';

import '../../../shared/utils/dialog_utils.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
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
          'Thông tin người dùng',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                DialogUtils.showConfirmSignOut(context, () {
                  controller.onSignOut();
                });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24.0),
            Center(
              child: Container(
                width: 120.0,
                height: 120.0,
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            TextInput(
              title: 'Họ và tên',
              hint: 'Nhập họ và tên',
              inputController: controller.nameController,
            ),
            const SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Giới tính: ',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                    child: Obx(
                  () => RadioListTile(
                    value: 0,
                    groupValue: controller.sex.value,
                    title: const Text('Nam'),
                    onChanged: (value) {
                      controller.onSetUserGender(value ?? 0);
                    },
                  ),
                )),
                Expanded(
                    child: Obx(
                  () => RadioListTile(
                    value: 1,
                    groupValue: controller.sex.value,
                    title: const Text('Nữ'),
                    onChanged: (value) {
                      controller.onSetUserGender(value ?? 1);
                    },
                  ),
                ))
              ],
            ),
            const SizedBox(height: 12.0),
            TextInput(
              title: 'Email',
              hint: 'Nhập email',
              isReadOnly: true,
              inputController: controller.emailController,
            ),
            const SizedBox(height: 12.0),
            TextInput(
              title: 'Số điện thoại',
              hint: 'Nhập số điện thoại',
              inputController: controller.phoneController,
            ),
            const SizedBox(height: 12.0),
            TextInput(
              title: 'Ngày sinh',
              hint: 'Nhập ngày sinh',
              inputController: controller.birthDayController,
              isReadOnly: true,
              iconData: Icons.event,
              onClick: () {
                BottomSheetUtils.showChooseBirthdayBottomSheet(context,
                    (dateTime) {
                  controller.onSetBirthDay(dateTime);
                });
              },
            ),
            const SizedBox(height: 36.0),
            MaterialButton(
              onPressed: () {
                controller.onUpdateUserInfoClick();
              },
              color: Colors.blueAccent,
              minWidth: double.infinity,
              height: 48.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              elevation: 0.0,
              child: const Text(
                'Cập nhật thông tin người dùng',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
