import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

import '../../../models/account.dart';

class UserContact extends StatefulWidget {
  const UserContact({super.key});

  @override
  State<UserContact> createState() => _UserContactState();
}

class _UserContactState extends State<UserContact> {
  Account? account;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isEditName = false;
  bool isEditEmail = false;

  @override
  void initState() {
    getAccountInfo();
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
          const Text(
            'Thông tin liên hệ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: nameController,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Người nhận',
              prefixIcon: Icon(Icons.person_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: emailController,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Địa chỉ liên hệ',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: addressController,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Địa chỉ nhận hàng',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void getAccountInfo() {
    FirebaseService.fetchUserInfo((accountInfo) {
      setState(() {
        nameController.text = accountInfo.name;
        emailController.text = accountInfo.email;
        addressController.text = accountInfo.address;
      });
    });
  }
}
