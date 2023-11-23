import 'package:flutter/material.dart';

class NotifyDialog extends StatefulWidget {
  final NotifyType notifyType;

  const NotifyDialog({
    super.key,
    required this.notifyType,
  });

  @override
  State<NotifyDialog> createState() => _NotifyDialogState();
}

class _NotifyDialogState extends State<NotifyDialog> {
  @override
  Widget build(BuildContext context) {
    switch (widget.notifyType) {
      case NotifyType.passwordRetrieval:
        return _buildPasswordRetrieval();
      default:
        return const SizedBox();
    }
  }

  Widget _buildPasswordRetrieval() {
    return AlertDialog(
      title: const Text(
        'Thông báo',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
          'Chúng tôi đã gửi link reset mật khẩu đến email của bạn. Vui lòng check email.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Đóng'.toUpperCase()),
        )
      ],
    );
  }
}

enum NotifyType { passwordRetrieval }
