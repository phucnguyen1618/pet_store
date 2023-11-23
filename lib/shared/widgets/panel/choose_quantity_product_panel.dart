import 'package:flutter/material.dart';

class ChooseQuantityProductPanel extends StatefulWidget {
  final double? width;
  final double? height;
  final int? initQuantity;
  final Function(int) onChoose;
  const ChooseQuantityProductPanel({
    super.key,
    this.width,
    this.height,
    required this.onChoose,
    this.initQuantity,
  });

  @override
  State<ChooseQuantityProductPanel> createState() =>
      _ChooseQuantityProductPanelState();
}

class _ChooseQuantityProductPanelState
    extends State<ChooseQuantityProductPanel> {
  int quantity = 1;

  @override
  void initState() {
    quantity = widget.initQuantity ?? 1;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChooseQuantityProductPanel oldWidget) {
    if (oldWidget.initQuantity != widget.initQuantity) {
      quantity = widget.initQuantity ?? 1;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonTheme(
          minWidth: widget.width ?? 64.0,
          height: widget.height ?? 36.0,
          child: MaterialButton(
            onPressed: () {
              setState(() {
                quantity++;
                widget.onChoose(quantity);
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: const BorderSide(width: 0.5, color: Colors.redAccent)),
            child: const Icon(
              Icons.add,
              color: Colors.redAccent,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ButtonTheme(
          minWidth: widget.width ?? 64.0,
          height: widget.height ?? 36.0,
          child: MaterialButton(
            onPressed: () {
              setState(() {
                quantity--;
                if (quantity <= 0) {
                  quantity = 1;
                }
                widget.onChoose(quantity);
              });
            },
            materialTapTargetSize: MaterialTapTargetSize.padded,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: const BorderSide(width: 0.5, color: Colors.redAccent)),
            child: const Icon(
              Icons.remove,
              color: Colors.redAccent,
            ),
          ),
        )
      ],
    );
  }
}
