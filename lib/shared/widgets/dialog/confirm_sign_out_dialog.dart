import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmSignOutDialog extends StatelessWidget {
  const ConfirmSignOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Đăng xuất',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Bạn có chắc chắn muốn đăng xuất khỏi ứng dụng không ?',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Không'.toUpperCase())),
        TextButton(
            onPressed: () {
              Get.back(result: 'signOut');
            },
            child: Text(
              'Có'.toUpperCase(),
              style: const TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
