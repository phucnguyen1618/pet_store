import 'package:flutter/material.dart';

class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({super.key});

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  int paymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Chọn phương thức thanh toán',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            value: 0,
            groupValue: paymentMethod,
            title: const Text('Thanh toán sau khi nhận hàng'),
            onChanged: (value) {
              setState(() {
                paymentMethod = value ?? 0;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: paymentMethod,
            title: const Text('Thanh toán với PayPal'),
            onChanged: (value) {
              setState(() {
                paymentMethod = value ?? 1;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Hủy',
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context, paymentMethod);
            },
            child: Text('Chọn'))
      ],
    );
  }
}
