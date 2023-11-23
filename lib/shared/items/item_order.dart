import 'package:flutter/material.dart';
import 'package:pet_store/models/order.dart';

import '../utils/app_utils.dart';
import 'item_product_in_order.dart';

class ItemOrder extends StatelessWidget {
  final Order order;

  const ItemOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text(
            'Ngày đặt hàng:',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
          subtitle: Text(
            AppUtils.formatOrderDateTime(order.orderDateTime),
            style: const TextStyle(fontSize: 12.0),
          ),
          trailing: Text(
            AppUtils.formatOrderStatus(order.status),
            style: TextStyle(
              color: AppUtils.formatOrderStatusColor(order.status),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: order.orderDetails.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              ItemProductInOrder(orderDetail: order.orderDetails[index]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Tổng tiền:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppUtils.formatPrice(order.totalAmount),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        order.status == 0
            ? InkWell(
                onTap: () {},
                child: Container(
                  width: baseWidth - 2 * 12,
                  margin: const EdgeInsets.only(
                      bottom: 12.0, left: 12.0, right: 12.0),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(width: 1.0, color: Colors.black12)),
                  child: const Text(
                    'Huỷ đơn hàng',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
