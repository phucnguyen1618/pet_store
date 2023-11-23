import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseBirthdayBottomSheet extends StatefulWidget {
  const ChooseBirthdayBottomSheet({super.key});

  @override
  State<ChooseBirthdayBottomSheet> createState() =>
      _ChooseBirthdayBottomSheetState();
}

class _ChooseBirthdayBottomSheetState extends State<ChooseBirthdayBottomSheet> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Chọn ngày sinh của bạn',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24.0),
          ],
        ),
        Expanded(
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            dateOrder: DatePickerDateOrder.dmy,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              setState(() {
                dateTime = value;
              });
            },
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context, dateTime);
          },
          color: Colors.blue,
          elevation: 0.0,
          child: const Text(
            'Chọn',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
