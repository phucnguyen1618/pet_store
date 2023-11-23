import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_store/models/order_detail.dart';
import 'package:pet_store/models/product.dart';
import 'package:pet_store/shared/services/firebase_service.dart';

import '../utils/app_utils.dart';

class ItemProductInOrder extends StatefulWidget {
  final OrderDetail orderDetail;
  const ItemProductInOrder({super.key, required this.orderDetail});

  @override
  State<ItemProductInOrder> createState() => _ItemProductInOrderState();
}

class _ItemProductInOrderState extends State<ItemProductInOrder> {
  Product? product;

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        children: [
          product != null
              ? ListTile(
                  horizontalTitleGap: 12.0,
                  leading: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          image: DecorationImage(
                            image: NetworkImage(product!.image),
                          ))),
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    product!.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppUtils.formatPrice(product!.getPrice()),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'x${widget.orderDetail.quantity}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void getInfo() {
    FirebaseService.getProductInfoByID(widget.orderDetail.idProduct,
        (infoProduct) {
      log('Product: ${infoProduct.toJson()}');
      setState(() {
        product = infoProduct;
      });
    }, (error) => log('Error: $error'));
  }
}
