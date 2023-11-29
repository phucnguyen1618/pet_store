import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/modules/doctor_detail/controller/doctor_detail_controller.dart';

part 'doctor_detail_extension.dart';

class DoctorDetailPage extends GetView<DoctorDetailController> {
  const DoctorDetailPage({super.key});

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
          ),
        ),
        title: const Text(
          'Dr.Trần Ngọc Hùng Anh',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage('assets/image_doctor.png'),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(height: 12.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Họ và tên:',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black26,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Trần Ngọc Hùng Anh',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            _buildDoctorInfo(),
            const SizedBox(height: 24.0),
            _buildWorkInfo(),
          ],
        ),
      ),
    );
  }
}
