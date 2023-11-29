part of 'doctor_detail_page.dart';

extension DoctorDetailExtension on DoctorDetailPage {
  Widget _buildDoctorInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Thông tin bác sĩ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          _buildItemLabel(
            'Họ và tên: Trần Ngọc Huỳnh Anh',
            Icons.account_circle_outlined,
          ),
          const SizedBox(height: 8.0),
          _buildItemLabel(
            'Số điện thoại: 0365276885',
            Icons.call_outlined,
          ),
          const SizedBox(height: 8.0),
          _buildItemLabel(
            'Ngày sinh: 25/05/2003',
            Icons.cake_outlined,
          ),
          const SizedBox(height: 8.0),
          _buildItemLabel(
            'Giới tính: Nam',
            Icons.transgender_outlined,
          ),
          const SizedBox(height: 8.0),
          _buildItemLabel(
            'Bệnh viên trung ương 108',
            Icons.work_outline_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Chứng chỉ, trình độ, chuyên môn',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                10,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 4.0,
                            height: 4.0,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Chứng chỉ tiếng Anh IELTS 9.0',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color.fromARGB(255, 1, 38, 202),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Từ tháng 6 - 2023',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildItemLabel(String content, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.black26,
        ),
        const SizedBox(width: 8.0),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
