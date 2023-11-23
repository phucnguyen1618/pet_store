import 'package:flutter/material.dart';

class ConfirmDeleteItemCartDialog extends StatelessWidget {
  final String name;

  const ConfirmDeleteItemCartDialog({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xoá item giỏ hàng ?'),
      content: RichText(
          text: TextSpan(
              text: 'Bạn có chắc chắn muốn xoá item ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              children: [
            TextSpan(
                text: name,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                )),
            const TextSpan(
                text: ' khỏi giỏ hàng ?',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ))
          ])),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'huỷ'.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            )),
        TextButton(
          onPressed: () {
            Navigator.pop(context, "confirmDelete");
          },
          child: Text('xác nhận xoá'.toUpperCase()),
        ),
      ],
    );
  }
}
