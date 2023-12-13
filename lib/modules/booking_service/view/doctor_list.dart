import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

import '../../../models/doctor.dart';
import '../../../shared/items/item_doctor.dart';

class DoctorList extends StatefulWidget {
  final Function(Doctor) onChooseDoctor;

  const DoctorList({
    super.key,
    required this.onChooseDoctor,
  });

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  List<Doctor> doctorList = [];

  @override
  void initState() {
    getDoctorList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Danh sách bác sĩ',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Xem thêm',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4.0),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                  doctorList.length,
                  (index) => ItemDoctor(
                        onChoose: (doctor) {
                          widget.onChooseDoctor(doctor);
                        },
                        doctor: doctorList[index],
                      )).toList(),
            )),
      ],
    );
  }

  void getDoctorList() {
    FirebaseService.getDoctors((items) {
      setState(() {
        doctorList = items;
      });
    }, (error) => log('Error: $error'));
  }
}
