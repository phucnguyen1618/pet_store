import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

class UserContact extends StatefulWidget {
  const UserContact({super.key});

  @override
  State<UserContact> createState() => _UserContactState();
}

class _UserContactState extends State<UserContact> {
  User? currentUser;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isEditName = false;
  bool isEditEmail = false;

  @override
  void initState() {
    currentUser = FirebaseService.getCurrentUser();
    if (currentUser != null) {
      nameController.text = currentUser!.displayName!;
      emailController.text = currentUser!.email!;
    }
    nameController.addListener(() {
      String name = nameController.text;
      if (name != currentUser?.displayName) {
        isEditName = true;
      }
    });
    emailController.addListener(() {
      String email = emailController.text;
      if (email != currentUser?.email) {
        isEditEmail = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Thông tin liên hệ',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     _editUserInfo();
              //   },
              //   highlightColor: Colors.transparent,
              //   focusColor: Colors.transparent,
              //   hoverColor: Colors.transparent,
              //   splashColor: Colors.transparent,
              //   child: const Text(
              //     'Chỉnh sửa',
              //     style: TextStyle(
              //       fontSize: 16.0,
              //       color: Colors.blue,
              //     ),
              //   ),
              // )
            ],
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Người nhận',
              prefixIcon: Icon(Icons.person_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Địa chỉ liên hệ',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _editUserInfo() async {
    if (currentUser != null) {
      if (isEditName) {
        currentUser!.updateDisplayName(nameController.text);
      }
    }
  }
}
