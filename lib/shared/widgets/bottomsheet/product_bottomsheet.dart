import 'package:flutter/material.dart';
import 'package:pet_store/models/product.dart';
import 'package:pet_store/shared/widgets/panel/choose_quantity_product_panel.dart';

import '../../utils/app_utils.dart';

class ProductBottomSheet extends StatefulWidget {
  final Product product;
  const ProductBottomSheet({
    super.key,
    required this.product,
  });

  @override
  State<ProductBottomSheet> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  double totalPrice = 0.0;
  bool isShowFull = false;
  int quantityProduct = 1;

  @override
  void initState() {
    totalPrice = widget.product.getPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.redAccent,
                    image: DecorationImage(
                        image: NetworkImage(widget.product.image))),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Giá sản phẩm: ",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: [
                              TextSpan(
                                  text:
                                      '${AppUtils.formatPrice(widget.product.getPrice())} đ',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                        const SizedBox(width: 12.0),
                        widget.product.discount != null
                            ? Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.arrow_downward,
                                      color: Colors.redAccent.shade100,
                                      size: 16.0,
                                    ),
                                    Text(
                                      '${widget.product.discount! * 100}%',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.redAccent.shade100,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Tổng:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${AppUtils.formatPrice(totalPrice)} đ',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
                ChooseQuantityProductPanel(
                  onChoose: (quantity) {
                    setState(() {
                      quantityProduct = quantity;
                      totalPrice = widget.product.getPrice() * quantity;
                    });
                  },
                ),
              ],
            ),
          ),
          widget.product.desc != null
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Mô tả',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        AnimatedCrossFade(
                          firstChild: Text(
                            widget.product.desc!,
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          secondChild: Text(widget.product.desc!),
                          crossFadeState: isShowFull
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: kThemeAnimationDuration,
                        ),
                        const SizedBox(height: 4.0),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  isShowFull = !isShowFull;
                                });
                              },
                              child: Text(
                                isShowFull ? 'Rút gọn' : 'Xem thêm',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              : const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        "quantity": quantityProduct,
                        "isBuyNow": false,
                      });
                    },
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side:
                          const BorderSide(width: 0.5, color: Colors.redAccent),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Thêm vào giỏ hàng',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        "quantity": quantityProduct,
                        "isBuyNow": true,
                      });
                    },
                    elevation: 0.0,
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side:
                          const BorderSide(width: 0.5, color: Colors.redAccent),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'Mua ngay',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
