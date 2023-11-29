import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/routes/app_routes.dart';

class ItemDoctor extends StatelessWidget {
  final Function(String) onChoose;
  const ItemDoctor({
    super.key,
    required this.onChoose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 32 * 2,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70.0,
                height: 70.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage('assets/image_doctor.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Trần Ngọc Huỳnh Anh',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Bác sĩ phẫu thuật',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey.shade500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 4.0,
                          height: 4.0,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Text(
                          '2 năm kinh nghiệm',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey.shade500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.doctorDetailPage);
                  },
                  elevation: 0.0,
                  child: const Text(
                    'Xem chi tiết',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                MaterialButton(
                  onPressed: () {
                    onChoose('idBacSi');
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  elevation: 0.0,
                  child: const Text(
                    'Chọn bác sĩ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
