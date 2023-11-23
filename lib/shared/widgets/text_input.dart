import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController inputController;
  final String? note;
  final bool? isRequied;
  final String? error;
  final IconData? iconData;
  final bool? isReadOnly;
  final Widget? child;
  final String? Function(String?)? validator;
  final Function()? onClick;

  const TextInput({
    super.key,
    required this.title,
    required this.hint,
    required this.inputController,
    this.note,
    this.isRequied,
    this.error,
    this.iconData,
    this.isReadOnly,
    this.child,
    this.validator,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
            text: TextSpan(
          text: title,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.blue,
          ),
          children: (isRequied != null && isRequied!)
              ? [
                  const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      ))
                ]
              : null,
        )),
        const SizedBox(height: 4.0),
        TextFormField(
          controller: inputController,
          readOnly: isReadOnly ?? false,
          decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(),
              helperMaxLines: 2,
              helperText: note,
              errorText: error,
              suffixIcon: IconButton(
                  onPressed: () {
                    if (onClick != null) {
                      onClick!();
                    }
                  },
                  icon: Icon(iconData))),
          validator: validator,
        ),
      ],
    );
  }
}
